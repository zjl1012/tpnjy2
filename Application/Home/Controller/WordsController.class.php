<?php
namespace Home\Controller;
use Think\Page;
use Org\Net\Http;
class WordsController extends HomeController{
	protected function tcategory(){return M('category');}
	protected function tdocument(){return M('document');}
	protected function indexcityxz(){return A('Index')->cityxz();}//调用Indexcontroller中的cityxz方法
	protected function indexzdcity(){return A('Index')->zdcity();}
	protected function qnj_row($row){return $this->tcategory()->where('status=1 and name="%s"',$row)->field('list_row')->find()['list_row'];}//每页条数
	protected function qnj_row1($row){return $this->tcategory()->where('status=1 and id=%d',$row)->field('list_row')->find()['list_row'];}//每页条数
	public function words(){
		$w=M('words');
		$w->uid=session('username');
		$w->gid=(I('post.gid'));
		$w->ggid=(I('post.ggid'));
		$w->create_time=time();
		$w->text=I('post.ppcon');
		if($_FILES['t123']['name']!=''){
	    		$upload = new \Think\Upload();// 实例化上传类   
		  		$upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');
		  		$upload->savePath  =      '/Picture/'; 
		  		$info   =   $upload->uploadOne($_FILES['t123']); 
		  		if(!$info) {
		  			$this->assign('id',I('post.ggid'));
		    		$this->assign('tishi','上传图片失败');
		    		$this->display('Article/words1');  
		  		}else{
		  			$w->picpath='/Uploads'.$info['savepath'].$info['savename'];
					$res=$w->add();
		  			if($res){
		  				$this->assign('id',I('post.ggid'));
		    			$this->assign('tishi','提交评价成功');
		    			$this->display('Article/words1');  		  				
		  			}else{
		  				$this->assign('id',I('post.ggid'));
		  				$this->assign('tishi','提交评价失败,请重试');
		    			$this->display('Article/words1');  	
		  			}
		  		}
			}else{
				$res=$w->add();
				if($res){
					$this->assign('id',I('post.ggid'));
	    			$this->assign('tishi','提交评价成功');
	    			$this->display('Article/words1');  		  				
		  		}else{
		  			$this->assign('id',I('post.ggid'));
	  				$this->assign('tishi','提交评价失败,请重试');
	    			$this->display('Article/words1');  	
	  			}
			}
		}


		public function wapword(){
			$w=M('words');
			if(empty(session('username'))){
				redirect('/Login/login');die;
			}
			$w->uid=session('username');
			$w->gid=I('post.gid');
			$w->ggid=I('post.ggid','','intval');
			$w->create_time=time();
			$w->text=I('post.ppcon');	
			$res=$w->add();
			if($res){
				echo 1;
			}else{
				echo 0;
			}
		}

		/*旅游包车*/
		public function rentcar(){
			$rentcark['v_document.status']=1;
			$rentcark['v_document.title']=array('neq','');
			$rentcark['v_document_chartered.carprice']=array('neq','');
			$rentcark['v_document_chartered.username']=array('neq','');
			$rentcark['v_document_chartered.rentcarcity']=array('neq','');
			$rentcark['v_document_chartered.rentcartype']=array('neq','');
			if($this->getChildrenIds(139)){
				$rentcark['v_document.category_id']=array('in',$this->getChildrenIds(139));
			}else{
				$rentcark['v_document.category_id']=array('eq',139);
			}
			$rentcarcount=$this->tdocument()
					 	->join('v_category ON v_document.category_id=v_category.id')
					 	->join('v_picture ON v_document.cover_id=v_picture.id')
					 	->join('v_document_chartered ON v_document.id=v_document_chartered.id')
					 	->where($rentcark)
					 	->count();
			$rentcarpage=new Page($rentcarcount,$this->qnj_row1(139));
			$rentcarres=$this->tdocument()
				 	  ->join('v_category ON v_document.category_id=v_category.id')
				   	  ->join('v_picture ON v_document.cover_id=v_picture.id')
				   	  ->join('v_document_chartered ON v_document.id=v_document_chartered.id')
				   	  ->where($rentcark)
				   	  ->field('v_document.id,v_document.title,v_document.description,v_document_chartered.username,v_document_chartered.rentcartype,v_picture.path,v_document_chartered.rentcarcity,v_document_chartered.carprice,v_category.title as title1,v_document_chartered.phone,v_document.create_time')
				      ->limit($page->firstRow.','.$this->qnj_row1(139))
				   	  ->order('v_document.create_time desc')
				   	  ->select();
			foreach($rentcarres as $key=>$v){$rentcarres[$key]['viplong']=ceil((time()-$v['create_time'])/31536000);}
			$rentcarshow=$rentcarpage->show();	
			$this->assign('rentcarlist',$rentcarres);		
			$this->assign('rentcarshow',$rentcarshow);		
		}

	/**
	*旅游包车模块搜索  字符串条件预处理d为整型 f为浮点型 s为字符串型 
	*strFilter过滤非法字符
	*/
	public function qnjcar(){//去农家点击"北京"后的数据和条件
		//符合条件的内容
		$catepid=$this->tcategory()->where("name='%s'",I('get.category'))->field('id')->find()['id'];
		if($this->getChildrenIds($catepid)){
			$k['v_document.category_id']=array('in',$this->getChildrenIds($catepid));
		}else{
			$k['v_document.category_id']=array('eq',$catepid);
		}
		$k['v_document.status']=1;
		$k['v_document.title']=array('neq','');
		if(empty(I('get.scenic'))){//获取风景名称或拓展项目
			$k['v_document_chartered.rentcartype']=array('neq','');
		}else{
			$k['v_document_chartered.rentcartype']=strFilter(I('get.scenic'));
		}
		if(empty(I('get.city'))){//获取当前城市"海淀"或拓展基地
			$k['v_document_chartered.rentcarcity']=array('neq','');
		}else{
			$k['v_document_chartered.rentcarcity']=strFilter(I('get.city'));
		}
		if(!empty(I('get.carprice'))){//获取拓展价格
			$k['v_document_chartered.carprice']=strFilter(I('get.carprice')).'/天';
		}
		$k['v_category.name']=strFilter(I('get.citynum'));//根据省份标识
		$count=$this->tdocument()
				 	->join('v_picture ON v_document.cover_id=v_picture.id')
				 	->join('v_category ON v_document.category_id=v_category.id')
				 	->join('v_document_chartered ON v_document_chartered.id=v_document.id')
				 	->where($k)->count();//查询符合条件的总数
		$page=new Page($count,$this->qnj_row(strFilter(I('get.citynum'))));
		// $k['v_document.zhuangtai']=array('neq',5);
		$res=$this->tdocument()
				  ->join('v_picture ON v_picture.id=v_document.cover_id')
		 		  ->join('v_category ON v_category.id=v_document.category_id')
			   	  ->join('v_document_chartered ON v_document_chartered.id=v_document.id')
			      ->where($k)
			      ->field('v_document.id,v_document.title,v_document.description,v_document.zhuangtai,v_document_chartered.phone,v_document_chartered.rentcartype,v_document.create_time,v_picture.path,v_category.title as cityname,v_document_chartered.carprice')
			   	  ->limit($page->firstRow.','.$this->qnj_row(strFilter(I('get.citynum'))))
			   	  ->order('v_document.zhuangtai desc,v_document.update_time desc')
			      ->select();	//不包含推广的内容
		foreach($res as $key=>$v){$res[$key]['viplong']=ceil((time()-$v['create_time'])/31536000);}//计算商家入驻多长时间	
		$show=$page->show();//以上是符合条件的内容和分页
		if($this->getChildrenIds($catepid)){
			$k1['v_document.category_id']=array('in',$this->getChildrenIds($catepid));
		}else{
			$k1['v_document.category_id']=array('eq',$catepid);
		}
		$k1['v_document.status']=1;
		$k1['v_document.title']=array('neq','');
		$k1['v_document_chartered.rentcartype']=array('neq','');
		$k11['v_document_chartered.rentcartype']=array('neq','');
		// $k1['v_document_article.username']=array('neq','');
		$k1['v_category.name']=strFilter(I('get.citynum'));
		$scity=$this->tdocument()
				   ->join('v_document_chartered ON v_document.id=v_document_chartered.id')
				   ->join('v_category ON v_document.category_id=v_category.id')
				   ->where($k1)->where($k11)->distinct(true)->field('v_document_chartered.rentcarcity')
				   ->select();//渲染到下一个页面的条件 如"昌平区"
		$scity1=$this->tdocument()
				   ->join('v_document_chartered ON v_document.id=v_document_chartered.id')
				   ->join('v_category ON v_document.category_id=v_category.id')
				   ->where($k1)->where($k11)->distinct(true)->field('v_document_chartered.rentcartype as fjmc')
				   ->select();//渲染到下一个页面的条件 如"白羊沟"
		$carpricezu=$this->tdocument()
					 	->join('v_picture ON v_document.cover_id=v_picture.id')
					 	->join('v_category ON v_document.category_id=v_category.id')
					 	->join('v_document_chartered ON v_document_chartered.id=v_document.id')
					 	->where($k1)->where('v_document_chartered.rentcartype="%s"',strFilter(I('get.scenic')))->distinct(true)
					 	->field('v_document_chartered.carprice')
					 	->select();

		$moban=$this->tcategory()->where('name="%s"',I('get.category'))->field('template_index')->find()['template_index'];//渲染模版

		$ciytname=$this->tcategory()->where('name="%s"',strFilter(I('get.citynum')))->field('title')->find()['title'];
		if(!$scity1 && !$res){//如果参数有误导致查不出数据和景点名称就回到最开始的时候

		}
		$this->assign('show',$show);//数据分页
		$this->assign('rentcarlist',$res);//符合条件的内容 不包含推广
		$this->assign('tlist',$tres);//符合条件的内容 推广
		$this->assign('citynum',strFilter(I('get.citynum')));//当前省份的标识
		$this->assign('cityname',$ciytname);//当前省份的名称"北京"
		$this->assign('city',strFilter(I('get.city')));//市区"昌平区" 名称
		$this->assign('scity',$scity);//省下的市区名称
		$this->assign('scity1',$scity1);//市下的景区名称
		$this->assign('scenic',strFilter(I('get.scenic')));//选中的景区名称 
		$this->assign('category',strFilter(I('get.category')));//选中的类别name
		$this->assign('carprice',I('get.carprice'));//选中的拓展价格
		$this->assign('carpricezu',$carpricezu);//包车价格组
		$this->assign('njyclass',strFilter(I('get.njyclass','','intval')));//选中的农家院类型
		$this->indexcityxz();
		$this->display($moban);
	}



    protected function getChildrenIds ($sort_id=''){
   		$d=M('category');
       	$result = $d->where('pid='.intval($sort_id))->field('id')->select();
       	if ($result){
           foreach ($result as $key=>$val){
               $ids.= ','.$val['id'];
               $ids.= $this->getChildrenIds ($val['id']);
           }
       }
       return $ids;
	}

}


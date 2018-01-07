<?php
namespace Home\Controller;
use Think\Page;
use Org\Net\Http;
/**
 * 文档模型控制器
 * 文档模型列表和详情
 */
class ArticleController extends HomeController {
	protected function tcategory(){return M('category');}
	protected function tdocument(){return M('document');}
	protected function tarticle	(){return M('article');}
	protected function indexcityxz(){return A('Index')->cityxz();}//调用Indexcontroller中的cityxz方法
	protected function indexzdcity(){return A('Index')->zdcity();}
	protected function qnj_row($row){return $this->tcategory()->where('status=1 and name="%s"',$row)->field('list_row')->find()['list_row'];}//每页条数
	protected function qnj_row1($row){return $this->tcategory()->where('status=1 and id=%d',$row)->field('list_row')->find()['list_row'];}//每页条数
    /* 文档模型频道页 */
	public function index(){
		/* 分类信息 */
		$this->deadlines();//判断到期时间
		$category = $this->category();
		//频道页只显示模板，默认不读取任何内容
		//内容可以通过模板标签自行定制
		if($category['name']=='njy' || $category['name']=='tzxl'){
			$k['v_document.status']=1;
			$k['v_document.title']=array('neq','');
			$k['v_document.deadline']=array('gt',time());
			$k['v_document_article.fjmc']=array('neq','');
			$k['v_document_article.city']=array('neq','');
			$k['v_document_article.username']=array('neq','');
			if($this->getChildrenIds($category['id'])){
				$k['v_document.category_id']=array('in',$this->getChildrenIds($category['id']));
			}else{
				$k['v_document.category_id']=array('eq',$category['id']);
			}
			$count=$this->tdocument()
					 	->join('v_category ON v_document.category_id=v_category.id')
					 	->join('v_picture ON v_document.cover_id=v_picture.id')
					 	->join('v_document_article ON v_document.id=v_document_article.id')
					 	->where($k)
					 	->count();
			$page=new Page($count,$this->qnj_row1($category['id']));
			$res=$this->tdocument()
				 	  ->join('v_category ON v_document.category_id=v_category.id')
				   	  ->join('v_picture ON v_document.cover_id=v_picture.id')
				   	  ->join('v_document_article ON v_document.id=v_document_article.id')
				   	  ->where($k)
				   	  ->field('v_document.id,v_document.title,v_document.description,v_document_article.phone,v_document_article.address,v_picture.path,v_document_article.city,v_document_article.fjmc,v_category.title as title1,v_document.create_time,v_document.time_long,v_document.deadline,v_document_article.tzprice')
				      ->limit($page->firstRow.','.$this->qnj_row1($category['id']))
				   	  ->order('v_document.create_time desc')
				   	  ->select();
			foreach($res as $key=>$v){
				$res[$key]['viplong']=ceil((time()-$v['create_time'])/31536000);
			}
			$show=$page->show();
			$this->assign('list',$res);//去农家or拓展训练 模块
			$this->assign('show',$show);//去农家or拓展训练 分页
		}
		/*手机版目的地点击省份后的数据 省下的所有城市*/
		$mddcityk['v_document.status']=1;
		$mddcityk['v_document.name']=array('neq','');
		$mddcityk['v_category.name']=$category['name'];
		$mddcityk['v_document.category_id']=array('in',$this->getChildrenIds(61));
		$mddcity=$this->tdocument()
		            ->join('v_document_article ON v_document_article.id=v_document.id')
		            ->join('v_category ON v_category.id=v_document.category_id')
		            ->join('v_picture ON v_picture.id=v_document.cover_id')
		            ->where($mddcityk)->field('v_document.title,v_document.id,v_document.name,v_category.name as cname,v_picture.path,v_document_article.city')
		            ->select();
		$this->assign('mddcity',$mddcity);//省下的所有城市
		$this->aimwapbejing();//手机版目的地北京下的区 例如:海淀
		$this->aimseason();//目的地 季节
		$this->indexcityxz();//nav全国省份选择
		$this->indexzdcity();//手机版全国字母查询
		$this->aimmonth();//目的地月份的第一月
		A('Words')->rentcar();//Words控制器下的方法
		/* 模板赋值并渲染模板 */
		$this->assign('time', time());
		$this->assign('_category', $category);
		$this->display($category['template_index']);
	}


	/**
	*去农家模块搜索  字符串条件预处理d为整型 f为浮点型 s为字符串型 
	*strFilter过滤非法字符
	*/


	public function qnjsearch(){//去农家点击"北京"后的数据和条件
		$this->deadlines();
		//符合条件的内容
		$catepid=$this->tcategory()->where("name='%s'",I('get.category'))->field('id')->find()['id'];
		if($this->getChildrenIds($catepid)){
			$k['v_document.category_id']=array('in',$this->getChildrenIds($catepid));
		}else{
			$k['v_document.category_id']=array('eq',$catepid);
		}
		$k['v_document.status']=1;
		$k['v_document.deadline']=array('gt',time());
		$k['v_document.title']=array('neq','');
		if(empty(I('get.scenic'))){//获取风景名称或拓展项目
			$k['v_document_article.fjmc']=array('neq','');
		}else{
			$k['v_document_article.fjmc']=strFilter(I('get.scenic'));
		}
		if(empty(I('get.city'))){//获取当前城市"海淀"或拓展基地
			$k['v_document_article.city']=array('neq','');
		}else{
			$k['v_document_article.city']=strFilter(I('get.city'));
		}
		if(!empty(I('get.njyclass'))){//获取农家类型
			$k['v_document_article.njyclass']=strFilter(I('get.njyclass'));
		}
		if(!empty(I('get.tzprice'))){//获取拓展价格
			$k['v_document_article.tzprice']=I('get.tzprice');
		}
		$k['v_document_article.username']=array('neq','');     
		$k['v_category.name']=strFilter(I('get.citynum'));//根据省份标识
		$count=$this->tdocument()
				 	->join('v_picture ON v_document.cover_id=v_picture.id')
				 	->join('v_category ON v_document.category_id=v_category.id')
				 	->join('v_document_article ON v_document_article.id=v_document.id')
				 	->where($k)->count();//查询符合条件的总数
		$page=new Page($count,$this->qnj_row(strFilter(I('get.citynum'))));
		$k['v_document.zhuangtai']=array('neq',5);
		$res=$this->tdocument()
				  ->join('v_picture ON v_picture.id=v_document.cover_id')
		 		  ->join('v_category ON v_category.id=v_document.category_id')
			   	  ->join('v_document_article ON v_document_article.id=v_document.id')
			      ->where($k)
			      ->field('v_document.id,v_document.title,v_document.description,v_document.zhuangtai,v_document_article.phone,v_document_article.address,v_document.create_time,v_picture.path,v_category.title as cityname')
			   	  ->limit($page->firstRow.','.$this->qnj_row(strFilter(I('get.citynum'))))
			   	  ->order('v_document.zhuangtai desc,v_document.update_time desc')
			      ->select();	//不包含推广的内容
		foreach($res as $key=>$v){$res[$key]['viplong']=ceil((time()-$v['create_time'])/31536000);}//计算商家入驻多长时间	
		$k['v_document.zhuangtai']=array('eq',5);      
		$tres=$this->tdocument()
		 		  ->join('v_category ON v_category.id=v_document.category_id')
				  ->join('v_picture ON v_picture.id=v_document.cover_id')
			   	  ->join('v_document_article ON v_document_article.id=v_document.id')
			      ->where($k)
			      ->field('v_document.id,v_document.title,v_document.description,v_document.zhuangtai,v_document_article.phone,v_document_article.address,v_document.create_time,v_picture.path,v_category.title as cityname')
			      ->select();	//包含推广的内容			   
		foreach($tres as $key1=>$v){$tres[$key1]['viplong']=ceil((time()-$v['create_time'])/31536000);}//计算商家入驻多长时间
		$show=$page->show();//以上是符合条件的内容和分页
		if($this->getChildrenIds($catepid)){
			$k1['v_document.category_id']=array('in',$this->getChildrenIds($catepid));
		}else{
			$k1['v_document.category_id']=array('eq',$catepid);
		}
		$k1['v_document.status']=1;
		$k1['v_document.title']=array('neq','');
		$k1['v_document_article.fjmc']=array('neq','');
		$k11['v_document_article.city']=array('neq','');
		$k12['v_document_article.city']=strFilter(I('get.city'));
		// $k1['v_document_article.username']=array('neq','');
		$k1['v_category.name']=strFilter(I('get.citynum'));
		$scity=$this->tdocument()
				   ->join('v_document_article ON v_document.id=v_document_article.id')
				   ->join('v_category ON v_document.category_id=v_category.id')
				   ->where($k1)->where($k11)->distinct(true)->field('v_document_article.city')
				   ->select();//渲染到下一个页面的条件 如"昌平区"
		$scity1=$this->tdocument()
				   ->join('v_document_article ON v_document.id=v_document_article.id')
				   ->join('v_category ON v_document.category_id=v_category.id')
				   ->where($k1)->where($k12)->distinct(true)->field('v_document_article.fjmc')
				   ->select();//渲染到下一个页面的条件 如"白羊沟"
		$moban=$this->tcategory()->where('name="%s"',array(I('get.category')))->field('template_index')->find()['template_index'];//渲染模版
		$ciytname=$this->tcategory()->where('name="%s"',strFilter(I('get.citynum')))->field('title')->find()['title'];
		if(!$scity1 && !$res){//如果参数有误导致查不出数据和景点名称就回到最开始的时候
			$this->index();
		}
		$this->assign('show',$show);//数据分页
		$this->assign('list',$res);//符合条件的内容 不包含推广
		$this->assign('tlist',$tres);//符合条件的内容 推广
		$this->assign('citynum',strFilter(I('get.citynum')));//当前省份的标识
		$this->assign('cityname',$ciytname);//当前省份的名称"北京"
		$this->assign('city',strFilter(I('get.city')));//市区"昌平区" 名称
		$this->assign('scity',$scity);//省下的市区名称
		$this->assign('scity1',$scity1);//市下的景区名称
		$this->assign('scenic',strFilter(I('get.scenic')));//选中的景区名称 
		$this->assign('category',strFilter(I('get.category')));//选中的类别name
		$this->assign('tzprice',I('get.tzprice'));//选中的拓展价格
		$this->assign('njyclass',strFilter(I('get.njyclass','','intval')));//选中的农家院类型
		$this->indexcityxz();
		$this->display($moban);
	}

	/*农家院模糊查询*/
    public function search3($key=''){
    	$this->deadlines();
    	$where['v_document.status']=1;
    	$where['v_document.deadline']=array('gt',time());
        $where['v_document.title']=array('like',"%".strFilter(I('get.key'))."%");
        $where['v_document_article.fjmc']=array('neq','');
		$where['v_document_article.city']=array('neq','');
		$where['v_document_article.username']=array('neq','');
		$where['v_document.category_id']=array('in',$this->getChildrenIds(84));
		$count=$this->tdocument()
					->join('v_picture ON v_picture.id=v_document.cover_id')
				 	->join('v_document_article ON v_document.id=v_document_article.id')
				 	->where($where)->count();
		$page=new Page($count,10);
    	$res=$this->tdocument()
    			  ->join('v_category ON v_document.category_id=v_category.id')
    		      ->join('v_picture ON v_picture.id=v_document.cover_id')
    		      ->join('v_document_article ON v_document.id=v_document_article.id')
    		      ->where($where)
    		      ->field('v_document.id,v_document.title,v_document.description,v_document_article.phone,v_document_article.address,v_picture.path,v_document_article.city,v_document_article.fjmc,v_category.title as title1,v_document.create_time,v_document.time_long')
    		      ->limit($page->firstRow.',10')
    		      ->order('v_document.create_time desc')->select();
		foreach($res as $k=>$v){
			$res[$k]['viplong']=ceil((time()-$v['create_time'])/31536000);
		}
		$show=$page->show();
		$this->assign('list',$res);
		$this->assign('show',$show);
		$this->assign('category','njy');
		$this->indexcityxz();
		$this->display('Article/qunongjia');
    }

    /*如果置顶时间到期 会变成普通*/
    public function deadlines(){
    	$deadwhere['v_document.status']=1;
		$deadwhere['v_document.title']=array('neq','');
		$deadwhere['v_document.deadline']=array('gt',time());
		$deadwhere['v_document.zhuangtai']=array('neq',0);
		$deadwhere['v_document.category_id']=array('in',$this->getChildrenIds(84));
		$deadres=$this->tdocument()->where($deadwhere)->field('time_long,id')->select();
		$zileiids='';
		foreach($deadres as $deadkey=>$deadval){
			if($deadval['time_long']<=time()){
				$zileiids.=','.$deadval['id'];
			}
		}
		if(trim($zileiids,',')){
			$deadwhere['v_document.id']=array('in',$zileiids);
			$this->tdocument()->zhuangtai=0;
			$this->tdocument()->where($deadwhere)->save();
		}
    }


	/* 文档模型列表页 */
	public function lists($p = 1){
		/* 分类信息 */
		$category = $this->category();

		/* 获取当前分类列表 */
		$Document = D('Document');
		$list = $Document->page($p, $category['list_row'])->lists($category['id']);
		if(false === $list){
			$this->error('获取列表数据失败！');
		}

		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);		
		$this->assign('list', $list);
		$this->display($category['template_lists']);
	}

	/* 文档模型详情页 */
	public function detail($id = 0, $p = 1){
		/* 标识正确性检测 */
		if(!($id && is_numeric($id))){
			$this->error('文档ID错误！');
		}

		/* 页码检测 */
		$p = intval($p);
		$p = empty($p) ? 1 : $p;

		/* 获取详细信息 */
		$Document = D('Document');
		$info = $Document->detail($id);
		if(!$info){
			$this->error($Document->getError());
		}

		/* 分类信息 */
		$category = $this->category($info['category_id']);

		/* 获取模板 */
		if(!empty($info['template'])){//已定制模板
			$tmpl = $info['template'];
		} elseif (!empty($category['template_detail'])){ //分类已定制模板
			$tmpl = $category['template_detail'];
		} else { //使用默认模板
			$tmpl = 'Article/'. get_document_model($info['model_id'],'name') .'/detail';
		}


        $cheng=M('category');
        $wapnews=$cheng->where('id='.$category['pid'])->field('title')->find()['title'];
        $this->assign('wapnews',$wapnews);
        $cheng1=$cheng->where('pid=84 and status=1')->field('groups')->select();
        $cheng2=[];
        foreach($cheng1 as $k=>$v){
            $cheng2[]=$v['groups'];
        }
        $cheng2=array_unique(array_filter($cheng2));//区域
        $cheng3=[];
        foreach($cheng2 as $k=>$v){
            $z1=$cheng->where('status=1 and pid=84 and groups="'.$v.'"')->field('title,name,id')->select();
            $cheng3[$v]=$z1;
        }
		/* 更新浏览数 */
		$map = array('id' => $id);
		$Document->where($map)->setInc('view');
		/* 遍历留言 */
		$mw=M('words');
		$lycount=$mw->where('status=1 and ggid='.$id)->count();
		$lypage=new Page($count,5);
		$liuyan=$mw->where('status=1 and ggid='.$id)->limit(0,5)->order('create_time desc')->select();
		$show=$lypage->show();
		/* 模板赋值并渲染模板 */
		/* 目的地详情页分页 */
		$aimm=M('document');
		$aimmres=$aimm->join('v_document_article ON v_document.id=v_document_article.id')->where('v_document_article.aimclass=1 and v_document.status=1 and v_document.category_id='.$info['category_id'])->limit('0,5')->field('v_document.id,v_document.title')->select();//住宿
		$aimmres2=$aimm->join('v_document_article ON v_document.id=v_document_article.id')->where('v_document_article.aimclass=0 and v_document.status=1 and v_document.category_id='.$info['category_id'])->limit('0,5')->field('v_document.id,v_document.title')->select();//美食
		$aimmres3=$aimm->join('v_document_article ON v_document.id=v_document_article.id')->where('v_document_article.aimclass=2 and v_document.status=1 and v_document.category_id='.$info['category_id'])->limit('0,5')->field('v_document.id,v_document.title')->select();//景点
		$aimmres1=$aimm->join('v_document_article ON v_document.id=v_document_article.id')->where('v_document_article.aimclass=3 and v_document.status=1 and v_document.category_id='.$info['category_id'])->limit('0,30')->field('v_document.id,v_document.title')->select();//新闻
		$this->assign('aimmres',$aimmres);//目的地详情住宿
		$this->assign('aimmres1',$aimmres1);//目的地详情新闻
		$this->assign('aimmres2',$aimmres2);//目的地详情美食
		$this->assign('aimmres3',$aimmres3);//目的地详情景点
		$this->indexcityxz();
		$this->assign('category', $category);
		$this->assign('info', $info);
		$this->assign('page', $p); //页码
		$this->assign('liuyan',$liuyan);//留言
		$this->assign('show',$show);//留言分页
		$this->assign('lycount',$lycount);//留言条数
		$this->display($tmpl);
	}


	public function aimhuan(){//目的地详情页切换
		$i=I('post.i','5','intval');
		$where['v_document_article.aimclass']=array('eq',I('post.pos','','intval'));
		$where['v_document.category_id']=array('eq',I('post.categoryid','','intval'));
		$where['v_document.status']=1;
		$aimmres=$this->tdocument()->join('v_document_article ON v_document.id=v_document_article.id')->where($where)->limit($i.',5')->field('v_document.id,v_document.title')->select();
		if(!$aimmres){
			$aimmres=$this->tdocument()->join('v_document_article ON v_document.id=v_document_article.id')->where($where)->limit('0,5')->field('v_document.id,v_document.title')->select();
			foreach($aimmres as $k=>$v){
				$aimmres[$k]['info']=1;
			}
		}
		echo json_encode($aimmres);
	}

	public function aimdetail(){//目的地详情页无刷新获取数据
		$where['v_document.id']=I('post.id','','intval');
		$where['v_document.status']=1;
		$detailres=$this->tdocument()->join('v_picture ON v_document.cover_id=v_picture.id')
					    ->join('v_document_article ON v_document.id=v_document_article.id')
					    ->where($where)
					    ->field('v_document.title,v_document_article.content,v_picture.path')
					    ->select();
		echo json_encode($detailres);
	}


	/* 文档分类检测 */
	private function category($id = 0){
		/* 标识正确性检测 */
		$id = $id ? $id : I('get.category', 0);
		if(empty($id)){
			$this->error('没有指定文档分类！');
		}
		/* 获取分类信息 */
		$category = D('Category')->info($id);
		if($category && 1 == $category['status']){
			switch ($category['display']) {
				case 0:
					$this->error('该分类禁止显示！');
					break;
				//TODO: 更多分类显示状态判断
				default:
					return $category;
			}
		} else {
			$this->error('分类不存在或被禁用！');
		}
	}

	public function words(){
		if(I('post.uid')=='' || I('post.ar_content')==''){
			$this->detail(I('post.gid','','intval'),1);
			die;
		}
		$p=M('personal');
		$where['username']=strFilter(I('post.uid'));
		$uid=$p->where($where)->find()['id'];
		$m=M('words');
		$m->gid=I('post.gid','','intval');
		$m->text=strFilter(I('post.ar_content'));
		$m->cate_time=time();
		$m->uid=$uid;
		$m1=$m->add();
		if($m1){
			echo "<script>alert('留言成功,我们会尽快审核通过.');</script>"; 
			$this->detail(I('post.gid','','intval'),1);
		}else{
			echo "<br />\n"."<script> alert('留言失败,请重试.') </script>".'<span><a href="javascript:history.go(-1);">◂返回上一步</a></span>';
			die;
		}
	}	

	/*根据pid查询子类id*/
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

	/*目的地
	**点击地图发送AJAX
	*/
	public function aimmap(){
		$name['name']=strFilter(I('post.name'));
		$pid=$this->tcategory()->where($name)->field('id')->find()['id'];
		$where['v_document.status']=1;
		$where['v_document.category_id']=$pid;
		$where['v_document_article.aimclass']=2;
		$res=$this->tdocument()
					->join('v_document_article ON v_document_article.id=v_document.id')
			   		->join('v_picture ON v_document.cover_id=v_picture.id')
			   		->where($where)
			   		->field('v_document_article.fjmc,v_document.id,v_document.title,v_picture.path')
			   		->limit('0,6')->order('v_document.id desc')->select();
		echo json_encode($res);
	}

	/*ajax月份查询数据*/
	public function aimmonth($yue='1月'){
		if($yue=='1月'){$yue=1;}
		elseif($yue=='2月'){$yue=2;}
		elseif($yue=='3月'){$yue=3;}
		elseif($yue=='4月'){$yue=4;}
		elseif($yue=='5月'){$yue=5;}
		elseif($yue=='6月'){$yue=6;}
		elseif($yue=='7月'){$yue=7;}
		elseif($yue=='8月'){$yue=8;}
		elseif($yue=='9月'){$yue=9;}
		elseif($yue=='10月'){$yue=10;}
		elseif($yue=='11月'){$yue=11;}
		elseif($yue=='12月'){$yue=12;}
		$aimids=ltrim($this->getChildrenIds(61),',');
    	$aimk['v_document.status']=1;
    	$aimk['v_document_article.keyword']=strFilter($yue);
    	$aimk['v_document.category_id']=array('in',$aimids);		
		$aimres=$this->tdocument()->join('v_document_article ON v_document.id=v_document_article.id')
					 ->join('v_picture ON v_document.cover_id=v_picture.id')
					 ->where($aimk)
					 ->field('v_document.id,v_document.title,v_picture.path,v_document_article.keyword,v_document_article.fjmc')
					 ->limit('0,7')->order('v_document.id desc')->select();
		$this->assign('aim1',$aimres);
	}

	public function aimmonth1(){
		$yue=I('post.month');
		if($yue=='1月'){$yue=1;}
		elseif($yue=='2月'){$yue=2;}
		elseif($yue=='3月'){$yue=3;}
		elseif($yue=='4月'){$yue=4;}
		elseif($yue=='5月'){$yue=5;}
		elseif($yue=='6月'){$yue=6;}
		elseif($yue=='7月'){$yue=7;}
		elseif($yue=='8月'){$yue=8;}
		elseif($yue=='9月'){$yue=9;}
		elseif($yue=='10月'){$yue=10;}
		elseif($yue=='11月'){$yue=11;}
		elseif($yue=='12月'){$yue=12;}
		else{$yue=1;}
		$aimids=ltrim($this->getChildrenIds(61),',');
    	$aimk['v_document.status']=1;
    	$aimk['v_document_article.keyword']=strFilter($yue);
    	$aimk['v_document.category_id']=array('in',$aimids);		
		$aimres=$this->tdocument()->join('v_document_article ON v_document.id=v_document_article.id')
					 ->join('v_picture ON v_document.cover_id=v_picture.id')
					 ->where($aimk)
					 ->field('v_document.id,v_document.title,v_picture.path,v_document_article.keyword,v_document_article.fjmc')
					 ->limit('0,7')->order('v_document.id desc')->select();
		echo json_encode($aimres);
	}

	/*ajax季节查询数据*/
	public function season(){
		$m=M('document');
		$season=strFilter(I('post.season'));
		$seakey['v_document.status']=1;
		$aimids=ltrim($this->getChildrenIds(61),',');
		$seakey['v_document.category_id']=array('in',$aimids);	
		if($season=='chun'){
			$seakey['v_document_article.keyword']=array('in','3,4,5');
		}elseif($season=='xia'){
			$seakey['v_document_article.keyword']=array('in',',7,8,9');
		}elseif($season=='qiu'){
			$seakey['v_document_article.keyword']=array('in','10,11');
		}else{
			$seakey['v_document_article.keyword']=array('in','1,12');
		}
		$seares=$m->join('v_document_article ON v_document.id=v_document_article.id')
				  ->join('v_picture ON v_document.cover_id=v_picture.id')
				  ->where($seakey)
				  ->field('v_document.id,v_document.title,v_picture.path,v_document_article.keyword,v_document_article.fjmc')
				  ->limit('0,8')->order('v_document.id desc')->select();
		echo json_encode($seares);
	}

	/*目的地二级页 城市简介 吃住玩攻略*/
	public function aimtwo($name='',$city=''){
		/*获取在一下id下的数据*/
		$sunids=$this->tcategory()->where('name="%s"',array(strFilter(I('get.name'))))->field('id')->find()['id'];
		if(!$sunids){echo "<br />\n"."<script> alert('不允许输入非法字符') </script>".'<span><a href="javascript:history.go(-1);">◂返回上一步</a></span>';die;}
		$sunids0=$this->getChildrenIds($sunids);

		/*城市介绍封面*/
	    $aimcover['v_document.category_id']=array('in',$sunids0);
	    $aimcover['v_document.status']=1;
	    $aimcover['v_document_article.city']=array('eq',strFilter(I('get.city')));
	    $aimcover['v_document.name']=array('eq',strFilter(I('get.category')));
	    $aimcovercon=$this->tdocument()
         				  ->join('v_document_article ON v_document.id=v_document_article.id')	
	                      ->where($aimcover)->field('v_document.id,v_document.cover_id,v_document.title')->find();//封面的数据id
	    if(!$aimcovercon['id']){echo "<br />\n"."<script> alert('该目的地正在建设中') </script>".'<span><a href="javascript:history.go(-1);">◂返回上一步</a></span>';die;}                  
	    /*吃 住 玩 攻略*/
	    $aimtwok['v_document.category_id']=array('in',$sunids0);
	    $aimtwok['v_document_article.city']=array('eq',strFilter(I('get.city')));
	    $aimtwok['v_document.name']=array('eq','');
	    $aimtwok['v_document.status']=1;
	    $meishik['v_document_article.aimclass']=array('eq',0);
	    $zhusuk['v_document_article.aimclass']=array('eq',1);
	    $fengjingk['v_document_article.aimclass']=array('eq',2);
	    $newsk['v_document_article.aimclass']=array('eq',3);

		$aimmeishi=$this->tdocument()
		             ->join('v_document_article ON v_document.id=v_document_article.id')
					 ->join('v_picture ON v_document.cover_id=v_picture.id')
					 ->where($meishik)->where($aimtwok) 
					 ->field('v_picture.path,v_document.title,v_document.description,v_document.id')
					 ->limit('0,5')->order('v_document.id desc')->select();

		$aimzhusu=$this->tdocument()
		             ->join('v_document_article ON v_document.id=v_document_article.id')
					 ->join('v_picture ON v_document.cover_id=v_picture.id')
					 ->where($zhusuk)->where($aimtwok) 
					 ->field('v_picture.path,v_document.title,v_document.description,v_document.id')
					 ->limit('0,5')->order('v_document.id desc')->select();

		$aimfengjing=$this->tdocument()
		             ->join('v_document_article ON v_document.id=v_document_article.id')
					 ->join('v_picture ON v_document.cover_id=v_picture.id')
					 ->where($fengjingk)->where($aimtwok) 
					 ->field('v_picture.path,v_document.title,v_document.description,v_document.id')
					 ->limit('0,5')->order('v_document.id desc')->select();

		$aimnews=$this->tdocument()
		             ->join('v_document_article ON v_document.id=v_document_article.id')
					 ->join('v_picture ON v_document.cover_id=v_picture.id')
					 ->where($newsk)->where($aimtwok) 
					 ->field('v_picture.path,v_document.title,v_document.description,v_document.id,v_document.create_time,v_document.view')
					 ->limit('0,5')->order('v_document.id desc')->select();

		/*周围城市推荐*/
		$perimeterk['v_document.category_id']=array('in',$sunids0);
		$perimeterk['v_document.name']=array('neq','');
		$perimeter=$this->tdocument()
		             ->join('v_document_article ON v_document.id=v_document_article.id')
					 ->where($perimeterk)
					 ->field('v_document.id,v_document.title,v_document.cover_id,v_document.name,v_document_article.city')
					 ->select();
		$this->assign('aimmeishi',$aimmeishi);
		$this->assign('aimfengjing',$aimfengjing);
		$this->assign('aimzhusu',$aimzhusu);
		$this->assign('aimnews',$aimnews);
		$this->assign('perimeter',$perimeter);//目的地推荐
		$this->indexcityxz();
		$this->assign('_category',$this->category($sunids));//调用category()方法
		$this->assign('aimcovercon',$aimcovercon);//封面数据的id
		$this->display('Article/aim/aim1');
	}

	/*目的地月份二级页面*/
	public function twomonth(){
		$where['v_document.status']=1;
		$where['v_document_article.keyword']=strFilter(I('get.yue',1,'intval'));
		$where['v_document.category_id']=array('in',$this->getChildrenIds(61));
		$count=$this->tdocument()
					->join('v_document_article ON v_document.id=v_document_article.id')
					->join('v_category ON v_document.category_id=v_category.id')
					->join('v_picture ON v_picture.id=v_document.cover_id')
					->where($where)
					->count();
		$page=new Page($count,7);
		$show=$page->show();
		$res=$this->tdocument()
					->join('v_document_article ON v_document.id=v_document_article.id')
					->join('v_category ON v_document.category_id=v_category.id')
					->join('v_picture ON v_picture.id=v_document.cover_id')
					->where($where)->limit($page->firstRow.',7')
					->field('v_document.id,v_document.title,v_picture.path')
					->select();
		$this->indexcityxz();
		$this->assign('list',$res);
		$this->assign('show',$show);
		$this->assign('yuenum',strFilter(I('get.yue',1,'intval')));
		$this->display('Article/aim/month');
	}

	/*目的地季节二级页面*/
	public function twoseason(){
		$where['v_document.status']=1;
		if(strFilter(I('get.season'))=='春'){
			$where['v_document_article.keyword']=array('in','3,4,5');
		}elseif(strFilter(I('get.season'))=='夏'){
			$where['v_document_article.keyword']=array('in','6,7,8');
		}elseif(strFilter(I('get.season'))=='秋'){
			$where['v_document_article.keyword']=array('in','9,10,11');
		}elseif(strFilter(I('get.season'))=='冬'){
			$where['v_document_article.keyword']=array('in','12,1,2');
		}else{
			echo "<script> alert('条件中存在非法字符或格式不正确,请重试');  window.location.href=document.referrer;</script>";
            die;
		}
		$where['v_document.category_id']=array('in',$this->getChildrenIds(61));
		$count=$this->tdocument()
					->join('v_document_article ON v_document.id=v_document_article.id')
					->join('v_category ON v_document.category_id=v_category.id')
					->join('v_picture ON v_picture.id=v_document.cover_id')
					->where($where)
					->count();
		$page=new Page($count,8);
		$show=$page->show();
		$res=$this->tdocument()
					->join('v_document_article ON v_document.id=v_document_article.id')
					->join('v_category ON v_document.category_id=v_category.id')
					->join('v_picture ON v_picture.id=v_document.cover_id')
					->where($where)->limit($page->firstRow.',8')
					->field('v_document.id,v_document.title,v_picture.path')
					->select();
		$this->indexcityxz();
		$this->assign('list',$res);
		$this->assign('show',$show);
		$this->assign('seasonname',strFilter(I('get.season')));
		$this->display('Article/aim/season');
	}

	//================================目的地手机版=========================

	/*北京下的区(例如:海淀)*/
	protected function aimwapbejing(){
		$aimwapbejingk['v_document.status']=1;
		$aimwapbejingk['v_document.title']=array('neq','');
		$aimwapbejingk['v_document.category_id']=138;
		$aimwapbejingk['v_document.name']=array('neq','');
		$aimwapbejingres=$this->tdocument()
								->join('v_picture ON v_document.cover_id=v_picture.id')
								->where($aimwapbejingk)
								->field('v_document.id,v_document.title,v_document.name,v_picture.path')
								->select();
		$this->assign('aimwapbejingres',$aimwapbejingres);						
	}

	protected function aimseason(){
		$seasonkey['v_document.status']=1;
		$seasonkey1['v_document_article.keyword']=array('in','3,4,5');
		$searesc=$this->tdocument()->join('v_document_article ON v_document.id=v_document_article.id')
				  ->join('v_picture ON v_document.cover_id=v_picture.id')
				  ->where($seasonkey)->where($seasonkey1)
				  ->field('v_document.id,v_document.title,v_picture.path,v_document_article.keyword,v_document_article.fjmc')
				  ->limit('0,8')
				  ->order('v_document.id desc')
				  ->select();

		$seasonkey2['v_document_article.keyword']=array('in','7,8,9');
		$searesx=$this->tdocument()->join('v_document_article ON v_document.id=v_document_article.id')
				  ->join('v_picture ON v_document.cover_id=v_picture.id')
				  ->where($seasonkey)->where($seasonkey2)
				  ->field('v_document.id,v_document.title,v_picture.path,v_document_article.keyword,v_document_article.fjmc')
				  ->limit('0,8')
				  ->order('v_document.id desc')
				  ->select();

		$seasonkey3['v_document_article.keyword']=array('in','10,11');
		$searesq=$this->tdocument()->join('v_document_article ON v_document.id=v_document_article.id')
				  ->join('v_picture ON v_document.cover_id=v_picture.id')
				  ->where($seasonkey)->where($seasonkey3)
				  ->field('v_document.id,v_document.title,v_picture.path,v_document_article.keyword,v_document_article.fjmc')
				  ->limit('0,8')
				  ->order('v_document.id desc')
				  ->select();

		$seasonkey4['v_document_article.keyword']=array('in','12,1,2');
		$searesd=$this->tdocument()->join('v_document_article ON v_document.id=v_document_article.id')
				  ->join('v_picture ON v_document.cover_id=v_picture.id')
				  ->where($seasonkey)->where($seasonkey4)
				  ->field('v_document.id,v_document.title,v_picture.path,v_document_article.keyword,v_document_article.fjmc')
				  ->limit('0,8')
				  ->order('v_document.id desc')
				  ->select();
		$this->assign('seares',$searesc);
		$this->assign('searesx',$searesx);
		$this->assign('searesq',$searesq);
		$this->assign('searesd',$searesd);

	}

}
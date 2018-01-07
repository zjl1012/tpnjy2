<?php
namespace Home\Controller;
use Think\Db;
class VipController extends HomeController{
	protected function tcategory(){return M('category');}
	protected function tdocument(){return M('document');}
	protected function tarticle	(){return M('document_article');}
	protected function indexcityxz(){return A('Index')->cityxz();}//调用Indexcontroller中的cityxz方法
	protected function judgeuser(){if(empty(session('username'))){redirect('/Login/Login');die;}}
	/*后台个人全部农家*/
	public function myweb(){
		A('Article')->deadlines();
		$this->judgeuser();
		$where['v_document.status']=1;
		$where['v_document_article.username']=session('username');
		$where['v_document_article.fjmc']=array('neq','');
		$where['v_document_article.city']=array('neq','');
		$where['v_document.category_id']=array('in',$this->getChildrenIds(84));
		$res=$this->tdocument()
				->join('v_category ON v_document.category_id=v_category.id')
				->join('v_document_article ON v_document.id=v_document_article.id')
				->where($where)
				->field('v_document.id,v_document.up_status,v_document.title,v_document.status,v_document_article.phone,v_document.zhuangtai,v_document.create_time,v_document.deadline,v_document.view')
				->order('v_document.create_time desc')->select();
		$this->assign('list',$res);
		$this->assign('username',session('username'));
		$this->display('Article/myweb/myweb');
	}

	/*修改农家封面的页面*/
	public function webedit(){
		$up=M('update');
		$this->judgeuser();		
		$panduan=$this->tarticle()->where('id=%d',I('get.id',0,'intval'))->field('username')->find()['username'];
		if($panduan !== session('username')){
			echo "<script> alert('没有权限');  window.location.href=document.referrer; </script>";
			die;
		}
		$picid=$this->tdocument()->where('status=1 and id=%d',I('get.id',0,'intval'))->field('cover_id,up_status,title')->find();
		if($picid['cover_id']==0){
			if($picid['up_status']==0){
				$sup1=$up->where('gid=%d',I('get.id',0,'intval'))->find();
				if($sup1['picid']){
					$list=$up->join('v_document ON v_document.id=v_update.gid')->join('v_picture ON v_picture.id=v_update.picid')->where('v_update.gid=%d and v_update.username="%s"',I('get.id',0,'intval'),session('username'))->field('v_picture.path,v_document.title,v_update.gid as id,v_update.content,v_update.phone,v_picture.id as picid')->find();					
				}else{
					$list=$this->tdocument()->join('v_document_article ON v_document.id=v_document_article.id')->where('v_document.status=%d and v_document.id=%d and v_document_article.username="%s"',1,I('get.id',0,'intval'),session('username'))->field('v_document.id,v_document.title,v_document_article.content,v_document_article.phone')->find();
				}
			}else{
				$list=$this->tdocument()->join('v_document_article ON v_document.id=v_document_article.id')->where('v_document.status=%d and v_document.id=%d and v_document_article.username="%s"',1,I('get.id',0,'intval'),session('username'))->field('v_document.id,v_document.title,v_document_article.content,v_document_article.phone')->find();		
			}
		}else{
			if($picid['up_status']==0){
				$sup1=$up->where('gid=%d',I('get.id',0,'intval'))->find();
				if($sup1['picid']){
					$list=$up->join('v_document ON v_document.id=v_update.gid')->join('v_picture ON v_picture.id=v_update.picid')->where('v_update.gid=%d and v_update.username="%s"',I('get.id',0,'intval'),session('username'))->field('v_picture.path,v_document.title,v_update.gid as id,v_update.content,v_update.phone,v_picture.id as picid')->find();
				}else{
					$list=$this->tdocument()->join('v_document_article ON v_document.id=v_document_article.id')->join('v_picture ON v_picture.id=v_document.cover_id')->where('v_document.status=%d and v_document.id=%d and v_document_article.username="%s"',1,I('get.id',0,'intval'),session('username'))->field('v_document.id,v_document.title,v_document_article.content,v_document_article.phone,v_picture.path,v_picture.id as picid')->find();
				}
			}else{
				$list=$this->tdocument()->join('v_document_article ON v_document.id=v_document_article.id')->join('v_picture ON v_picture.id=v_document.cover_id')->where('v_document.status=%d and v_document.id=%d and v_document_article.username="%s"',1,I('get.id',0,'intval'),session('username'))->field('v_document.id,v_document.title,v_document_article.content,v_document_article.phone,v_picture.path,v_picture.id as picid')->find();	
			}
		}
		$this->indexcityxz();
		$this->assign('list',$list);
		$this->assign('title',$picid['title']);
		$this->assign('username',session('username'));
		$this->display('Article/myweb/webedit');
	}

	/*预约刷新*/
	public function websx(){
		$this->judgeuser();		
		$panduan=$this->tarticle()->where('id=%d',I('get.id',0,'intval'))->field('username')->find()['username'];
		if($panduan !== session('username')){
			echo "<script> alert('没有权限');  window.location.href=document.referrer; </script>";
			die;
		}

		$m=M('document');
		$res=$this->tdocument()->where('status=%d and id=%d',1,I('get.id',0,'intval'))->field('status,zhuangtai')->find();
		if($res['zhuangtai']==='0'){
			$this->tdocument()->update_time=time();
			$xiugai=$this->tdocument()->where('status=%d and id=%d',1,I('get.id',0,'intval'))->save();
			if($xiugai){
				echo "<script> alert('刷新成功');  window.location.href=document.referrer; </script>";
				die;
			}else{
				echo "<script> alert('刷新失败');  window.location.href=document.referrer; </script>";
				die;
			}
		}elseif($res['zhuangtai']==='5'){
			echo "<script> alert('您的产品已推广无需刷新');  window.location.href=document.referrer; </script>";
			die;
		}elseif($res['zhuangtai']==='10'){
			echo "<script> alert('您的产品已置顶无需刷新');  window.location.href=document.referrer; </script>";
			die;
		}else{
			echo "<script> alert('刷新失败');  window.location.href=document.referrer; </script>";
			die;			
		}
	}

	/*修改农家院封面 电话 介绍*/
	public function webupdate(){
		$this->judgeuser();
		$panduan=$this->tarticle()->where('id=%d',I('post.id',0,'intval'))->field('username')->find()['username'];
		if($panduan !== session('username')){ //防止在url地址直接输入id
			echo "<script> alert('没有权限');  window.location.href=document.referrer;</script>";
			die;
		}

		$m=M('update');//把修改后的内容插入到这个表中
		$d=M('document');//内容表 需要改up_status=0 判断是否修改
    	if($_FILES['t123']['name']!=''){//判断是传入图片
    		$upload = new \Think\Upload();// 实例化上传类   
	  		$upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');
	  		$upload->savePath  =      '/Picture/'; 
	  		$info   =   $upload->uploadOne($_FILES['t123']); 
	  		if(!$info) {
				echo "<script> alert('上传图片失败,请重试'); window.location.href=document.referrer; </script>";
            	die;
	  		}else{
	  			$p=M('picture');//图片表
	  			$p->path='/Uploads'.$info['savepath'].$info['savename'];
	  			$p->md5=md5('/Uploads/'.$info['savepath'].$info['savename']);
	  			$p->sha1='df7be9dc4f467187783aca68c7ce98e4df2172d0';
	  			$p->status=1;
	  			$p->create_time=time();
	  			$pres=$p->add();
	  			if(!$pres){
					echo "<script> alert('上传图片失败,请重试'); window.location.href=document.referrer; </script>";
            		die;
	  			}
	  		}
    	}
    	$upid=$m->where('username="%s" and gid=%d',session('username'),I('post.id',0,'intval'))->find()['id'];
		if($upid){
			$m->content=strFilter(I('post.ziwojieshao'));	
			$m->phone=strFilter(I('post.dianhua'));
			if(!empty($pres)){
				$m->picid=strFilter($pres);
			}else{
				$m->picid=strFilter(I('post.picid',916,'intval'));
			}
			$m->up_time=time();			
			$update_res=$m->where('id=%d',$upid)->save();
		}else{
			$m->username=strFilter(session('username'));//将修改的内容插入表中
			$m->gid=strFilter(I('post.id'));
			$m->content=strFilter(I('post.ziwojieshao'));	
			$m->phone=strFilter(I('post.dianhua'));
			if(!empty($pres)){
				$m->picid=strFilter($pres);
			}else{
				$m->picid=strFilter(I('post.picid',916,'intval'));
			}
			$m->up_time=time();
			$update_res=$m->add();
		}

		if($update_res){
  			$d->up_status=0;
			$dup=$d->where('status=%d and id=%d',1,I('post.id'))->save();
  			echo "<script>alert('修改成功,我们会尽快审核'); window.location.href=document.referrer; </script>";
        	die;
		}else{
			echo "<script> alert('修改失败,请重试'); window.location.href=document.referrer; </script>";
        	die;
		}	
	}

	/*单一农家院里的详细信息*/
	public function webadd(){
		$m=M('document_article');
		$p=M('picture');
		$up1=M('update1');//用户添加的图片
		$this->judgeuser();
		$panduan=$this->tarticle()->where('id=%d',I('get.id','','intval'))->field('username')->find()['username'];
		if($panduan !== session('username')){
			echo "<script> alert('没有权限');  window.location.href=document.referrer;</script>";
			die;
		}

		//吃
		$up1ms=$up1->where('username="%s" and type=%d',session('username'),0)->field('picid')->find()['picid'];
		if($up1ms){
			$up1ms=array_filter(explode(',',$up1ms));
			foreach($up1ms as $key=>$val){
				$mspiczu[]=$p->where('id=%d',$val)->field('id,path')->find();
			}
			$this->assign('meishi',$mspiczu);
		}else{
			$msres=$this->tarticle()->where('username="%s" and id=%d',session('username'),I('get.id'))->field('meishi')->find()['meishi'];
			$mspic=array_filter(explode(',', $msres));
			foreach($mspic as $key=>$val){
				$mspiczu[]=$p->where('id=%d',$val)->field('id,path')->find();
			}
			$this->assign('meishi',$mspiczu);
		}

		//住
		$up1zs=$up1->where('username="%s" and type=%d',session('username'),1)->field('picid')->find()['picid'];
		if($up1zs){
			$up1zs=array_filter(explode(',',$up1zs));
			foreach($up1zs as $key=>$val){
				$zspiczu[]=$p->where('id=%d',$val)->field('id,path')->find();
			}
			$this->assign('zhusu',$zspiczu);
		}else{
			$zsres=$this->tarticle()->where('username="%s" and id=%d',session('username'),I('get.id'))->field('fangjian')->find()['fangjian'];
			$zspic=array_filter(explode(',', $zsres));
			foreach($zspic as $key=>$val){
				$zspiczu[]=$p->where('id=%d',$val)->field('id,path')->find();
			}
			$this->assign('zhusu',$zspiczu);
		}		

		//玩
		$up1fj=$up1->where('username="%s" and type=%d',session('username'),2)->field('picid')->find()['picid'];
		if($up1fj){
			$up1fj=array_filter(explode(',',$up1fj));
			foreach($up1fj as $key=>$val){
				$fjpiczu[]=$p->where('id=%d',$val)->field('id,path')->find();
			}
			$this->assign('fengjing',$fjpiczu);
		}else{
			$fjres=$this->tarticle()->where('username="%s" and id=%d',session('username'),I('get.id'))->field('fengjing')->find()['fengjing'];
			$fjpic=array_filter(explode(',', $fjres));
			foreach($fjpic as $key=>$val){
				$fjpiczu[]=$p->where('id=%d',$val)->field('id,path')->find();
			}
			$this->assign('fengjing',$fjpiczu);
		}	

		$this->indexcityxz();
		$this->assign('id',I('get.id',0,'intval'));
		$this->assign('title',strFilter(I('get.title')));
		$this->assign('username',session('username'));
	    $this->display('Article/myweb/webadd'); 
	}

	public function webadd1(){
		$this->judgeuser();
		$panduan=$this->tarticle()->where('id=%d',I('post.id'))->field('username')->find()['username'];
		if($panduan !== session('username')){
			echo "<script> alert('没有权限');  window.location.href=document.referrer;</script>";
			die;
		}
		$m=M('update1');
		$d=M('document');
		/*带n是审核通过的  不带n是在审核中的*/
		if(I('post.flxz',0,'intval')==0){
			//美食图片数量
			$fengjing=$m->where('gid=%d and type=%d',I('post.id'),0)->field('picid')->find();
			if($fengjing){
				$nfengjing=count(array_filter(explode(',',$fengjing['picid'])));
				if($nfengjing >= 10){
					echo "<script> alert('美食图片数量超出10张');  window.location.href=document.referrer;</script>";
					die;					
				}
			}else{
				$charu=$this->tarticle()->where('id=%d',I('post.id'))->field('meishi')->find()['meishi'];
				$nfengjing=$this->tarticle()->where('id=%d',I('post.id'))->field('meishi')->find()['meishi'];
				$nfengjing=count(array_filter(explode(',',$nfengjing)));
				if($nfengjing >= 10){
					echo "<script> alert('美食图片数量超出10张');  window.location.href=document.referrer;</script>";
					die;					
				}
			}			
		}

		if(I('post.flxz',0,'intval')==1){
			//住宿图片数量
			$fengjing=$m->where('gid=%d and type=%d',I('post.id'),1)->field('picid')->find();
			if($fengjing){
				$nfengjing=count(array_filter(explode(',',$fengjing['picid'])));
				if($nfengjing >= 10){
					echo "<script> alert('房间图片数量超出10张');  window.location.href=document.referrer;</script>";
					die;					
				}
			}else{
				$charu=$this->tarticle()->where('id=%d',I('post.id'))->field('fangjian')->find()['fangjian'];
				$nfengjing=$this->tarticle()->where('id=%d',I('post.id'))->field('fangjian')->find()['fangjian'];
				$nfengjing=count(array_filter(explode(',',$nfengjing)));
				if($nfengjing >= 10){
					echo "<script> alert('房间图片数量超出10张');  window.location.href=document.referrer;</script>";
					die;					
				}
			}
		}

		if(I('post.flxz',0,'intval')==2){
			//风景图片数量
			$fengjing=$m->where('gid=%d and type=%d',I('post.id'),2)->field('picid')->find();
			if($fengjing){
				$nfengjing=count(array_filter(explode(',',$fengjing['picid'])));
				if($nfengjing >= 10){
					echo "<script> alert('风景图片数量超出10张');  window.location.href=document.referrer;</script>";
					die;					
				}
			}else{
				$charu=$this->tarticle()->where('id=%d',I('post.id'))->field('fengjing')->find()['fengjing'];
				$nfengjing=$this->tarticle()->where('id=%d',I('post.id'))->field('fengjing')->find()['fengjing'];
				$nfengjing=count(array_filter(explode(',',$nfengjing)));
				if($nfengjing >= 10){
					echo "<script> alert('风景图片数量超出10张');  window.location.href=document.referrer;</script>";
					die;					
				}
			}
		}

		if($_FILES['t123']['name']!=''){
    		$upload = new \Think\Upload();// 实例化上传类   
	  		$upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');
	  		$upload->savePath  =      '/Picture/'; 
	  		$info   =   $upload->uploadOne($_FILES['t123']); 
	  		if(!$info) {
				echo "<script> alert('上传图片失败');  window.location.href=document.referrer;</script>";
				die;
	  		}else{
	  			$p=M('picture');//图片表
	  			$p->path='/Uploads'.$info['savepath'].$info['savename'];
	  			$p->md5=md5('/Uploads/'.$info['savepath'].$info['savename']);
	  			$p->sha1='df7be9dc4f467187783aca68c7ce98e4df2172d0';
	  			$p->status=1;
	  			$p->create_time=time();
	  			$pres=$p->add();	
	  			if($pres){
	  				$ms=$m->where('gid=%d and type=%d',I('post.id'),I('post.flxz',0,'intval'))->find();
	  				if($ms){
		  			  	$m->picid=$ms['picid'].','.$pres;
		  				$m->username=session('username');
		  				$m->gid=I('post.id');
		  				$m->type=I('post.flxz');
		  				$m->up_time=time();	
		  				$up1=$m->where('gid=%d and type=%d',I('post.id'),I('post.flxz',0,'intval'))->save();	
		  				if($up1){
		  					$d->up_status=0;
		  					$up_status=$d->where('status=%d and id=%d',1,I('post.id'))->save();
							echo "<script> alert('上传成功,请等待审核');  window.location.href=document.referrer;</script>";
							die; 		  					
		  				}else{
							echo "<script> alert('上传失败');  window.location.href=document.referrer;</script>";
							die; 					
		  				}	
	  				}else{
		  			  	$m->picid=$charu.','.$pres;
		  				$m->username=session('username');
		  				$m->gid=I('post.id');
		  				$m->type=I('post.flxz');
		  				$m->up_time=time();	
		  				$up1=$m->add();
		  				if($up1){
		  					$d->up_status=0;
		  					$up_status=$d->where('status=%d and id=%d',1,I('post.id'))->save();
							echo "<script> alert('上传成功,请等待审核');  window.location.href=document.referrer;</script>";
							die; 		  					
		  				}else{
							echo "<script> alert('上传失败');  window.location.href=document.referrer;</script>";
							die; 
		  				}		
	  				}
	  			}	
	  		}
	  	}else{
			echo "<script> alert('没有上传图片');  window.location.href=document.referrer;</script>";
			die;	  		
	  	}
	}

	/*修改农家院详情图片  吃住玩*/
	public function webxiugai(){
		$this->judgeuser();	
		$panduan=$this->tarticle()->where('id=%d',I('post.gid'))->field('username')->find()['username'];
		if($panduan !== session('username')){
			echo "<script> alert('没有权限');  window.location.href=document.referrer;</script>";
			die;
		}
		$up1=M('update1');//去农家商家详情图片修改表
		$p=M('picture');//图片路径表
		$d=M('document_article');
		$m=M('document');
		$picid=I('post.picid','','intval');//修改前的图片id
		$flxz=strFilter(I('post.flmc'));
		if($_FILES['x123']['name']!=''){
    		$upload = new \Think\Upload();// 实例化上传类   
	  		$upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');
	  		$upload->savePath  =      '/Picture/'; 
	  		$info   =   $upload->uploadOne($_FILES['x123']); 
	  		if(!$info) {
				echo "<script> alert('图片格式有误或者文件太大');  window.location.href=document.referrer;</script>";die;
	  		}else{
	  			$p=M('picture');//图片表
	  			$p->path='/Uploads'.$info['savepath'].$info['savename'];
	  			$p->md5=md5('/Uploads/'.$info['savepath'].$info['savename']);
	  			$p->sha1='df7be9dc4f467187783aca68c7ce98e4df2172d0';
	  			$p->status=1;
	  			$p->create_time=time();
	  			$pres=$p->add();
	  			if(!$pres){echo "<script> alert('上传图片失败');  window.location.href=document.referrer;</script>";die;}
	  		}
	  	}else{
			echo "<script> alert('没有图片上传');  window.location.href=document.referrer;</script>";die;  		
	  	}	

	  	if($flxz=='美食'){
			$up1meishi=$up1->where('gid=%d and type=%d and username="%s"',I('post.gid'),0,session('username'))->find();
			$up11meishipd=array_filter(explode(',',$up1meishi['picid']));
			$up11meishi=array_filter(explode(',',$up1meishi['picid']));
			if($up1meishi['gid']==I('post.gid') && $up1meishi['type']==0){
				foreach($up11meishi as $key=>$val){
					if($picid == $val){unset($up11meishi[$key]);}
				}
				if($up11meishipd==$up11meishi){echo "<script> alert('修改失败');  window.location.href=document.referrer;</script>";die;}
				$up1->up_time=time();
				$up1->picid=trim(implode(',',$up11meishi),',').','.$pres;
				$msras=$up1->where('gid=%d and type=%d and username="%s"',I('post.gid'),0,session('username'))->save();
				if($msras){
					$this->tdocument()->up_status=0;
					$this->tdocument()->where('id=%d and status=%d',I('post.gid'),1)->save();
					echo "<script> alert('修改成功');  window.location.href=document.referrer;</script>";die;  		
				}else{
					echo "<script> alert('修改失败');  window.location.href=document.referrer;</script>";die;  		
				}
			}else{
				$nmeishi1=$this->tarticle()->where('id=%d and username="%s"',I('post.gid'),session('username'))->field('meishi')->find()['meishi'];
				$nmeishipd=array_filter(explode(',',$nmeishi1));
				$nmeishi1=array_filter(explode(',',$nmeishi1));
				foreach($nmeishi1 as $key=>$val){ 
					if($picid == $val){unset($nmeishi1[$key]);}
				}
				if($nmeishipd==$nmeishi1){echo "<script> alert('修改失败');  window.location.href=document.referrer;</script>";die;}
				$up1->gid=I('post.gid','','intval');
				$up1->username=session('username');
				$up1->type=0;
				$up1->up_time=time();
				$up1->picid=trim(implode(',',$nmeishi1),',').','.$pres;
				if($up1->add()){
					$this->tdocument()->up_status=0;
					$this->tdocument()->where('id=%d and status=%d',I('post.gid'),1)->save();
					echo "<script> alert('修改成功');  window.location.href=document.referrer;</script>";die;  		
				}else{
					echo "<script> alert('修改失败');  window.location.href=document.referrer;</script>";die;  		
				}
			}
	  	}elseif($flxz=='住宿'){
			$up1fangjian=$up1->where('gid=%d and type=%d and username="%s"',I('post.gid'),1,session('username'))->find();
			$up11fangjianpd=array_filter(explode(',',$up1fangjian['picid']));//赋值两次 判断是否修改过picid
			$up11fangjian=array_filter(explode(',',$up1fangjian['picid']));
			if($up1fangjian['gid']==I('post.gid') && $up1fangjian['type']==1){
				foreach($up11fangjian as $key=>$val){
					if($picid == $val){unset($up11fangjian[$key]);}
				}
				if($up11fangjianpd==$up11fangjian){echo "<script> alert('修改失败');  window.location.href=document.referrer;</script>";die;}
				$up1->up_time=time();
				$up1->picid=trim(implode(',',$up11fangjian),',').','.$pres;
				$zsras=$up1->where('gid=%d and type=%d and username="%s"',I('post.gid'),1,session('username'))->save();
				if($zsras){
					$this->tdocument()->up_status=0;
					$this->tdocument()->where('id=%d and status=%d',I('post.gid'),1)->save();
					echo "<script> alert('修改成功');  window.location.href=document.referrer;</script>";die;  		
				}else{
					echo "<script> alert('修改失败');  window.location.href=document.referrer;</script>";die;  		
				}
			}else{
				$nfangjian1=$this->tarticle()->where('id=%d and username="%s"',I('post.gid'),session('username'))->field('fangjian')->find()['fangjian'];
				$nfangjianpd=array_filter(explode(',',$nfangjian1));
				$nfangjian1=array_filter(explode(',',$nfangjian1));
				foreach($nfangjian1 as $key=>$val){ 
					if($picid == $val){unset($nfangjian1[$key]);}
				}
				if($nfangjianpd==$nfangjian1){echo "<script> alert('修改失败');  window.location.href=document.referrer;</script>";die;}
				$up1->gid=I('post.gid','','intval');
				$up1->username=session('username');
				$up1->type=1;
				$up1->up_time=time();
				$up1->picid=trim(implode(',',$nfangjian1),',').','.$pres;
				if($up1->add()){
					$this->tdocument()->up_status=0;
					$this->tdocument()->where('id=%d and status=%d',I('post.gid'),1)->save();
					echo "<script> alert('修改成功');  window.location.href=document.referrer;</script>";die;  		
				}else{
					echo "<script> alert('修改失败');  window.location.href=document.referrer;</script>";die;  		
				}
			}	  		
	  	}elseif($flxz=='风景'){
			$up1fangjian=$up1->where('gid=%d and type=%d and username="%s"',I('post.gid'),2,session('username'))->find();
			$up11fangjianpd=array_filter(explode(',',$up1fangjian['picid']));//赋值两次 判断是否修改过picid
			$up11fangjian=array_filter(explode(',',$up1fangjian['picid']));
			if($up1fangjian['gid']==I('post.gid') && $up1fangjian['type']==2){
				foreach($up11fangjian as $key=>$val){
					if($picid == $val){unset($up11fangjian[$key]);}
				}
				if($up11fangjianpd==$up11fangjian){echo "<script> alert('修改失败');  window.location.href=document.referrer;</script>";die;}
				$up1->up_time=time();
				$up1->picid=trim(implode(',',$up11fangjian),',').','.$pres;
				$zsras=$up1->where('gid=%d and type=%d and username="%s"',I('post.gid'),2,session('username'))->save();
				if($zsras){
					$this->tdocument()->up_status=0;
					$this->tdocument()->where('id=%d and status=%d',I('post.gid'),1)->save();
					echo "<script> alert('修改成功');  window.location.href=document.referrer;</script>";die;  		
				}else{
					echo "<script> alert('修改失败');  window.location.href=document.referrer;</script>";die;  		
				}
			}else{
				$nfangjian1=$this->tarticle()->where('id=%d and username="%s"',I('post.gid'),session('username'))->field('fengjing')->find()['fengjing'];
				$nfangjianpd=array_filter(explode(',',$nfangjian1));
				$nfangjian1=array_filter(explode(',',$nfangjian1));
				foreach($nfangjian1 as $key=>$val){ 
					if($picid == $val){unset($nfangjian1[$key]);}
				}
				if($nfangjianpd==$nfangjian1){echo "<script> alert('修改失败');  window.location.href=document.referrer;</script>";die;}
				$up1->gid=I('post.gid','','intval');
				$up1->username=session('username');
				$up1->type=2;
				$up1->up_time=time();
				$up1->picid=trim(implode(',',$nfangjian1),',').','.$pres;
				if($up1->add()){
					$this->tdocument()->up_status=0;
					$this->tdocument()->where('id=%d and status=%d',I('post.gid'),1)->save();
					echo "<script> alert('修改成功');  window.location.href=document.referrer;</script>";die;  		
				}else{
					echo "<script> alert('修改失败');  window.location.href=document.referrer;</script>";die;  		
				}
			}	  		
	  	}else{
			echo "<script> alert('修改失败');  window.location.href=document.referrer;</script>";die;  		
	  	}
	}


	public function delete(){
		$this->judgeuser();	
		$panduan=$this->tarticle()->where('id=%d',I('get.gid'))->field('username')->find()['username'];
		if($panduan !== session('username')){
			echo "<script> alert('没有权限');  window.location.href=document.referrer;</script>";
			die;
		}

		if(I('get.type')==0){
			$key='meishi';
		}elseif(I('get.type')==1){
			$key='fangjian';
		}elseif(I('get.type')==2){
			$key='fengjing';
		}else{
			echo "<script> alert('删除失败');  window.location.href=document.referrer;</script>";die; 
		}

		if($key=='meishi'){
			$nres=$this->tarticle()->where('id=%d and username="%s"',I('get.gid'),session('username'))->field('meishi')->find()['meishi'];
			$nrespic=array_filter(explode(',',$nres));
			foreach($nrespic as $k1=>$v1){
				if(I('get.picid')==$v1){unset($nrespic[$k1]);}
			}
			$this->tarticle()->meishi=trim(implode(',',$nrespic),',');
			$res=$this->tarticle()->where('id=%d and username="%s"',I('get.gid'),session('username'))->save();
		}elseif($key=='fangjian'){
			$nres=$this->tarticle()->where('id=%d and username="%s"',I('get.gid'),session('username'))->field('fangjian')->find()['fangjian'];
			$nrespic=array_filter(explode(',',$nres));
			foreach($nrespic as $k1=>$v1){
				if(I('get.picid')==$v1){unset($nrespic[$k1]);}
			}
			$this->tarticle()->fangjian=trim(implode(',',$nrespic),',');
			$res=$this->tarticle()->where('id=%d and username="%s"',I('get.gid'),session('username'))->save();
		}elseif($key=='fengjing'){
			$nres=$this->tarticle()->where('id=%d and username="%s"',I('get.gid'),session('username'))->field('fengjing')->find()['fengjing'];
			$nrespic=array_filter(explode(',',$nres));
			foreach($nrespic as $k1=>$v1){
				if(I('get.picid')==$v1){unset($nrespic[$k1]);}
			}
			$this->tarticle()->fengjing=trim(implode(',',$nrespic),',');
			$res=$this->tarticle()->where('id=%d and username="%s"',I('get.gid'),session('username'))->save();
		}else{
			echo "<script> alert('删除失败');  window.location.href=document.referrer;</script>";die; 
		}
		$up1=M('update1');
		if(I('get.type',0,'intval')==0){
			$upres=$up1->where('gid=%d and type=%d',I('get.gid'),0)->field('picid')->find()['picid'];
			$uprespic=array_filter(explode(',',$upres));
			foreach($uprespic as $k1=>$v1){
				if(I('get.picid')==$v1){unset($uprespic[$k1]);}
			}
			$up1->picid=trim(implode(',',$uprespic),',');
			$res1=$up1->where('gid=%d and username="%s" and type=%d',I('get.gid'),session('username'),0)->save();			
		}elseif(I('get.type',0,'intval')==1){
			$upres=$up1->where('gid=%d and type=%d',I('get.gid'),1)->field('picid')->find()['picid'];
			$uprespic=array_filter(explode(',',$upres));
			foreach($uprespic as $k1=>$v1){
				if(I('get.picid')==$v1){unset($uprespic[$k1]);}
			}
			$up1->picid=trim(implode(',',$uprespic),',');
			$res1=$up1->where('gid=%d and username="%s" and type=%d',I('get.gid'),session('username'),1)->save();
		}elseif(I('get.type',0,'intval')==2){
			$upres=$up1->where('gid=%d and type=%d',I('get.gid'),2)->field('picid')->find()['picid'];
			$uprespic=array_filter(explode(',',$upres));
			foreach($uprespic as $k1=>$v1){
				if(I('get.picid')==$v1){unset($uprespic[$k1]);}
			}
			$up1->picid=trim(implode(',',$uprespic),',');
			$res1=$up1->where('gid=%d and username="%s" and type=%d',I('get.gid'),session('username'),2)->save();			
		}
		if($res1 || $res){
			echo "<script> alert('删除成功');  window.location.href=document.referrer;</script>";die; 
		}else{
			echo "<script> alert('删除失败');  window.location.href=document.referrer;</script>";die; 
		}
	}

	/*农家院置顶*/
	public function njyzhiding(){
		A('Article')->deadlines();
		$this->judgeuser();
		$where['v_document.status']=1;
		$where['v_document.zhuangtai']=10;
		$where['v_document_article.username']=session('username');
		$where['v_document_article.fjmc']=array('neq','');
		$where['v_document_article.city']=array('neq','');
		$where['v_document.category_id']=array('in',$this->getChildrenIds(84));
		$res=$this->tdocument()
				->join('v_document_article ON v_document.id=v_document_article.id')
				->join('v_category ON v_document.category_id=v_category.id')	
				->where($where)
				->field('v_document.id,v_document.up_status,v_document.title,v_document.status,v_document_article.phone,v_document.zhuangtai,v_document.update_time,v_document.time_long,v_document.view')
				->order('v_document.create_time desc')->select();
		$this->assign('catename','置顶');
		$this->assign('list',$res);
		$this->assign('username',session('username'));
		$this->display('Article/myweb/myweb');
	}

	/*农家院推广*/
	public function njytuiguang(){
		A('Article')->deadlines();
		$this->judgeuser();
		$where['v_document.status']=1;
		$where['v_document.zhuangtai']=5;
		$where['v_document_article.username']=session('username');
		$where['v_document_article.fjmc']=array('neq','');
		$where['v_document_article.city']=array('neq','');
		$where['v_document.category_id']=array('in',$this->getChildrenIds(84));
		$res=$this->tdocument()
				->join('v_document_article ON v_document.id=v_document_article.id')
				->join('v_category ON v_document.category_id=v_category.id')	
				->where($where)
				->field('v_document.id,v_document.up_status,v_document.title,v_document.status,v_document_article.phone,v_document.zhuangtai,v_document.update_time,v_document.time_long,v_document.view')
				->order('v_document.create_time desc')->select();

		$this->assign('catename','推广');
		$this->assign('list',$res);
		$this->assign('username',session('username'));
		$this->display('Article/myweb/myweb');
	}

	/*推广专员*/
	public function expanduser(){
		$this->judgeuser();
		$this->assign('username',session('username'));
		$this->display('Article/myweb/expanduser');
	}

	/*会员积分*/
	public function vipint(){
		$this->judgeuser();
		$p=M('personal');
		$res=$p->where('username="%s"',session('username'))->field('vipint')->find()['vipint'];
		$this->assign('username',session('username'));
		$this->assign('res',$res);
		$this->display('Article/myweb/vipint');	
	}

	/*手机版修改个人信息*/
	public function wapvip(){
		if(!empty(session('username'))){
			$p=M('personal');
			$where['username']=':name';
			$res=$p->where($where)->bind(':name',session('username'))->field('password',true)->find();
			$this->assign('list',$res);
			$this->assign('username',session('username'));
			$this->display('Article/myweb/wapvip');
			die;
		}else{
			redirect('/Login/login');
		}
	}

	/*我的钱包*/
	public function mymoney(){
		$this->judgeuser();
		$p=M('personal');
		$res=$p->where('username="%s"',session('username'))->field('mymoney')->find()['mymoney'];
		$this->assign('username',session('username'));
		$this->assign('res',$res);
		$this->display('Article/myweb/mymoney');
	}

	/*vip会员自己置顶
	 *每个景点的置顶位置是有限的
	*/
	public function vipzd(){
		$this->judgeuser();
		A('Article')->deadlines();
		$id=I('get.id','','intval');
		$panduan=$this->tarticle()->where('id=%d',$id)->field('username')->find()['username'];
		if($panduan !== session('username')){
			echo "<script> alert('没有权限');  history.go(-2);</script>";
			die;
		}
		$category_id=$this->tdocument()->where('id=%d',$id)->field('category_id,zhuangtai')->find();//所属于哪个类别ID
		if($category_id['zhuangtai']==10){
			echo "<script> alert('您已置顶');  window.location.href=document.referrer;</script>";die; 
		}elseif($category_id['zhuangtai']==5){
			echo "<script> alert('您已推广');  window.location.href=document.referrer;</script>";die; 
		}
		$fjmc=$this->tarticle()->where('id=%d',$id)->field('fjmc')->find()['fjmc'];//查出是哪个景点的
		$where['v_document.status']=1;
		$where['v_document.zhuangtai']=10;
		$where['v_document.category_id']=$category_id['category_id'];
		$where['v_document_article.fjmc']=$fjmc;
		$where['v_document_article.username']=array('neq','');
		$zdcount=$this->tdocument()
					->join('v_document_article ON v_document.id=v_document_article.id')
					->join('v_category ON v_document.category_id=v_category.id')
					->where($where)->count();	
		if($zdcount >= 3){ //同一景点的置顶位置不能超过3个
			echo "<script> alert('今日置顶已上限');  window.location.href=document.referrer;</script>";die; 
		}else{
			$p=M('personal');
			$mymoney=$p->where('username="%s"',session('username'))->field('mymoney')->find();//查询客户当前的余额
			$vipmoney=$mymoney['mymoney'];//客户没花钱之前的钱数
			$diff=intval($mymoney['mymoney'])-100;
			if($diff<0){echo "<script> alert('账户余额不足');  window.location.href=document.referrer;</script>";die;}
			$p->mymoney=$diff;
			$p->update_time=time();
			$res1=$p->where('username="%s"',session('username'))->save();
			if($res1){
				$where1['zhuangtai']=0;
				$where1['status']=1;
				$where1['id']=$id;
				$where1['category_id']=$category_id['category_id'];
				$this->tdocument()->time_long=time()+86400;
				$this->tdocument()->zhuangtai=10;
				$res=$this->tdocument()->where($where1)->save();//修改状态 和 置顶截止时间的表
				if($res){
					echo "<script> alert('置顶成功');  window.location.href=document.referrer;</script>";die; 
				}else{
					$p->mymoney=$vipmoney;
					$p->update_time=time();
					$p->where('username="%s"',session('username'))->save();	
				}
			}else{
				echo "<script> alert('系统繁忙');  window.location.href=document.referrer;</script>";die; 
			}
		}
	}

	/*手机版修改密码*/
	public function editpass(){
		$this->judgeuser();
 		$this->display('Article/myweb/password');
	}

	public function doeditpass(){
		$this->judgeuser();
		if(IS_POST){
			if(I('post.username') == session('username')){
				$p=M('personal');
				$where['username']=I('post.username');
				$where['password']=md5(I('post.password0').'zjl123abc');
				$a=$p->where($where)->find();
				if(!$a){
					echo "<script> alert('原密码不正确');  window.location.href=document.referrer;</script>";die; 
				}else{
					if(empty(I('post.password1')) || (I('post.password1') != I('post.password2'))){
						echo "<script> alert('新密码不能为空且与确认密码一致');  window.location.href=document.referrer;</script>";die; 
					}else{
						$where1['username']=I('post.username');
						$p->password=md5(I('post.password1').'zjl123abc');
						$b=$p->where($where1)->save();
						if($b){
							session('username',null);
							echo "<script> alert('修改密码成功,请重新登录');</script>";
							echo "<meta http-equiv='Refresh' content='0;URL=/Login/login.html'>"; 
							die; 
						}else{
							echo "<script> alert('修改密码失败请重试');  window.location.href=document.referrer;</script>";die; 
						}
					}
				}
			}else{
				echo "<script> alert('用户名不正确');  window.location.href=document.referrer;</script>";die; 
			}
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


}

?>
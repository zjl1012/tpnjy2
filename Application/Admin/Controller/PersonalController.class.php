<?php
namespace Admin\Controller;
use User\Api\UserApi;
use Think\Page;
class PersonalController extends AdminController {
    public function index($where=''){
        if(empty($_GET['p'])){
            $_GET['p']=1;
        }
        if($where==''){
            $where1['status']=1;
        }else{
            $where1['status']=1;
            $where1['username']=array('like',"%".$where."%");
        }
        $m=M('personal');
        $c=M('document_article');
        $count=$m->where($where1)->count();
        $page=new Page($count,10);
        $show=$page->show();
        $res=$m->where($where1)->page($_GET['p'].',10')->order('login_time desc')->select();
        foreach($res as $k=>$v){
            $q1=$c->join('v_document ON v_document.id=v_document_article.id')->where('v_document_article.username="'.$v['username'].'" and v_document.up_status=0')->field('v_document.up_status')->find();
            if($q1){
                $res[$k]['up_status']=$q1['up_status'];
            }else{
                $res[$k]['up_status']=1;
            }
        }
        $this->assign('page',$show);
        $this->assign('keyword',$where);
        $this->assign('list',$res);
        $this->assign('count',$count);
        $this->display('index');
    }


    public function indexkey($key=''){
        if(empty($_GET['p'])){
            $_GET['p']=1;
        }
        if($where==''){
            $where1['status']=1;
        }else{
            $where1['status']=1;
            $where1['username']=array('like',"%".$where."%");
        }
        $m=M('personal');
        $c=M('document_article');
        $count=$m->where($where1)->count();
        $page=new Page($count,10);
        $show=$page->show();
        $res=$m->where($where1)->page($_GET['p'].',10')->order('login_time desc')->select();
        foreach($res as $k=>$v){
            $q1=$c->join('v_document ON v_document.id=v_document_article.id')->where('v_document_article.username="'.$v['username'].'" and v_document.up_status=0')->field('v_document.up_status')->find();
            if($q1){
                $res[$k]['up_status']=$q1['up_status'];
            }else{
                $res[$k]['up_status']=1;
            }
        }
        $this->assign('page',$show);
        $this->assign('keyword',$where);
        $this->assign('list',$res);
        $this->assign('count',$count);
        $this->display('index');        
    }



    public function jinyong($where=''){//====会员回收站
        if(empty($_GET['p'])){
            $_GET['p']=1;
        }
        if($where==''){
            $where1['status']=0;
        }else{
            $where1['status']=0;
            $where1['username']=array('like',"%".$where."%");
        }
        $m=M('personal');
        $count=$m->where($where1)->count();
        $page=new Page($count,10);
        $show=$page->show();
        $res=$m->where($where1)->page($_GET['p'].',10')->order('login_time desc')->select();
        foreach($res as $k=>$v){
            $res[$k]['login_time']=date('Y-m-d H:i',$v['login_time']);
            if($v['status']==1){
                $res[$k]['status']='正常';
            }else{
                $res[$k]['status']='禁用';
            }
        }
        $this->assign('page',$show);
        $this->assign('keyword',$where);
        $this->assign('list',$res);
        $this->assign('count',$count);
        $this->display('Personal/jinyong');
    }    

    public function status($id=''){ //======禁用或正常
        $m=M('personal');
        $m->status=0;
        $res=$m->where('id='.$id)->save();
        if($res){
            // $this->redirect('Admin/Personal/index');
            $this->success('禁用成功');
        }else{
           $this->error('禁用失败');        
        }
    }

    public function edit($id=''){ //修改授权默认页面
        $m=M('personal');
        $res=$m->where('id=%d',I('get.id','','intval'))->find();
        $d=M('document');//类别表(农家院名称)
        $where['v_document.status']=1;
        $where['v_document_article.username']=$res['username'];
        $where['v_document_article.fjmc']=array('neq','');
        $where['v_document_article.city']=array('neq','');
        $where['v_document.category_id']=array('in',$this->getChildrenIds(84));
        $njy=$d->join('v_document_article ON v_document.id=v_document_article.id')->where($where)->field('v_document.id,v_document.title,v_document.zhuangtai,v_document.create_time,v_document.deadline,v_document.up_status')->select();
        $this->assign('njy',$njy);
        $this->assign('list',$res);
        $this->display('Personal/edit');
    } 

    public function update(){ //修改授权
        $m=M('personal');
        $m->mymoney=strFilter(I('post.money'));
        $m->update_time=time();
        $ras=$m->where('id=%d',I('post.id','','intval'))->save();
        if($ras){
            $this->success('修改成功');
        }else{
            $this->error('授权失败'); 
        }
    }

    public function recovery($id=''){ //还原禁用状态
        $m=M('personal');
        $m->status=1;
        $res=$m->where('id=%d',I('get.id','','intval'))->save();
        if($res){
            $this->success('还原成功');
        }else{
            $this->error('还原失败'); 
        }
    }

    public function del($id=''){//删除会员
        $m=M('personal');
        $res=$m->where('id=%d',I('get.id','','intval'))->delete(); 
        if($res){
            $this->success('删除成功');
        }else{
            $this->error('删除失败'); 
        }
    }

    public function mindex(){
        if(empty($_GET['p'])){
            $_GET['p']=1;
        }
        if($where==''){
        }else{
            $where1['username']=array('like',"%".$where."%");
        }
        $m=M('words');
        $count=$m->where($where1)->count();
        $page=new Page($count,10);
        $show=$page->show();
        $res=$m->where($where1)->page($_GET['p'].',10')->order('time desc')->select();
        $this->assign('page',$show);
        $this->assign('keyword',$where);
        $this->assign('list',$res);
        $this->assign('count',$count);
        $this->display('Massage/mindex');        
    }

    public function mdel($id=''){
        $m=M('words');
        $res=$m->where('id=%d',I('get.id','','intval'))->delete();
        if($res){
            $this->success('删除成功');
        }else{
           $this->error('删除失败');        
        }
    }




    /*个人项目*/
    public function webedit($id=''){
        $m=M('document');
        $d=M('document_article');
        $up=M('update');
        $p=M('picture');
        $up_status=$m->where('status=%d and id=%d',1,I('get.id','','intval'))->field('up_status')->find()['up_status'];
        if($up_status==0){
            $sup1=$up->where('gid=%d',I('get.id','','intval'))->find();
            if($sup1){
                $res=$up->join('v_picture ON v_picture.id=v_update.picid')->join('v_document ON v_document.id=v_update.gid')->where('v_update.gid=%d',I('get.id','','intval'))->field('v_picture.path,v_picture.id as pathid,v_document.title,v_document.id,v_document.create_time,v_document.zhuangtai,v_document.up_status,v_document.time_long,v_update.content,v_update.phone')->find();  
          }else{
                $res=$m->join('v_picture ON v_picture.id=v_document.cover_id')->join('v_document_article ON v_document.id=v_document_article.id')->where('v_document.status=%d and v_document.id=%d',1,I('get.id','','intval'))->field('v_document.id,v_document.title,v_document_article.content,v_document.create_time,v_document.up_status,v_document.zhuangtai,v_document.time_long,v_document_article.phone,v_document_article.fjmc,v_picture.path,v_picture.id as pathid')->find();
          }
        }else{
           $res=$m->join('v_picture ON v_picture.id=v_document.cover_id')->join('v_document_article ON v_document.id=v_document_article.id')->where('v_document.status=%d and v_document.id=%d',1,I('get.id','','intval'))->field('v_document.id,v_document.title,v_document_article.content,v_document.create_time,v_document.up_status,v_document.zhuangtai,v_document.time_long,v_document_article.phone,v_document_article.fjmc,v_picture.path,v_picture.id as pathid')->find(); 
        }
        /* 客户上传的图片 */
        $up1=M('update1');
        $up1ms=$up1->where('gid=%d and type=%d',$id,0)->field('picid')->find();
        foreach(array_filter(explode(',',$up1ms['picid'])) as $k=>$v){
            $upms1[]=$p->where('id=%d',$v)->field('path')->find();
        }
        $up1zs=$up1->where('gid=%d and type=%d',$id,1)->field('picid')->find();
        foreach(array_filter(explode(',',$up1zs['picid'])) as $k=>$v){
            $upzs1[]=$p->where('id=%d',$v)->field('path')->find();
        }
        $up1fj=$up1->where('gid=%d and type=%d',$id,2)->field('picid')->find();
        foreach(array_filter(explode(',',$up1fj['picid'])) as $k=>$v){
            $upfj1[]=$p->where('id=%d',$v)->field('path')->find();
        }

        /* 初始上传的图片 */
        $ms=$d->where('id=%d',$id)->field('meishi,fangjian,fengjing')->find();
        foreach(array_filter(explode(',',$ms['meishi'])) as $k=>$v){
            $ms1[]=$p->where('id=%d',$v)->field('path')->find();
        }
        foreach(array_filter(explode(',',$ms['fangjian'])) as $k=>$v){
            $zs1[]=$p->where('id=%d',$v)->field('path')->find();
        }
        foreach(array_filter(explode(',',$ms['fengjing'])) as $k=>$v){
            $fj1[]=$p->where('id=%d',$v)->field('path')->find();
        }    

        if($upms1){
            $this->assign('upms1',$upms1);
        }else{
            $this->assign('ms1',$ms1);
        }

        if($upzs1){
            $this->assign('upzs1',$upzs1); 
        }else{
            $this->assign('zs1',$zs1);
        }

        if($upfj1){
            $this->assign('upfj1',$upfj1); 
        }else{
            $this->assign('fj1',$fj1);
        }
        $this->assign('njy',$res);
        $this->display('Personal/webedit');
    }

    public function tzedit($id=''){
        $m=M('document');
        $d=M('document_article');
        $up=M('update');
        $p=M('picture');
        $up_status=$m->where('status=%d and id=%d',1,I('get.id','','intval'))->field('up_status')->find()['up_status'];
        if($up_status==0){
            $sup1=$up->where('gid=%d',I('get.id','','intval'))->find();
            if($sup1){
                $res=$up->join('v_picture ON v_picture.id=v_update.picid')->join('v_document ON v_document.id=v_update.gid')->where('v_update.gid='.$id)->field('v_picture.path,v_picture.id as pathid,v_document.title,v_document.id,v_document.create_time,v_document.zhuangtai,v_document.up_status,v_document.time_long,v_update.content as description,v_update.phone')->find();  
          }else{
                $res=$m->join('v_picture ON v_picture.id=v_document.cover_id')->join('v_document_article ON v_document.id=v_document_article.id')->where('v_document.status=1 and v_document.id='.$id)->field('v_document.id,v_document.title,v_document.description,v_document.create_time,v_document.up_status,v_document.zhuangtai,v_document.time_long,v_document_article.phone,v_picture.path,v_picture.id as pathid')->find();
          }
            
        }else{
           $res=$m->join('v_picture ON v_picture.id=v_document.cover_id')->join('v_document_article ON v_document.id=v_document_article.id')->where('v_document.status=1 and v_document.id='.$id)->field('v_document.id,v_document.title,v_document.description,v_document.create_time,v_document.up_status,v_document.zhuangtai,v_document.time_long,v_document_article.phone,v_picture.path,v_picture.id as pathid')->find(); 
        }
        /* 客户上传的图片 */
        $up1=M('update1');
        $up1ms=$up1->where('gid='.$id.' and type=0')->field('picid')->find();
        foreach(array_filter(explode(',',$up1ms['picid'])) as $k=>$v){
            $upms1[]=$p->where('id='.$v)->field('path')->find();
        }
        $up1zs=$up1->where('gid='.$id.' and type=1')->field('picid')->find();
        foreach(array_filter(explode(',',$up1zs['picid'])) as $k=>$v){
            $upzs1[]=$p->where('id='.$v)->field('path')->find();
        }
        $up1fj=$up1->where('gid='.$id.' and type=2')->field('picid')->find();
        foreach(array_filter(explode(',',$up1fj['picid'])) as $k=>$v){
            $upfj1[]=$p->where('id='.$v)->field('path')->find();
        }

        /* 初始上传的图片 */
        $ms=$d->where('id='.$id)->field('meishi,fangjian,fengjing')->find();
        foreach(array_filter(explode(',',$ms['meishi'])) as $k=>$v){
            $ms1[]=$p->where('id='.$v)->field('path')->find();
        }
        foreach(array_filter(explode(',',$ms['fangjian'])) as $k=>$v){
            $zs1[]=$p->where('id='.$v)->field('path')->find();
        }
        foreach(array_filter(explode(',',$ms['fengjing'])) as $k=>$v){
            $fj1[]=$p->where('id='.$v)->field('path')->find();
        }    
        $this->assign('ms1',$ms1);
        $this->assign('zs1',$zs1);
        $this->assign('fj1',$fj1);

        $this->assign('upms1',$upms1);
        $this->assign('upzs1',$upzs1);
        $this->assign('upfj1',$upfj1);
        $this->assign('njy',$res);
        $this->display('Personal/tzedit');
    }





    public function webdetail($id=''){

        $m=M('document');
        $pid=$m->where('status!=-1 and id='.$id)->field('category_id')->find()['category_id'];
        $c=M('category');
        $ptitle=$c->where('status=1 and id='.$pid)->field('title')->find()['title'];
        $res=$m->join('v_document_article ON v_document.id=v_document_article.id')->join('v_picture ON v_picture.id=v_document.cover_id')->where(' v_document.status!=-1 and v_document.id='.$id)->field('v_document.create_time,v_document.title,v_document.status,v_document.id,v_document_article.price,v_document_article.content,v_document_article.flxz,v_picture.path')->find();
        $this->assign('list',$res);
        $this->assign('ptitle',$ptitle);
        $this->display('Personal/webdetail');

    }

    public function webupdate(){//修改待审核的内容
        $id=I('post.id');
        $status=I('post.status');
        $m=M('document');
        $m->status=$status;
        $res=$m->where('id=%d',$id)->save();
        if($res){
            echo"<script>alert('修改成功');history.go(-2);</script>";
        }else{
            $this->error('修改失败');
        }
    }

    public function webupdate1(){//修改农家院的审核信息或置顶/普通/推广
        $fjmc=I('post.fjmc');
        $m=M('document_article');
        $d=M('document');
        $up1=M('update1');
        if(I('post.zhuangtai')==5){
            $tnum=$d->join('v_document_article ON v_document.id=v_document_article.id')->where('v_document.status=1 and v_document.zhuangtai=5 and v_document_article.fjmc="%s"',$fjmc)->count();
            if($tnum>=3){
                $this->error('推广位置超出3个');die;
            }
        }
        if(I('post.zhuangtai')==10){
            $znum=$d->where('status=1 and zhuangtai=10')->count();
            if($znum>=5){
                $this->error('置顶位置超出5个');die;
            }
        }
        $d->cover_id=I('post.pathid');
        $d->up_status=I('post.check');
        $d->zhuangtai=I('post.zhuangtai');
        $d->time_long=strtotime(I('post.time_long'));
        $a=$d->where('status=1 and id=%d',I('post.id'))->save();
        if($a){
            if(I('post.check')==1){
                $msup1id=$up1->where('type=%d and gid=%d',0,I('post.id'))->find()['picid'];//修改上传的的美食图片id

                $zsup1id=$up1->where('type=%d and gid=%d',1,I('post.id'))->find()['picid'];//修改上传的的房间图片id

                $fjup1id=$up1->where('type=%d and gid=%d',2,I('post.id'))->find()['picid'];//修改上传的的风景图片id
                if($msup1id){$m->meishi=trim($msup1id,',');}
                if($zsup1id){$m->fangjian=trim($zsup1id,',');}
                if($fjup1id){$m->fengjing=trim($fjup1id,',');}
                $m->phone=I('post.phone');
                $m->content=I('post.miaoshu');
                $m->update_time1=time();
                $b=$m->where('id=%d',I('post.id'))->field('phone,content,meishi,fangjian,fengjing,update_time1')->filter('strip_tags')->save();
                if($b&&$a){
                    $c=$up1->where('gid='.I('post.id'))->delete();
                    echo "<script> alert('修改成功');  window.location.href=document.referrer; </script>";die;
                }else{
                    $this->error('修改失败');die;
                }
            }
        }else{
            $this->error('修改失败');
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
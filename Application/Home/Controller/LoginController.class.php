<?php
namespace Home\Controller;
use Think\Model;
class LoginController extends HomeController{
	protected function users(){return M('personal');}

	public function register(){$this->display('Article/register');}

	public function login(){LoginController::judgeusername();$this->display('Article/login');}

	public function quit(){session('username',null);redirect('/');}

	/*个人中心页*/
	public function vip(){
		if(!empty(session('username'))){
			$where['username']=':name';
			$res=$this->users()->where($where)->bind(':name',session('username'))->field('password',true)->find();
			// $this->cityxz();
			$this->assign('list',$res);
			$this->assign('username',session('username'));
			$this->display('Article/vip');
		}else{
			redirect('/Login/login');
		}
	}	
	
	/*验证用户名是否唯一*/
	public function doreg0(){
		LoginController::judgeusername(); 
		if(IS_POST){
			if(!preg_match("/^[0-9a-z]{6,12}$/",I('post.name'))){  
				echo "no1";  die;
			}
			if($this->users()->where('username="%s"',I('post.name'))->field('username')->find()){
				echo '用户名已存在';die;
			}else{
				echo 'ok';
			}
		}else{
			echo "用户名长度为6-12位且为数字字母";die;
		}
	}

	/*验证手机号码是否唯一*/
	public function phone(){
		LoginController::judgeusername();
		if(IS_POST){
			if(!preg_match("/^1[34578]\d{9}$/",I('post.phonenumber'))){  
				echo "no1";  die;
			}
			if($this->users()->where('phone="%s"',I('post.phonenumber'))->field('phone')->find()){
				echo '手机号码已存在';die;
			}else{
				echo 'ok';
			}
		}else{
			echo "手机号码不正确";die;
		}

	}

	/*自动验证注册信息并执行插入*/
	public function doreg(){
		LoginController::judgeusername();	
		$codetime1=time()-session('codetime');
		// if($codetime1>120 || session('codeyzm')!=I('post.yzm',0,'intval')){			
  //           echo "<script> alert('验证码错误');  window.location.href=document.referrer;</script>";
		// 	die;
		// }
		$users=D('Personal');
		$fields=array('username','password','phone','ip','login_ip','login_time','create_time');
		if(!$users->field($fields)->create()){	// 如果创建失败 表示验证没有通过 输出错误提示信息  
            echo "<script> alert('信息中存在非法字符或格式不正确,请重试');  window.location.href=document.referrer;</script>";
            die;
		}else{	// 验证通过 可以进行其他数据操作
			$ip=get_client_ip();
			$users->password=md5($users->password.'zjl123abc');
			$users->ip=$ip;
			$users->login_ip=$ip;
			$users->create_time=time();
			$users->login_time =time();
			$seusername=$users->username;
			$success=$users->add();
			if($success){
				session('username',$seusername);
				redirect('/');
			}
		}
	}

	/*执行登录*/
	public function dologin(){
		LoginController::judgeusername();
		if(IS_POST){
			if(!preg_match("/^[0-9a-z]{6,12}$/",I('post.username1'))){  
				echo "<script> alert('用户名长度为6-12位且为数字字母');  window.location.href=document.referrer; </script>";
            	die;
			}else{
				$where['username']=I('post.username1');
				$resming=$this->users()->where($where)->find();
				if(!$resming){
					echo "<script> alert('用户名不存在');  window.location.href=document.referrer; </script>";
		        	die;	
				}
				$where['password']=md5(I('post.password1').'zjl123abc');
				$res=$this->users()->where($where)->find();
				if($res){
					if(time()-$res['login_time']>86400){
						$this->users()->vipint=$res['vipint']+100;
					}
					$this->users()->login_time=time();
					$this->users()->login_ip=get_client_ip();
					$rag=$this->users()->where($where)->save();
					session('username',null);
					session('username',I('post.username1'));
					redirect('/Login/vip.html');
				}else{
					echo "<script> alert('密码错误');  window.location.href=document.referrer; </script>";
		        	die;			
				}
			}
		}else{
			echo "<script> alert('用户名长度为6-12位且为数字字母');  window.location.href=document.referrer; </script>";
        	die;			
		}
	}

	/*短信发送验证码*/
	public function duanxin(){
		if(IS_POST){
			if(!preg_match("/^[0-9a-z]{6,12}$/",I('post.name'))){  
				echo "no";  die;
			}
			if($this->users()->where('username="%s"',I('post.name'))->field('username')->find()){
				echo 'no';die;
			}else{
				if(IS_POST){
					if(!preg_match("/^1[34578]\d{9}$/",I('post.phonenumber'))){  
						echo "no";  die;
					}
					if($this->users()->where('phone="%s"',I('post.phonenumber'))->field('phone')->find()){
						echo 'no';die;
					}else{
						$to=I('post.phonenumber');
						$options['accountsid']='513264d39c70d3621d2fba7c3d9bf178';
						$options['token']='69cee797576f99ebf173f7a108c5c737';
						$ucpass = new \Think\Ucpaas($options);
						$appId = "144b356831ef445f888881b09df0faff";
						$templateId = "36607";
						$ychar="0,1,2,3,4,5,6,7,8,9";
						$list=explode(",",$ychar);
						for($i=0;$i<6;$i++){
							$randnum=rand(0,10);
							$code.=$list[$randnum];
						}
						session('codeyzm',$code);
						session('codetime',time());
						$a='去农家旅游网'.','.$code.','.'2';
						echo $ucpass->templateSMS($appId,$to,$templateId,$a);
					}
				}else{
					echo "no";die;
				}
			}
		}else{
			echo 'no';die;
		}
	}		

	/*修改个人信息*/
    public function user_index(){
    	if(empty(session('username'))){
    		echo "<script> alert('请先登录') </script>";
            redirect('/login/login.html');die;
    	}
		$users=D('Personal');
		if(!$users->field('phone')->create($_POST,Model::MODEL_UPDATE)){	// 如果创建失败 表示验证没有通过 输出错误提示信息  
            echo "<script> alert('信息中存在非法字符或格式不正确,请重试');  window.location.href=document.referrer;</script>";
            die;
		}else{	// 验证通过 可以进行其他数据操作
			$uid['id']=I('post.userid','','intval');
	    	if($_FILES['t123']['name']!=''){
	    		$upload = new \Think\Upload();// 实例化上传类   
		  		$upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');
		  		$upload->savePath  =      '/Picture/'; 
		  		$info   =   $upload->uploadOne($_FILES['t123']); 
		  		if(!$info) {
	    			echo "<script> alert('图片上传失败,请重试');  window.location.href=document.referrer;</script>";
            		die;
		  		}else{
		  			$users->pic='/Uploads'.$info['savepath'].$info['savename'];
		  		}
	    	}	
	    	$users->update_time=time();
	    	if($users->where($uid)->save()){
	    		echo "<script> alert('修改成功');  window.location.href=document.referrer;</script>";
	    		die;
	    	}else{
	    		echo "<script> alert('修改失败');  window.location.href=document.referrer;</script>";
	    		die;
	    	}
		}
    }  

    /*判断是否能进入登录、注册页面*/
	static private function judgeusername(){
		if(!empty(session('username'))){
            echo "<script> alert('您已登录');  window.location.href=document.referrer;</script>";
            die;			
		}			
	}    

	/*图片水印*/
	public function myimg(){
		$image = new \Think\Image(); 
		$image->open('./Public/Home/images/xxx1.jpg');//将图片裁剪为440x440并保存为corp.jpg
		$image->open('./Public/Home/images/xxx1.jpg')->water('./Uploads/Picture/2017-09-14/59ba24bf4c745.png')->save("./Public/Home/images/xxx1.jpg"); 		
	}


}

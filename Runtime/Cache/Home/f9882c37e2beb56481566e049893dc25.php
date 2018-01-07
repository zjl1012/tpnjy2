<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>去农家---会员登录</title>
</head>
<body>
  <link rel="stylesheet" href="/Public/Home/css/pc/login.css">
  <div class="qnj_joinus_nav">
    <div class="qnj_joinus_navl">
      <a href="/"><img src="<?php echo get_cover(C('WEB_SITE_LOGO'),'path');?>"></a>
    </div>
    <div class="qnj_joinus_navr">
      <div style="border:none;"></div>
      <div style="border:none;"></div>
      <a href="<?php echo U('Article/index?category='.company);?>"><div>公司简介</div></a>
      <a href="<?php echo U('Article/index?category='.contactus);?>"><div>联系我们</div></a>
      <a href="javascript:;"><div>用户协议</div></a>
    </div>  
  </div>
  <form action="<?php echo U('Login/dologin');?>" method="post">
    <p class="qnj_register_title">去农家账号登录</span></p>
    <div class="qnj_reg_detail">
      <div class="qnj_reg_details">
        <div class="res_sons">
          <div class="reg_pic">
            <img src="/Public/Home/images/qnj_user.png">
          </div>
          <div class="reg_input">
            <input type="text" id="username" name="username1" placeholder="  用户名">
          </div>
        </div>
        <div style="width: 88%;height: 5px;border-bottom:1px solid #fff;margin:0 auto;"></div>
        <div class="res_sons">
          <div class="reg_pic">
            <img src="/Public/Home/images/qnj_pass.png" >
          </div>
          <div class="reg_input">
            <input type="password" id="password" name="password1" placeholder="  密码">
          </div>
        </div>
		<div style="width: 88%;height: 5px;border-bottom:1px solid #fff;margin:0 auto;"></div>
        <p >
          <input type="submit" id="submit" value="立&nbsp;即&nbsp;登&nbsp;录">
        </p>
        <br>
        <p >还没有账号<a href="<?php echo U('Login/register');?>">先注册</a> &nbsp;| &nbsp;<a href="javascript:;">忘记密码?</a>
        </div>
      </div>
    </form>  
  </body>
  </html>
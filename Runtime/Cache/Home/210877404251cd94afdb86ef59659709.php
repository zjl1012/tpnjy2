<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html lang="zh">
<head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <?php if($_category['meta_title'] != ''): ?><title><?php echo ($_category['meta_title']); ?></title>
        <?php elseif($info['title'] != ''): ?>
        <title><?php echo ($info['title']); ?></title>
        <?php else: ?>
        <title><?php echo C('WEB_SITE_TITLE');?></title><?php endif; ?>
    <?php if($_category['keywords'] != ''): ?><meta name="keywords" content="<?php echo ($_category['keywords']); ?>">
        <?php elseif($info['keyword'] != ''): ?>
        <meta name="keywords" content="<?php echo ($info['keyword']); ?>">
        <?php else: ?>
        <meta name="keywords" content="<?php echo C('WEB_SITE_KEYWORD');?>"><?php endif; ?>
    <?php if($_category['description'] != ''): ?><meta name="description" content="<?php echo ($_category['description']); ?>">
        <?php elseif($info['description'] != ''): ?>
        <meta name="description" content="<?php echo ($info['description']); ?>">
        <?php elseif($info['content'] != ''): ?>
        <meta name="description" content="<?php echo mb_substr(strip_tags($info['content']), 0, 100,'utf-8');?>">
        <?php elseif($info['template_detail'] != ''): ?>
        <meta name="description" content="<?php echo mb_substr($info['template_detail'], 0, 100, 'utf-8');?>">
        <?php else: ?>
        <meta name="description" content="<?php echo C('WEB_SITE_DESCRIPTION');?>"><?php endif; ?>
    <link rel="stylesheet" href="/Public/Home/css/pc/wlqnjstyle.css">
    <link rel="stylesheet" href="/Public/Home/css/pc/style.css">
    <script type="text/javascript" src="/Public/Home/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/Public/Home/js/pc/qnj_style.js"></script>

</head>
<body class="body">

<!-- 头部 -->

<div class="qnj_nav">
    <div class="qnj_logo">
        <a href="/"><img src="<?php echo get_cover(C('WEB_SITE_LOGO'),'path');?>" style="width: 230px;height: 82px;"></a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a class="qgmouseover" id="qnj_quanguo" style="font-size:13px;position:relative;top:-17px;">[全国农家]
            <div class="qnj_quanguo" >
                <?php if(is_array($cheng3)): foreach($cheng3 as $key=>$vo): ?><div class="qnj_quanguo2">
                        <p style="margin-top: 15px;"><?php echo ($key); ?></p>
                        <ul class="qnj_quanguo1">
                            <?php if(is_array($vo)): foreach($vo as $key=>$vo1): ?><li><a target="_blank" href="<?php echo U('Article/qnjsearch?citynum='.$vo1['name'].'&category=njy');?>"><?php echo ($vo1["title"]); ?></a></li><?php endforeach; endif; ?>
                        </ul>
                        <p><br></p>
                    </div><?php endforeach; endif; ?>
            </div>
        </a>
    </div>
    <div class="qnj_title">
        <ul class="qnj_nav_title">
            <?php $__NAV__ = M('Channel')->field(true)->where("status=1")->order("sort")->select(); if(is_array($__NAV__)): $i = 0; $__LIST__ = $__NAV__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i;?><li class="active1"><a href="<?php echo (get_nav_url($nav["url"])); ?>"><?php echo ($nav["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
	
	<div class="qnj_login">
    <?php if($username == ''): ?><a href="<?php echo U('/Home/Login/login');?>" style="color:#000">登录</a>
        &nbsp;<span style="color:#000">｜</span>&nbsp;
        <a href="/home/login/register" style="color:#ff7500">注册</a>
        <?php else: ?>  
        <a href="/Home/Login/vip" style="color:#000">欢迎：<?php echo ($username); ?></a>
        &nbsp;<span style="color:#000">｜</span>&nbsp;
        <a href="/home/login/quit" style="color:#ff7500">退出</a><?php endif; ?>  
    <p style="color:#f7c06c;"><img src="/Public/Home/images/more_phone.png">&nbsp;电话：<?php echo C('WEB_SITE_TEL');?></p>
</div>
</div>

</div>




<!-- /头部 -->

<!-- 主体 -->

  <link rel="stylesheet" type="text/css" href="/Public/Home/css/pc/qnjuser.css">
  <div style="width: 1423px;height: 20px;border-top:1px solid #eaeaea;margin:0 auto;"></div>
  <div class="vip_main">
    <div class="vip_main1">
        <div style="width: 200px;height: 80px;border-bottom:1px dashed #e1e1e1;text-align:center;line-height:80px;margin:0 auto;">
            <a href="<?php echo U('Login/vip');?>" style="text-decoration: none;font-size:18px;">个人资料</a>
        </div>
        <div style="width: 200px;height: 80px;border-bottom:1px dashed #e1e1e1;text-align:center;line-height:80px;margin:0 auto;">
            <a href="<?php echo U('Vip/vipint');?>" style="text-decoration: none;font-size:18px;">会员积分</a>
        </div>
        <div style="width: 200px;height: 80px;border-bottom:1px dashed #e1e1e1;text-align:center;line-height:80px;margin:0 auto;">
            <a href="<?php echo U('Vip/mymoney');?>" style="text-decoration: none;font-size:18px;color:#ff7500">我的钱包</a>
        </div>
        <div style="width: 200px;height: 80px;border-bottom:1px dashed #e1e1e1;text-align:center;line-height:80px;margin:0 auto;">
            <a href="<?php echo U('Vip/myweb');?>" style="text-decoration: none;font-size:18px;">我的农家院</a>
        </div>
        <div style="width: 200px;height: 80px;border-bottom:1px dashed #e1e1e1;text-align:center;line-height:80px;margin:0 auto;">
            <a href="<?php echo U('Vip/njyzhiding');?>" style="text-decoration: none;font-size:18px;">农家置顶</a>
        </div>
        <div style="width: 200px;height: 80px;border-bottom:1px dashed #e1e1e1;text-align:center;line-height:80px;margin:0 auto;">
            <a href="<?php echo U('Vip/njytuiguang');?>" style="text-decoration: none;font-size:18px;">农家推广</a>
        </div>
      <div style="width: 200px;height: 80px;border-bottom:1px dashed #e1e1e1;text-align:center;line-height:80px;margin:0 auto;">
          <a href="<?php echo U('Vip/expanduser');?>" style="text-decoration: none;font-size:18px;">推广专员</a>
      </div>
    </div>   
       <div class="vip_main2">
      <h2 align="center" style="color: #ff7500;">我的钱包</h2><hr>
      尊敬的<span style="color:#ff7500;"><?php echo ($username); ?></span>您当前的余额为：<?php echo ($res); ?>￥
      <br><br>
    </div>
  </div>

<!-- /主体 -->

<!-- 底部 -->
  
    <div class="qnj_footer">
        <div class="qnj_footer1">
            <div style="width: 1300px;height:10px ;"></div>
            <div style="width: 1300px;height: auto;margin:0 auto;border-bottom:1px solid #717171;">
                <h4 style="margin:5px 5px;color:#ccc;">友情链接</h4>
                <?php $_result=C('WEB_SITE_FRIEND_LINK_TITLE');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$f): $mod = ($i % 2 );++$i;?><a href="http://<?php echo C('WEB_SITE_FRIEND_LINK')[$key];?>" target="_blank" style="font-size:14px;color:#fff;margin:5px 5px;"><?php echo ($f); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
                <div style="width: 1300px;height:10px ;"></div>
            </div>   
            <div class="footer_contactus">
                <div>
                    <div style="width: 55px;height:50px;float:left;text-align:center;margin-left:30px;"><img src="/Public/Home/images/adress-icon.png"></div>
                    <div style="width: 200px;height:100px;float:left;color:#fff;font-weight:bold;font-size:14px;"><?php echo C('WEB_SITE_ADDRESS');?></div>
                </div>
                <div>
                    <div style="width: 55px;height:50px;float:left;text-align:center;margin-left:30px;"><img src="/Public/Home/images/call-icon.png"></div>
                    <div style="width: 200px;height:100px;float:left;color:#fff;font-weight:bold;font-size:14px;"><?php echo C('WEB_SITE_TEL');?><p>(9:00AM-6:00PM)</p></div>
                </div>
                <div>
                    <div style="width: 55px;height:50px;float:left;text-align:center;margin-left:30px;"><img src="/Public/Home/images/mail-icon.png"></div>
                    <div style="width: 200px;height:100px;float:left;color:#fff;font-weight:bold;font-size:14px;"><?php echo C('WEB_SITE_EMALL');?></div>
                </div>
                <div>
                    <div style="width: 55px;height:50px;float:left;text-align:center;margin-left:30px;"><img src="/Public/Home/images/join-us.png"></div>
                    <div style="width: 200px;height:100px;float:left;color:#fff;font-weight:bold;font-size:14px;">加入我们<p><a href="/" style="color:#fff;font-weight:bold;font-size:14px;">www.qunongjia.cn</a></p></div>
                </div>
            </div>
        </div>
        <div class="qnj_footer2">
            <div style="width: 1300px;height:10px ;"></div>
            <div class="footer_nav">
                <a href="<?php echo U('Login/register');?>">注册新用户</a>-
                <a href="">用户协议</a>-
                <a href="<?php echo U('Article/index?category='.company);?>">公司简介</a>-
                <a href="<?php echo U('Article/index?category='.Contactus);?>">联系我们</a>-
                <a href="">我要推广</a>
            </div>    
            <p style="color:#ccc;">版权：<?php echo C('WEB_SITE_COPYRIGHT');?></p>
            <p><?php echo C('WEB_SITE_ICP');?></p>
        </div>
    </div>
    <?php echo C('WEB_SITE_PUSH');?>

<!-- /底部 -->
</body>
</html>
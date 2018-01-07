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




<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <div class="banner" ><?php echo hook('imageSlider', $param);?></div>
  <div class="qnj_search">
    <div class="search1" id="search1">
      <img src="/Public/Home/images/settings.png">  拼音查找
      <div class="qnj_pinyin" style="z-index:9999;">
        <ul class="qnj_zimu" >
          <li style="width: 90px;background:#f38d2b;color:#fff;">热门城市</li>
          <li>A</li>
          <li>B</li>
          <li>C</li>
          <li>D</li>
          <li>E</li>
          <li>F</li>
          <li>G</li>
          <li>H</li>
          <li>J</li>
          <li>K</li>
          <li>L</li>
          <li>M</li>
          <li>N</li>
          <li>O</li>
          <li>P</li>
          <li>Q</li>
          <li>R</li>
          <li>S</li>
          <li>T</li>
          <li>W</li>
          <li>X</li>
          <li>Y</li>
          <li>Z</li>
        </ul>

        <div class="blaze">
          <ul>
            <li><a href="/Article/qnjsearch/citynum/beijing/category/njy.html">北京</a></li>
            <li><a href="/Article/qnjsearch/citynum/shanghai/category/njy.html">上海</a></li>
            <li><a href="/Article/qnjsearch/citynum/tj/category/njy.html">天津</a></li>
            <li><a href="/Article/qnjsearch/citynum/hebei/category/njy.html">河北</a></li>
          </ul>
          <br><br><br>
        </div>

        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasa)): foreach($rasa as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasb)): foreach($rasb as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasc)): foreach($rasc as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>

        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasd)): foreach($rasd as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rase)): foreach($rase as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasf)): foreach($rasf as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasg)): foreach($rasg as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rash)): foreach($rash as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasj)): foreach($rasj as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rask)): foreach($rask as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasl)): foreach($rasl as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasm)): foreach($rasm as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasn)): foreach($rasn as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($raso)): foreach($raso as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasp)): foreach($rasp as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasq)): foreach($rasq as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasr)): foreach($rasr as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rass)): foreach($rass as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rast)): foreach($rast as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasw)): foreach($rasw as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasx)): foreach($rasx as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasy)): foreach($rasy as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>  
        <div class="blaze" style="display:none;">
          <ul>
            <?php if(is_array($rasz)): foreach($rasz as $key=>$vo): ?><li><a href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&category=njy');?>" target="_blank"><?php echo ($vo["city"]); ?></a></li><?php endforeach; endif; ?>
          </ul>
          <br><br><br>
        </div>  
      </div>
    </div>
    <div class="search2">
      <!-- <img src="/Public/Home/images/位置交通.png"> -->周边景点推荐
      <div class="qnj_zhoubian" style="z-index:9999;">
        <div class="qnj_zhoubian1">
          <p style="font-size: 12px;font-weight: bold;"><?php echo get_category_title(116);?></p>
          <?php if(is_array($beijing)): foreach($beijing as $key=>$vo): ?><li>
            <a target="_blank" href="<?php echo U('Article/qnjsearch?citynum='.$vo['name'].'&city='.$vo['city'].'&scenic='.$vo['fjmc'].'&category=njy');?>"><?php echo ($vo["fjmc"]); ?></a>
          </li><?php endforeach; endif; ?>
        </div>
        
        <div style="border-top:1px dashed #ddd;background:#f8f8f8;text-align:center;">
            <p style="color:#6c6c6c">如未满足您的需求请您拨打官方电话：<span style="color:#ff6300;"><?php echo C('WEB_SITE_TEL');?></span></p>
        </div>               
      </div>
    </div>
    <div class="search3">
      <input type="text" id="key1" value="请输入商家关键字" style="color:#ff7500;float:left;height: 43px;border:none;width:500px;">
      <a href="javascript:;" class="njysearch1">
        <div style="float:right;background:#ff6300;width: 160px;height:43px;color:#fff;">搜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;索</div>
      </a>
    </div> 
  </div>

<!-- /头部 -->

<!-- 主体 -->

	<div style="width: 1423px;height: 10px;margin-left: auto;margin-right: auto;"></div>
	<div class="qnj_main">
		<div class="quntitle" id="floor01" align="center" style="font-size:25px;font-weight:900;height:45px;line-height:45px;">
<!-- 			<span class="dayu" style="font-size:15px;">＞＞＞＞＞＞＞＞＞＞</span>
			北京周边游
			<span class="dayu" style="font-size:15px;">＜＜＜＜＜＜＜＜＜＜</span> -->
			<div style="width:500px ;height: 45px;">
				<img src="/Public/Home/images/bg_d_meitu_1.jpg" style="width: 160px;">
				<span style="font-weight:100;">北京周边游</span>
				<img src="/Public/Home/images/bg_d_meitu_1.jpg" style="width: 170px;line-height:45px;">
			</div>
		</div>
		<div class="qnj_body1">
			<?php $category=D('Category')->getChildrenId(116);$__POSLIST__ = D('Document')->position(4,$category,10,true); if(is_array($__POSLIST__)): $i = 0; $__LIST__ = $__POSLIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$img): $mod = ($i % 2 );++$i;?><div class="qnj_body11 download">
				<p><a href="<?php echo U('Article/detail?id='.$img['id']);?>"><img src="<?php echo get_cover($img['cover_id'],'path');?>" ></a></p>
				<p style="text-align:center;color:#000;"><?php echo ($img["title"]); ?></p>
				<p ><span style="font-size:14px;color:#a8b0b9;">景点：</span><span style="font-size:14px;color:#000;"><?php echo get_extmodel_field($img['id'],'fjmc');?></span></p>
				<p style="margin-top:-10px;"><span style="font-size:14px;color:#a8b0b9;">地区：</span><span style="font-size:14px;color:#000;"><?php echo get_extmodel_field($img['id'],'city');?></span></p>
			</div><?php endforeach; endif; else: echo "" ;endif; ?>	
	</div>
	<br>
<!-- 	<div class="quntitle" id="floor1" align="center" style="font-size:25px;font-weight:900;height:45px;">
		<span class="dayu" style="font-size:15px;">＞＞＞＞＞＞＞＞＞＞</span>
		天津周边游
		<span class="dayu" style="font-size:15px;">＜＜＜＜＜＜＜＜＜＜</span>
	</div> -->
	<div class="quntitle" id="floor01" align="center" style="font-size:25px;font-weight:900;height:45px;line-height:45px;">
		<div style="width:500px ;height: 45px;">
			<img src="/Public/Home/images/bg_d_meitu_2.jpg" style="width: 160px;">
			<span style="font-weight:100;">天津周边游</span>
			<img src="/Public/Home/images/bg_d_meitu_2.jpg" style="width: 170px;line-height:45px;">
		</div>
	</div>	
	<div class="qnj_body1">
		<?php $category=D('Category')->getChildrenId(120);$__POSLIST__ = D('Document')->position(4,$category,10,true); if(is_array($__POSLIST__)): $i = 0; $__LIST__ = $__POSLIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$img): $mod = ($i % 2 );++$i;?><div class="qnj_body11">
			<p><a href="<?php echo U('Article/detail?id='.$img['id']);?>"><img src="<?php echo get_cover($img['cover_id'],'path');?>" ></a></p>
			<p style="text-align:center;color:#000;"><?php echo ($img["title"]); ?></p>
			<p ><span style="font-size:14px;color:#a8b0b9;">景点：</span><span style="font-size:14px;color:#000;"><?php echo get_extmodel_field($img['id'],'fjmc');?></span></p>
			<p style="margin-top:-10px;"><span style="font-size:14px;color:#a8b0b9;">地区：</span><span style="font-size:14px;color:#000;"><?php echo get_extmodel_field($img['id'],'city');?></span></p>
		</div><?php endforeach; endif; else: echo "" ;endif; ?>	
</div>
<br>
<!-- <div class="quntitle" id="floor2" align="center" style="font-size:25px;font-weight:900;height:45px;">
	<span class="dayu" style="font-size:15px;">＞＞＞＞＞＞＞＞＞＞</span>
	河北周边游
	<span class="dayu" style="font-size:15px;">＜＜＜＜＜＜＜＜＜＜</span>
</div> -->
	<div class="quntitle" id="floor01" align="center" style="font-size:25px;font-weight:900;height:45px;line-height:45px;">
		<div style="width:500px ;height: 45px;">
			<img src="/Public/Home/images/bg_d_meitu_3.jpg" style="width: 160px;">
			<span style="font-weight:100;">河北周边游</span>
			<img src="/Public/Home/images/bg_d_meitu_3.jpg" style="width: 170px;line-height:45px;">
		</div>
	</div>	
<div class="qnj_body1">
	<?php $category=D('Category')->getChildrenId(117);$__POSLIST__ = D('Document')->position(4,$category,10,true); if(is_array($__POSLIST__)): $i = 0; $__LIST__ = $__POSLIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$img): $mod = ($i % 2 );++$i;?><div class="qnj_body11">
		<p><a href="<?php echo U('Article/detail?id='.$img['id']);?>"><img src="<?php echo get_cover($img['cover_id'],'path');?>" ></a></p>
		<p style="text-align:center;color:#000;"><?php echo ($img["title"]); ?></p>
		<p ><span style="font-size:14px;color:#a8b0b9;">景点：</span><span style="font-size:14px;color:#000;"><?php echo get_extmodel_field($img['id'],'fjmc');?></span></p>
		<p style="margin-top:-10px;"><span style="font-size:14px;color:#a8b0b9;">地区：</span><span style="font-size:14px;color:#000;"><?php echo get_extmodel_field($img['id'],'city');?></span></p>
	</div><?php endforeach; endif; else: echo "" ;endif; ?>	
</div>
<br>
<div class="qnj_1117_news">
	<div class="qnj_1117_newsl">
		<p>
			<span class="qnj_1117_newsl_title"><?php echo get_category_title(54);?></span>
			<span class="qnj_1117_newsl_more"><a href="<?php echo U('Article/index?category='.TradeNews);?>">更多</a></span>
		</p>
		<div class="qnj_xhx"></div>
		<?php $category=D('Category')->getChildrenId(54);$__LIST__ = D('Document')->page(!empty($_GET["p"])?$_GET["p"]:1,8)->lists($category, '`level` DESC,`id` DESC', 1,true); if(is_array($__LIST__)): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$img): $mod = ($i % 2 );++$i;?><div class="qnj_1117_newsl_son">
			<a class="qnj_1117_newsl_sonimg" href="<?php echo U('Article/detail?id='.$img['id']);?>"><img src="<?php echo get_cover($img['cover_id'],'path');?>"></a>
			<p class="qnj_1117_newsl_sontitle"><a href="<?php echo U('Article/detail?id='.$img['id']);?>"><?php echo ($img["title"]); ?></a></p>
		</div><?php endforeach; endif; else: echo "" ;endif; ?>
		<div style="height: 45px;"></div>
		<p>
			<span class="qnj_1117_newsl_title"><?php echo get_category_title(56);?></span>
			<span class="qnj_1117_newsl_more"><a href="<?php echo U('Article/index?category='.honor);?>">更多</a></span>
		</p>
		<div class="qnj_xhx"></div>
		<?php $category=D('Category')->getChildrenId(56);$__LIST__ = D('Document')->page(!empty($_GET["p"])?$_GET["p"]:1,8)->lists($category, '`level` DESC,`id` DESC', 1,true); if(is_array($__LIST__)): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$img): $mod = ($i % 2 );++$i;?><div class="qnj_1117_newsl_son1">
			<a class="qnj_1117_newsl_sonimg1" href="<?php echo U('Article/detail?id='.$img['id']);?>"><img src="<?php echo get_cover($img['cover_id'],'path');?>"></a>
			<p class="qnj_1117_newsl_sontitle1"><a href="<?php echo U('Article/detail?id='.$img['id']);?>"><?php echo ($img["title"]); ?></a></p>
		</div><?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
	<!----------------旅游包车----------------->
<div class="qnj_1117_newsr">
		<p>
			<span class="qnj_1117_newsl_title"><?php echo get_category_title(139);?></span>
			<span class="qnj_1117_newsl_more"><a href="<?php echo U('Article/index?category='.chartered);?>">更多</a></span>
		</p>
		<div class="qnj_xhx"></div>
		<div class="qnj_body1">
	<?php $category=D('Category')->getChildrenId(139);$__POSLIST__ = D('Document')->position(4,$category,8,true); if(is_array($__POSLIST__)): $i = 0; $__LIST__ = $__POSLIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$show): $mod = ($i % 2 );++$i;?><div class="qnj_body12">
		<p><a href="<?php echo U('Article/detail?id='.$show['id']);?>"><img src="<?php echo get_cover($show['cover_id'],'path');?>" data-bd-imgshare-binded="1"></a></p>
		<p style="color:#000;"><?php echo ($show["title"]); ?></p>
		<p><span style="font-size:14px;color:#a8b0b9;">价格：</span><span style="font-size:14px;color:#000;">￥<?php echo get_extmodel_field($show['id'],'carprice');?></span></p>
	</div><?php endforeach; endif; else: echo "" ;endif; ?>
	
</div>			
	</div>
<!----------------旅游包车end----------------->
	<!----------------新闻动态----------------->
	<div class="qnj_1117_newsr">
		<p>
			<span class="qnj_1117_newsl_title"><?php echo get_category_title(53);?></span>
			<span class="qnj_1117_newsl_more"><a href="<?php echo U('Article/index?category='.companynews);?>">更多</a></span>
		</p>
		<div class="qnj_xhx"></div>
		<?php $category=D('Category')->getChildrenId(53);$__LIST__ = D('Document')->page(!empty($_GET["p"])?$_GET["p"]:1,3)->lists($category, '`level` DESC,`id` DESC', 1,true); if(is_array($__LIST__)): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$img): $mod = ($i % 2 );++$i;?><div class="qnj_1117_newsr_son">
			<div class="qnj_1117_newsr_sonl">
				<a class="qnj_1117_newsr_sonimg" href="<?php echo U('Article/detail?id='.$img['id']);?>"><img src="<?php echo get_cover($img['cover_id'],'path');?>"></a>
			</div>	
			<div class="qnj_1117_newsr_sonr">
				<p><a class="qnj_1117_newsr_sontitle" href="<?php echo U('Article/detail?id='.$img['id']);?>"><?php echo ($img["title"]); ?></a></p>
				<div class="qnj_1117_newsr_description">
					<?php echo get_extmodel_field($img['id'],'description');?> 
				</div>
				<p style="color:#000;font-size:13px;margin-top:15px;">发布时间：<?php echo (date("Y-m-d H:i:s",$img["create_time"])); ?></p>
			</div>
		</div><?php endforeach; endif; else: echo "" ;endif; ?>			
	</div>
		<!----------------新闻动态end----------------->

</div>
<script type="text/javascript" src="/Public/Home/js/pc/web.js"></script>
<script type="text/javascript">
$('.qnj_1117_newsl_sonimg:eq(0)').css('display','block');
	$('.qnj_1117_newsl_son').mouseover(function(){
		$('.qnj_1117_newsl_sonimg').css('display','none');
		$(this).find('.qnj_1117_newsl_sonimg').css('display','block');
		$(this).find('p').find('.qnj_1117_newsl_sontitle').css('color','#ff2d00');
	});
$('.qnj_1117_newsl_sonimg1:eq(0)').css('display','block');
	$('.qnj_1117_newsl_son1').mouseover(function(){
		$('.qnj_1117_newsl_sonimg1').css('display','none');
		$(this).find('.qnj_1117_newsl_sonimg1').css('display','block');
		$(this).find('p').find('.qnj_1117_newsl_sontitle1').css('color','#ff2d00');
	});	
$('img').mouseover(function(){
	$('.sr-bdimgshare-black').remove();
});	
</script>
</div>
<div class="qnj_class_float">
	<a class="qnj_beijing" href="javascript:;" style="text-decoration: none;"><div class="float_title " >北京</div></a>
	<a class="qnj_tianjin" href="javascript:;" style="text-decoration: none;"><div class="float_title" >天津</div></a>
	<a class="qnj_hebei" href="javascript:;" style="text-decoration: none;"><div class="float_title" >河北</div></a>
	<a class="qnj_gonglv" href="javascript:;" style="text-decoration: none;"><div class="float_title" >攻略</div></a>
</div>
<script type="text/javascript" src="/Public/Home/js/pc/qnj_style.js"></script>

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
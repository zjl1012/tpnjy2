<?php if (!defined('THINK_PATH')) exit();?><link rel="stylesheet" type="text/css" href="/Addons/ImageSlider/FlexSlider/flexslider.css" />
<style type="text/css">.flex-direction-nav li{line-height: 40px;}.flexslider .slides > li {overflow: hidden;}.flex-control-nav{bottom: 10px;}</style>
<!--<script type="text/javascript" src="/Public/static/jquery-2.0.3.min.js"></script>-->
<script type="text/javascript" src="/Addons/ImageSlider/FlexSlider/jquery.flexslider-min.js"></script>

<div class="flexslider">
  <ul class="slides">
      <!-- 插件配置幻灯片-->
      <?php if(is_array($images)): foreach($images as $k=>$images): ?><li><img src="<?php echo ($images["path"]); ?>" style="height:400px;" />
            </li><?php endforeach; endif; ?>
  </ul>
</div>
<script type="text/javascript">
        $('.flexslider').flexslider({
            animation: "slide",
            itemHeight:400
        });
</script>
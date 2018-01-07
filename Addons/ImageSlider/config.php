<?php
return array(
    'status'=>array(
        'title'=>'是否开启:',
        'type'=>'radio',
        'options'=>array(
            '1'=>'开启',
            '0'=>'关闭',
        ),
        'value'=>'0',
    ),

    'type'=>array(
        'title'=>'插件选择:',
        'type'=>'select',
        'options'=>array(
            'carousel' => 'Carousel',
            'flexslider' => 'Flexslider',
        ),
        'value'=>0,
    ),

    'images'=>array(
        'title' => '轮播图片（双击可移除）',
        'type'  => 'picture_union',
        'value' => ''
    ),


    'h'=>array(
        'title' => '幻灯文字标题(一行对应一个图片)',
        'type' => 'textarea',
        'value' => '',
    ),
    'p' =>array(
        'title' => '幻灯正文(一行对应一个图片',
        'type'  => 'textarea',
        'value' => '',
    )

    
);
                    
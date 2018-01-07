<?php
return array(
    'status'=>array(//配置在表单中的键名 ,这个会是config[random]
        'title'=>'是否开启:',//表单的文字
        'type'=>'radio',		 //表单的类型：text、textarea、checkbox、radio、select等
        'options'=>array(		 //select 和radion、checkbox的子选项
            '1'=>'开启',		 //值=>文字
            '0'=>'关闭',
        ),
        'value'=>'1',			 //表单的默认值
    ),
    'number'=>array(
        'title' => 'qq号码(一行对应一个qq)',
        'type' => 'textarea',
        'value' => '',
    ),
    'name'=>array(
        'title' => 'qq昵称(一行对应一个昵称)',
        'type' => 'textarea',
        'value' => '',
    ),

    'position'=>array(
        'title' => '悬浮位置',
        'type'=>'select',
        'options'=>array(
            'left' => '左侧',
            'right' => '右侧',
        ),
        'value'=>'left',
    ),
    'horizontal' => array(
        'title' => '水平方向位置',
        'type' => 'text',
        'value' => 0,
    ),

    'vertical' => array(
        'title' => '垂直方向位置',
        'type' => 'text',
        'value' => 100,
    ),
    'minStatue'=>array(
        'title'=>'是否最小化',
        'type'=>'radio',
        'options'=>array(
            'false'=>'不允许',
            'true'=>'允许'
        ),
        'value'=> true,
    ),
    'skin'=>array(
        'title' => '皮肤',
        'type'=>'select',
        'options'=>array(
            'blue' => '蓝色',
            'gray' => '灰色',
            'green' => '绿色',
            'orange' => '橙色',
            'yellow' => '黄色',
        ),
        'value'=>'blue',
    ),
);


<?php

namespace Addons\ImageSlider;
use Common\Controller\Addon;

/**
 * 图片轮播插件
 * @author V 
 */

    class ImageSliderAddon extends Addon{

        public $info = array(
            'name'=>'ImageSlider',
            'title'=>'图片轮播',
            'description'=>'图片轮播',
            'status'=>1,
            'author'=>'V',
            'version'=>'0.1'
        );

        public function install(){
            return true;
        }

        public function uninstall(){
            return true;
        }
        
        //实现的ImageSlider钩子方法
        public function imageSlider($param){
            $config = $this->getConfig();
            if($config['status']){
                $images = array();
                if($config['images']){
                    $images = M("Picture")->field('id,path')->where("id in ({$config['images']})")->select();
                }
                $this->assign('h', explode("\r\n",$config['h']));
                $this->assign('p', explode("\r\n",$config['p']));
                $this->assign('images', $images);
                $this->assign('config', $config);
                $this->display($config['type']);
            }
        }
    }
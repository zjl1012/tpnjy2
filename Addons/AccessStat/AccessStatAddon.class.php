<?php

namespace Addons\AccessStat;
use Common\Controller\Addon;

/**
 * 访问统计插件插件
 * @author V
 */

    class AccessStatAddon extends Addon{

        public $info = array(
            'name'=>'AccessStat',
            'title'=>'访问统计插件',
            'description'=>'添加网站的访问统计监控代码',
            'status'=>0,
            'author'=>'V',
            'version'=>'0.1'
        );

        public function install(){
            return true;
        }

        public function uninstall(){
            return true;
        }

        //实现的pageFooter钩子方法
        public function pageFooter($param){
            $config = $this->getConfig();
            if($config['status']){
                $this->assign('config', $config);
                $this->display('stat');
            }
        }

    }
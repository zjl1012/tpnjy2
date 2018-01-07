<?php

namespace Addons\QQ;
use Common\Controller\Addon;

/**
 * QQ在线客服插件插件
 * @author V
 */

    class QQAddon extends Addon{

        public $info = array(
            'name'=>'QQ',
            'title'=>'QQ在线客服插件',
            'description'=>'在线QQ客服',
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

        //实现的pageFooter钩子方法
        public function pageFooter($param){
            $config = $this->getConfig();
            if($config['status']) {
                $this->assign('numbers', explode("\r\n",$config['number']));
                $this->assign('names', explode("\r\n",$config['name']));
                $this->assign('config', $config);
                $this->display('qq');
            }
        }

    }
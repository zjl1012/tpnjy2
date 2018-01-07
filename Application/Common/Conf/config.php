<?php


/**
 * 系统配文件
 * 所有系统级别的配置
 */
return array(
    /* 模块相关配置 */
    'AUTOLOAD_NAMESPACE' => array('Addons' => ONETHINK_ADDON_PATH), //扩展模块列表
    'DEFAULT_MODULE'     => 'Home',
    //'MODULE_DENY_LIST'   => array('Common','User','Admin','Install'),
    'MODULE_ALLOW_LIST'  => array('Home','Admin'),
    /* 系统数据加密设置 */
    'DATA_AUTH_KEY' => 'BX*2~-Lo@:{t.NRr|O?7_C[K&zg4)aTEImA$v`wd', //默认数据加密KEY

    /* 用户相关设置 */
    'USER_MAX_CACHE'     => 1000, //最大缓存用户数
    'USER_ADMINISTRATOR' => 1, //管理员用户ID

    /* URL配置 */
    'URL_CASE_INSENSITIVE' => true, //默认false 表示URL区分大小写 true则表示不区分大小写
    'URL_MODEL'            => 2, //URL模式
    'VAR_URL_PARAMS'       => '', // PATHINFO URL参数变量
    'URL_PATHINFO_DEPR'    => '/', //PATHINFO URL分割符

    /* 全局过滤配置 */
    'DEFAULT_FILTER' => '', //全局过滤函数

    /* 数据库配置 */
    'DB_TYPE'   => 'mysql', // 数据库类型
    'DB_HOST'   => '127.0.0.1', // 服务器地址
    'DB_NAME'   => 'njy', // 数据库名
    'DB_USER'   => 'njy', // 用户名
    'DB_PWD'    => '5da0755e-234e-4f13-a0e1-541d6672239f',  // 密码
    'DB_PORT'   => '3306', // 端口
    'DB_PREFIX' => 'v_', // 数据库表前缀
    /* 文档模型配置 (文档模型核心配置，请勿更改) */
    'SHOW_PAGE_TRACE' =>true,
    'DOCUMENT_MODEL_TYPE' => array(2 => '主题', 1 => '目录', 3 => '段落'),
);

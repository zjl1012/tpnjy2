<?php


/**
 * UCenter客户端配置文件
 * 注意：该配置文件请使用常量方式定义
 */

define('UC_APP_ID', 1); //应用ID
define('UC_API_TYPE', 'Model'); //可选值 Model / Service
define('UC_AUTH_KEY', 'BX*2~-Lo@:{t.NRr|O?7_C[K&zg4)aTEImA$v`wd'); //加密KEY
define('UC_DB_DSN', 'mysql://njy:5da0755e-234e-4f13-a0e1-541d6672239f@127.0.0.1:3306/njy'); // 数据库连接，使用Model方式调用API必须配置此项
define('UC_TABLE_PREFIX', 'v_'); // 数据表前缀，使用Model方式调用API必须配置此

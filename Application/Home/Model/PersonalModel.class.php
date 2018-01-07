<?php


namespace Home\Model;
use Think\Model;

/**
 * 文档基础模型
 */
class PersonalModel extends Model{
	/* 字段映射 */
     protected $_map= array('name' =>'username', // 把表单中name映射到数据表的username字段 
     						'phonenumber' => 'phone',
                            'vippassword' => 'password',
                            'qqid'        => 'qq',
                            'xingbie'     => 'sex',
     						);

    /* 自动验证规则--静态 */
    protected $_validate = array(
        array('username', 'require', '用户名不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_INSERT),
        array('username', 'strFilter', '用户名存在非法字符', self::MUST_VALIDATE, 'callback', self::MODEL_INSERT),
        array('username', '', '用户名已经存在', self::MUST_VALIDATE, 'unique', self::MODEL_INSERT),
        array('username', '/^[0-9a-z]{6,12}$/', '用户名长度为6-12位且为数字字母', self::VALUE_VALIDATE, 'regex', self::MODEL_INSERT),
        array('phone', 'require', '电话号码不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('phone', '', '手机号码已经存在', self::MUST_VALIDATE, 'unique', self::MODEL_INSERT),
        array('phone', '/^1[34578]\d{9}$/', '手机号码不正确', self::VALUE_VALIDATE, 'regex', self::MODEL_BOTH),
        array('qq', '/^[0-9]{5,12}$/', 'QQ号码不正确', self::VALUE_VALIDATE, 'regex', self::MODEL_UPDATE),
        array('sex', '/^[0-9]{1}$/', '性别不正确', self::VALUE_VALIDATE, 'regex', self::MODEL_UPDATE),
        array('viprepassword','password','确认密码不正确',EXISTS_VALIDATE ,'confirm'), // 验证确认密码是否和密码一致
        array('password', 'require', '密码不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_INSERT),
    );

    protected function strFilter($str){
        if(eregi('select|inert|insert|databases|database|drop|update|delete|"|\'|\/\*|\*|\.\.\/|\.\/|UNION|into|load_file|outfile', $str)){
            return false;
            die;
        }else{
           return trim($str); 
        }
    }
}

?>
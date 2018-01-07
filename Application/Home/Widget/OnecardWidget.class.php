<?php


namespace Home\Widget;
use Think\Controller;

/**
 * 分类widget
 * 用于动态调用分类信息
 */

class OnecardWidget extends Controller{
	
	/* 显示指定分类的同级分类或子分类列表 */
	public function lists($cate, $child = false){
		$field = 'id,name,pid,title,link_id,list_row';
		if($child){
			$category = D('Category')->getTree($cate, $field);
			$category = $category['_'];
		} else {
			$category = D('Category')->getSameLevel($cate, $field);
		}
        //随机获取一个分类
        $category_index = array_rand($category);
        $rand_category[] = $category[$category_index];

		$this->assign('category', $rand_category);
		$this->assign('current', $cate);
		$this->display('Category/onecard');
	}
	
}

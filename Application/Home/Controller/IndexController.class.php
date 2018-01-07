<?php
namespace Home\Controller;
use OT\DataDictionary;
use Think\Page;
/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {

    //系统首页
    public function index(){
        A('Article')->deadlines();
        $category = D('Category')->getTree();
        $lists    = D('Document')->lists(null);
        $this->assign('category',$category);//栏目
        $this->assign('lists',$lists);//列表
        $this->assign('page',D('Document')->page);//分页
        $this->cityxz();
        $this->zdcity();
        $this->display();
    }

    public function cityxz(){
        $d=M('category');
        $d1=M('document');
        $ares=$d->where('status=1 and pid=84')->field('title,id,name')->select();
        foreach($ares as $k=>$v){
            $bres[$v['title']]=$d->where('status=1 and pid='.$v['id'])->field('title,id,name')->select();
        }

        $beijing=$d1->join('v_category ON v_category.id=v_document.category_id')
                    ->join('v_document_article ON v_document.id=v_document_article.id')
                    ->where('v_document.status=1 and v_document.category_id=116')
                    ->field('v_category.name,v_document_article.city,v_document_article.fjmc')
                    ->select();
       
        foreach($beijing as $k=>$v){$bj[$k]=$v['fjmc'];}
        $bj=array_unique($bj);
        foreach($bj as $k=>$v){$bjk[]=$k;}
        foreach($bjk as $k=>$v){ $bj1[]=$beijing[$v];}//北京的
        $this->assign('beijing',$bj1);
        
        $this->assign('cheng3',$bres);//全国城市的选择
        $this->assign('username',session('username'));            
    }

    public function zdcity(){
        $mcity=M('document');
        $kcity['v_document_article.fjmc']=array('neq','');
        $kcity['v_document_article.city']=array('neq','');
        $kcity['v_document_article.username']=array('neq','');
        $kcity['v_document.category_id']=array('in',$this->getChildrenIds(84));
        $remcity=$mcity->join('v_document_article ON v_document.id=v_document_article.id')
                       ->join('v_category ON v_category.id=v_document.category_id')
                       ->where($kcity)->field('v_document_article.city,v_category.name')->select();
        $w = [];
        foreach ($remcity as $k =>$v) {  
            $w[$k]['zimu'] = $this->getStrOne($v['city']);
            $w[$k]['city'] = $v['city'];
            $w[$k]['name'] = $v['name'];
        }
        $rasa=[];$rasb=[];$rasc=[];$rasd=[];$rase=[];$rasf=[];$rasg=[];$rash=[];$rasi=[];$rasj=[];
        $rask=[];$rasl=[];$rasm=[];$rasn=[];$raso=[];$rasp=[];$rasq=[];$rasr=[];$rass=[];$rast=[];
        $rasu=[];$rasv=[];$rasw=[];$rasx=[];$rasy=[];$rasz=[];
        foreach($w as $k=>$v){
            if(mb_substr($w[$k]['zimu'],0,1)=='a'){$rasa[$k]['city']=$w[$k]['city'];$rasa[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='b'){$rasb[$k]['city']=$w[$k]['city'];$rasb[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='c'){$rasc[$k]['city']=$w[$k]['city'];$rasc[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='d'){$rasd[$k]['city']=$w[$k]['city'];$rasd[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='e'){$rase[$k]['city']=$w[$k]['city'];$rase[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='f'){$rasf[$k]['city']=$w[$k]['city'];$rasf[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='g'){$rasg[$k]['city']=$w[$k]['city'];$rasg[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='h'){$rash[$k]['city']=$w[$k]['city'];$rash[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='i'){$rasi[$k]['city']=$w[$k]['city'];$rasi[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='j'){$rasj[$k]['city']=$w[$k]['city'];$rasj[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='k'){$rask[$k]['city']=$w[$k]['city'];$rask[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='l'){$rasl[$k]['city']=$w[$k]['city'];$rasl[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='m'){$rasm[$k]['city']=$w[$k]['city'];$rasm[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='n'){$rasn[$k]['city']=$w[$k]['city'];$rasn[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='o'){$raso[$k]['city']=$w[$k]['city'];$raso[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='p'){$rasp[$k]['city']=$w[$k]['city'];$rasp[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='q'){$rasq[$k]['city']=$w[$k]['city'];$rasq[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='r'){$rasr[$k]['city']=$w[$k]['city'];$rasr[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='s'){$rass[$k]['city']=$w[$k]['city'];$rass[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='t'){$rast[$k]['city']=$w[$k]['city'];$rast[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='u'){$rasu[$k]['city']=$w[$k]['city'];$rasu[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='v'){$rasv[$k]['city']=$w[$k]['city'];$rasv[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='w'){$rasw[$k]['city']=$w[$k]['city'];$rasw[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='x'){$rasx[$k]['city']=$w[$k]['city'];$rasx[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='y'){$rasy[$k]['city']=$w[$k]['city'];$rasy[$k]['name']=$w[$k]['name'];}
            if(mb_substr($w[$k]['zimu'],0,1)=='z'){$rasz[$k]['city']=$w[$k]['city'];$rasz[$k]['name']=$w[$k]['name'];}        
        }
        $this->assign('rasa',array_unique($rasa));
        $this->assign('rasb',array_unique($rasb));
        $this->assign('rasc',array_unique($rasc));
        $this->assign('rasd',array_unique($rasd));
        $this->assign('rase',array_unique($rase));
        $this->assign('rasf',array_unique($rasf));
        $this->assign('rasg',array_unique($rasg));
        $this->assign('rash',array_unique($rash));
        $this->assign('rasi',array_unique($rasi));
        $this->assign('rasj',array_unique($rasj));
        $this->assign('rask',array_unique($rask));
        $this->assign('rasl',array_unique($rasl));
        $this->assign('rasm',array_unique($rasm));
        $this->assign('rasn',array_unique($rasn));
        $this->assign('raso',array_unique($raso));
        $this->assign('rasp',array_unique($rasp));
        $this->assign('rasq',array_unique($rasq));
        $this->assign('rasr',array_unique($rasr));
        $this->assign('rass',array_unique($rass));
        $this->assign('rast',array_unique($rast));
        $this->assign('rasu',array_unique($rasu));
        $this->assign('rasv',array_unique($rasv));
        $this->assign('rasw',array_unique($rasw));
        $this->assign('rasx',array_unique($rasx));
        $this->assign('rasy',array_unique($rasy));
        $this->assign('rasz',array_unique($rasz));
    }


    private function getStrOne($str){  
        if(empty($str)) return ''; 
     
        $fchar = ord($str{0});  
        if($fchar >= ord('A') && $fchar <= ord('z')) return strtoupper($str{0});
     
        $s1 = iconv('UTF-8','gb2312',$str);  
        $s2 = iconv('gb2312','UTF-8',$s1);  
        $s = $s2==$str ? $s1 : $str;  
        $asc = ord($s{0})*256+ord($s{1})-65536;  
     
        if($asc>=-20319 && $asc<=-20284) return 'a';  
        if($asc>=-20283 && $asc<=-19776) return 'b';  
        if($asc>=-19775 && $asc<=-19219) return 'c';  
        if($asc>=-19218 && $asc<=-18711) return 'd';  
        if($asc>=-18710 && $asc<=-18527) return 'e';  
        if($asc>=-18526 && $asc<=-18240) return 'f';  
        if($asc>=-18239 && $asc<=-17923) return 'g';  
        if($asc>=-17922 && $asc<=-17418) return 'h';  
        if($asc>=-17417 && $asc<=-16475) return 'j';  
        if($asc>=-16474 && $asc<=-16213) return 'k';  
        if($asc>=-16212 && $asc<=-15641) return 'l';  
        if($asc>=-15640 && $asc<=-15166) return 'm';  
        if($asc>=-15165 && $asc<=-14923) return 'n';  
        if($asc>=-14922 && $asc<=-14915) return 'o';  
        if($asc>=-14914 && $asc<=-14631) return 'p';  
        if($asc>=-14630 && $asc<=-14150) return 'q';  
        if($asc>=-14149 && $asc<=-14091) return 'r';  
        if($asc>=-14090 && $asc<=-13319) return 's';  
        if($asc>=-13318 && $asc<=-12839) return 't';  
        if($asc>=-12838 && $asc<=-12557) return 'w';  
        if($asc>=-12556 && $asc<=-11848) return 'x';  
        if($asc>=-11847 && $asc<=-11056) return 'y';  
        if($asc>=-11055 && $asc<=-10247) return 'z';  
        return '~';  
    }

    /*根据pid查询子类id*/
    protected function getChildrenIds ($sort_id=''){
        $d=M('category');
        $result = $d->where('pid='.intval($sort_id))->field('id')->select();
        if ($result){
           foreach ($result as $key=>$val){
               $ids.= ','.$val['id'];
               $ids.= $this->getChildrenIds ($val['id']);
           }
       }
       return $ids;
    }


    public function imgshui(){
        $image = new \Think\Image(); 
        $image->open('./public/home/images/aimbanner.jpg')->water('./public/home/images/qnj/52njllogo.png',1)->save("./public/home/images/aimbanner.jpg");         
    }

}
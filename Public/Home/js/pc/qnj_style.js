$(function(){
	$('.qnj_nav_title').find('li:last').find('a').css('color','red');
    var falg=true;
	$('.qgmouseover').mouseover(function(){
    		$(this).css('cursor','pointer');
	});
    $('.qgmouseover').click(function(){
            if(falg){
                $('.qnj_quanguo').css('display','block');  
                falg=false;
            }else{
                $('.qnj_quanguo').css('display','none'); 
                falg=true; 
            }
    });
    $(document).click(function (e) {
     var e = e || window.event; //浏览器兼容性   
            var elem = e.target || e.srcElement;  
            while (elem) { //循环判断至跟节点，防止点击的是div子元素   
                if (elem.id && elem.id == 'qnj_quanguo') {  
                    return;  
                }  
                elem = elem.parentNode;  
            } 
    $('.qnj_quanguo').css('display','none');  
    falg=true;
    });


    $('.search1').mouseover(function(){
      $('.qnj_pinyin').css('display','block');
    }).mouseout(function(){
      $('.qnj_pinyin').css('display','none');
    });

    $('.qnj_zimu').find('li').click(function(){
      $('.qnj_zimu').find('li').css('background','#ff5d27');
      $(this).css('background','#f38d2b');
      var i=$(this).index();
      $('.blaze').css('display','none');
      $('.blaze:eq('+i+')').css('display','block');
    });

    $('.search2').mouseover(function(){
      $('.qnj_zhoubian').css('display','block');
    }).mouseout(function(){
      $('.qnj_zhoubian').css('display','none');
    });

    $('.njysearch1').click(function(){
        var key1=$('#key1').val();
        $(this).attr('href','/Article/search3/key/'+key1);
    });    
    $('#key1').focus(function(){
        $(this).val('');
    });


	$('.news53:eq(0)').remove();
	$('.news53i:eq(0)').remove();
	function myjs(){
		var mytime=null;
		mytime=setInterval(function(){
			var rgb1=parseInt(250*Math.random());
			var rgb2=parseInt(250*Math.random());
			var rgb3=parseInt(250*Math.random());
			$('#floor0').css('color','rgb('+rgb1+','+rgb2+','+rgb3+')');
			$('.dayu').css('color','rgb('+rgb1+','+rgb2+','+rgb3+')');
		},1000);
	}
	myjs();
	function myjs1(){
		var mytime=null;
		mytime=setInterval(function(){
			var rgb1=parseInt(250*Math.random());
			var rgb2=parseInt(250*Math.random());
			var rgb3=parseInt(250*Math.random());
			$('#floor1').css('color','rgb('+rgb1+','+rgb2+','+rgb3+')');
			$('.dayu1').css('color','rgb('+rgb1+','+rgb2+','+rgb3+')');
		},1000);
	}
	myjs1();  
	function myjs2(){
		var mytime=null;
		mytime=setInterval(function(){
			var rgb1=parseInt(250*Math.random());
			var rgb2=parseInt(250*Math.random());
			var rgb3=parseInt(250*Math.random());
			$('#floor2').css('color','rgb('+rgb1+','+rgb2+','+rgb3+')');
			$('.dayu2').css('color','rgb('+rgb1+','+rgb2+','+rgb3+')');
		},1000);
	}
	myjs2();  



});


    setInterval(function() {clock();}, 1000);
    function clock(){
      var time = new Date();
      var hours = time.getHours();
      var minutes = time.getMinutes();
      var seconds = time.getSeconds();
      if ($('.h').text() != ((hours < 10 ? "0" : "") + hours)){
        $('.h').text((hours < 10 ? "0" : "") + hours);
      }
      if ($('.m').text() != ((minutes < 10 ? "0" : "") + minutes)) {
        $('.m').text((minutes < 10 ? "0" : "") + minutes);
      }
      if ($('.s').text() != ((seconds < 10 ? "0" : "") + seconds)) {
        $('.s').text((seconds < 10 ? "0" : "") + seconds);
      }
    }
    $(document).load(function(){
      clock();
    });

	$('.qnj_beijing').click(function () {
		$('.float_title').attr('class','float_title');
		$('.float_title:eq(0)').attr('class','float_title active');
		$(document).scrollTop(450);
	});
	$('.qnj_tianjin').click(function () {
		$('.float_title').attr('class','float_title');
		$('.float_title:eq(1)').attr('class','float_title active');
		$(document).scrollTop(1090);
	});
	$('.qnj_hebei').click(function () {
		$('.float_title').attr('class','float_title');
		$('.float_title:eq(2)').attr('class','float_title active');	
		$(document).scrollTop(1650);
	});
	$('.qnj_gonglv').click(function () {
		$('.float_title').attr('class','float_title');
		$('.float_title:eq(3)').attr('class','float_title active');	
		$(document).scrollTop(2200);
	});



    	$(function() {
		$(window).scroll(function() {
			var gao = $(document).scrollTop();
			if (gao > 450) {
				$('.qnj_class_float').show();
			}
			if (gao > 450 && gao < 630) {
				$('.float_title').attr('class','float_title');
				$('.float_title:eq(0)').attr('class','float_title active');
			} else if (gao > 1020 && gao < 1180) {
				$('.float_title').attr('class','float_title');
				$('.float_title:eq(1)').attr('class','float_title active');
			} else if(gao > 1580 && gao < 1700){
				$('.float_title').attr('class','float_title');
				$('.float_title:eq(2)').attr('class','float_title active');            
			} else if(gao > 2130 && gao < 2780){
				$('.float_title').attr('class','float_title');
				$('.float_title:eq(3)').attr('class','float_title active');            
			}
			if (gao > 2780 || gao < 450) {
				$('.qnj_class_float').hide();
			}
		});
	});


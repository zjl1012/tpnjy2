 var flag1=false;
    var flag2=false;
    var flag3=false;

    function yzname(){
      var username=$.trim($('#username').val());
      $.ajax({
        url:'/Login/doreg0',
        type:'post',
        data:{'name':username},
        async:true,
        success:function(mes){
          if(mes=='ok'){
            $('.tjpic:eq(0)').find('img').css('display','block');
            $('#username').css({'color':'#000','font-size':'20px'});
            flag1=true;
            return true;
          }else if(mes=='no1'){
            $('#username').val('用户名长度为6-12位且为数字字母').css({'color':'#f20000','font-size':'16px'});
            $('.tjpic:eq(0)').find('img').css('display','none');
            return false;
          }else{
            $('#username').val('用户名已存在').css({'color':'#f20000','font-size':'16px'});
            $('.tjpic:eq(0)').find('img').css('display','none');
            return false;            
          }
        }
      });      
    }

    function yzpass(){
      var password0=$.trim($('#password').val());
      if(password0==''){
        alert('请输入密码');
        $('.tjpic:eq(2)').find('img').css('display','none');
        return false;
      }else{
        $('.tjpic:eq(2)').find('img').css('display','block');
        return true;
      }      
    }
    function yzrepass(){
      var password=$('#password2').val();
      var password2=$('#password').val();
      if(password2==''){
        alert('请重复输入密码');
        $('.tjpic:eq(3)').find('img').css('display','none');
        return false;
      }
      if(password !== password2){
        alert('两次密码不一致');
        $('.tjpic:eq(3)').find('img').css('display','none');
        return false;
      }else{
        flag2=true;
        $('.tjpic:eq(3)').find('img').css('display','block');
        return true;
      }
    }

    function yzphone(){
      var phone=$('#phone').val();
      $.ajax({
        url:'/Login/phone',
        type:'post',
        data:{'phonenumber':phone},
        async:true,
        success:function(mes){
          if(mes=='ok'){
            flag3=true;
            $('.tjpic:eq(1)').find('img').css('display','block');
            $('#phone').css({'color':'#000','font-size':'20px'});
            return true;
          }else if(mes=='no1'){
            $('#phone').val('该手机号格式不正确').css({'color':'#f20000','font-size':'16px'});
            $('.tjpic:eq(1)').find('img').css('display','none');
            return false;
          }else{
            $('#phone').val('该手机号已被使用').css({'color':'#f20000','font-size':'16px'});
            $('.tjpic:eq(1)').find('img').css('display','none');
            return false;            
          }
        }
      });
    }

    $('#username').blur(function(){yzname();});

    $('#password').blur(function(){ yzpass();});

    $('#password2').blur(function(){yzrepass();});

    $('#phone').blur(function(){yzphone();});

$("#dj").click(function(){
  if(flag1&&flag2&&flag3){
  }else{
    alert('提交的信息不正确,请认真核对');  
    return false;
  }
    var phonenum=$('#phone').val();
    var name=$('#username').val();
    var code=$(this);
              var validCode=true;
          var time=120;
    $.ajax({
      url:'/Login/duanxin',
      type:'post',
      data:{'phonenumber':phonenum,'name':name},
      success:function(mes){
        if(mes=='no'){
          alert('系统繁忙');return false;
        }else{

                      if(validCode){
              validCode=false;
              var t=setInterval(function(){
                  time--;
                  code.html(time+"秒");
                  if(time==0){
                    clearInterval(t);
                    code.html("重新获取");
                    validCode=true;
                  }
                },1000);
            } 
        }
      }
    });
});


$('#xieyi').click(function(){
  if($(this).attr('info')==0){
    $(this).attr('info','1');
  }else{
    $(this).attr('info','0');
  }
});

$('#submit').click(function(){
  if($('#xieyi').attr('info')==0){
    alert('请阅读并同意用户协议');return false;
  }

  var p11=$('#password').val();
  var p22=$('#password2').val();
  if(flag1&&flag2&&flag3&&p11==p22){

  }else{
    alert('提交的信息不正确,请认真核对');  
    return false;
  }
});
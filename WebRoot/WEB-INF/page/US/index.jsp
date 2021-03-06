<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base id="base_id" href="<%=basePath%>">    
    <title>XYG AUTOMOBILE GLASS ONLINE PLATFORM</title>
	<meta http-equiv="content-type" content="text/html;charset=gb2312">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="plugin/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugin/css/font-awesome.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="plugin/bootstrap/css/AdminLTE.css">
    <!-- AdminLTE Skins -->
    <link rel="stylesheet" href="plugin/bootstrap/css/skins/_all-skins.min.css"> 
    <!-- 私有样式表 -->
    <link rel="stylesheet" href="plugin/css/index/index.css"> 
    <!-- Websocket -->
    <script src="plugin/js/webSocket.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .sidebar-toggle:hover{
            background-color:#006633 !important;
        }
        .dark-green{
            background-color:#006633 !important;
        }
        .tab_button_left{
          	position:absolute;
          	top:0;
          	left:0;
          	height:36px;
          	border:0;
          	border-right:1px solid gray;
          	width:60px;
          	color:black;
          	display:block;
          	text-align:center;
          	line-height:36px
        }
        .tab_button_right{
          	position:absolute;
          	top:0;
          	right:120px;
          	height:36px;
          	border:0;
          	border-left:1px solid gray;
          	width:60px;
          	color:black;
          	display:block;
          	text-align:center;
          	line-height:36px
        }
        .tab_button_fullscreen{
          	position:absolute;
          	top:0;
          	right:0;
          	height:36px;
          	border:0;
          	border-left:1px solid gray;
          	width:60px;
          	color:black;
          	display:block;
          	text-align:center;
          	line-height:36px
      	}
      	.tab_selection{
      	    position:absolute;
          	top:0;
          	right:60px;
          	width:60px;
      	}
      	.tab_button_selection{
          	height:36px;
          	border:0;
          	border-left:1px solid gray;
          	width:60px;
          	background-color:white;
          	color:black;
          	display:block;
          	text-align:center;
          	line-height:36px;
      	}
      	.content_tab_area{
          	margin-left:60px;
          	width:10000px;
          	height:40px;
          	overflow:hidden;
      	}
      	.content_tab_frame{
          	float:left;
          	border:0;
          	margin:0;
          	padding:0;
          	height:36px;
          	width:auto;
          	overflow:hidden;
          	white-space:nowrap;
          	text-overflow:ellipsis;
      	}
      	.content_tab_frame>.content_tab{
          	float:left;
          	display:block;
          	height:36px;
          	border:0;
          	/*border-right:1px solid gray;*/
          	padding:0 10px;
          	min-width:60px;
          	width:auto;
          	color:black;
          	display:block;
          	text-align:center;
          	line-height:36px;
          	background-color:white;
          	color:black;  
      	}
      	
      	.content_tab_frame>.active{
          	background-color:black;
          	color:white;  
      	}
      	.content_iframe{
      	  	width:100%;
      	  	padding:0;
      	 	border:0;
      	}
    </style>
  </head>
  
  <body class="hold-transition skin-green sidebar-mini sidebar-collapse" >  
    <div class="wrapper">    
       <header class="main-header">
        <!-- Logo -->
        <a href="#" data-iframehref="home.do" class="logo dark-green">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>X</b>YG</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Xinyi</b>GLASS</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav"> 
              <li class="dropdown messages-menu" id="mailbox">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o"></i>
                  <span data-type="tips" class="label label-danger"></span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have<span data-type="inside"></span>unread message</li>
                  <li>
                    <!-- 新邮件消息区域 start -->
                    <ul id="unread_menu" class="menu"></ul>  
                    <!-- 新邮件消息区域 end -->          
                  <li class="footer pointer"><a href="#" data-iframehref="mail/RecMail.do" data-title="收件箱">SHOW ALL</a></li>
                </ul>
              </li>          
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <input type="hidden" id="USER_ID" value="${USER_ID}"/> 
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img id="user-img-sm" src="/image/user/${IMG}" class="user-image" alt="User Image">
                  <span class="hidden-xs">${DESC}</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header green">
                    <img id="user-img-md" src="/image/user/${IMG}" class="img-circle" alt="User Image">
                    <p>
                      ${DESC} - ${RESP}
                      <small>Member since Nov. 2012</small>
                    </p>
                  </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat" data-reveal-id="modifyPWD" data-bg="pwd-modal-bg" data-dismissmodalclass="close-pwd-frame">Password</a>
                    </div>
                    <div class="pull-left">
                      <a href="#" id="changeIMG" class="btn btn-default btn-flat" style="margin-left:6px" data-reveal-id="headimg" data-bg="pwd-modal-bg">Image</a>
                    </div>
                    <div class="pull-right">
                      <form id="logoutFrom" name="logoutFrom" method="post" action="logout.do">
                        <button id="signout" type="submit" class="btn btn-default btn-flat">Logout</button>
                      </form>
                    </div>
                  </li>
                </ul>
              </li>          
            </ul>
          </div>
        </nav>
      </header>
      
      <jsp:include page="Left-SideBar.jsp"/>
      
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
    	<section class="content-header" style="position:relative;height:40px;border-bottom:4px solid black;border-top:0;padding:0;width:auto;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
          <a class="tab_button_left pointer" style="background-color:white;color:black" ><i class="fa fa-backward"></i></a>
          <a class="tab_button_fullscreen pointer" fullscreen="false" style="background-color:white;color:black" ><i class="fa fa-toggle-off"></i></a>
          <a class="tab_button_fullscreen pointer" fullscreen="true" style="background-color:white;color:#00a65a;display:none" ><i class="fa fa-toggle-on"></i></a>

          <div class="dropdown tab_selection" >
          	<button type="button" class="tab_button_selection dropdown-toggle" data-toggle="dropdown">OP&nbsp;<i class="fa fa-caret-down"></i></button>
            
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="position:fixed;top:85px;left:auto;right:0">
              <li role="presentation">
                <a role="menuitem" data-tabtype="refreshTab" tabindex="-1" href="#">Refresh Current Tab</a>
              </li>
              <li role="presentation">
                 <a role="menuitem" data-tabtype="closeOthers" tabindex="-1" href="#">Close Other Tabs</a>
              </li>
              <li role="presentation">
                <a role="menuitem" data-tabtype="closeAll" tabindex="-1" href="#">Close All Tabs</a>
              </li>
            </ul>
            
          </div>

          <a class="tab_button_right pointer" style="background-color:white;color:black" ><i class="fa fa-forward"></i></a>
          <nav class="content_tab_area">
            <div class="content_tab_frame" style="margin-left:0px">
              <a class="content_tab pointer active" data-tabfunc="0" >Home Page</a>
            </div>
          </nav>
        </section>

        <!-- Main content -->
        <section id="iframe_area" class="content" style="padding:0">
            <!-- Info boxes -->
            <iframe class="content_iframe" src="home.do" data-tabfunc="0" frameborder="0" scrolling="yes" framespacing="0" ></iframe>
    	</section>
        
        <!-- 用户信息存放区域 start -->
     	<input type="hidden" id="USER_ID" value="${USER_ID}"/>  
     	<input type="hidden" id="USER_NAME" value="${USER_NAME}"/>
        <button id="mailrefresh" data-mailtype="unread" data-counturl="mail/countUnReadMail.do" data-mailurl="mail/findUnReadMail.do" data-pageframe="mailbox" style="visibility:hidden;position:fixed"></button>
     	<!-- 用户信息存放区域 end -->
     	
     	
      <!-- 密码修改弹出框 start -->
      <div class="pwd-modal-bg"></div>
      <div id="modifyPWD" class="pwd_frame">
        <div class='title'>      
          <span><i class="fa fa-user fa-1x" aria-hidden="true"></i>&nbsp;Modify Password</span>
        </div>
        <a class="close-pwd-frame" data-type="close">&#215;</a>
        <div class='line'></div>
          <div class='content'>
            <form id='updateData'>
              <label for='O_PASSWORD' class='left'>Old PWD</label>
              <input type='password' id='O_PASSWORD' name='O_PASSWORD' data-update="db" class='left password'/>
              <i class="fa fa-eye-slash pointer left" data-pwd="show" data-frame="O_PASSWORD"></i>
              <i class="fa fa-eye pointer left hide" data-pwd="hide" data-frame="O_PASSWORD"></i>
              <label for='N_PASSWORD' class='left'>New PWD</label>
              <input type='password' id='N_PASSWORD' name='N_PASSWORD' data-update="db" class='left password'/>
              <i class="fa fa-eye-slash pointer left" data-pwd="show" data-frame="N_PASSWORD"></i>
              <i class="fa fa-eye pointer left hide" data-pwd="hide" data-frame="N_PASSWORD"></i>
            </form>
          </div>
          <div class='foot'>       
            <button id="confirm" class="right update_confirm pointer">Modify</button>
          </div>   
        </div>
        <!-- 密码修改弹出框 end-->
      </div><!-- /.content-wrapper -->   
      
      <!-- 用户头像区域 start -->
      <jsp:include page="public/headImg.jsp">
        <jsp:param name="headImgType" value="personal" />
      </jsp:include>
      <!-- 用户头像区域 end -->  
    </div>
    
    
    
    <!-- jQuery 2.1.4 -->
    <script src="plugin/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="plugin/bootstrap/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="plugin/bootstrap/js/app.min.js"></script>
    <script src="plugin/js/jQuery.automenu.js"></script> 
    
    <!-- <script type="text/javascript" src="plugin/js/jQuery.mail.js"></script>   -->
    <script type="text/javascript" src="plugin/js/jQuery.reveal.js"></script> 
    <script type="text/javascript" src="plugin/js/cropbox.js"></script>
    <script type="text/javascript" src="plugin/layer/layer.js"></script>
    <script type="text/javascript" src="plugin/js/data.validate.js"></script>
    <script type="text/javascript">
        $('i[data-pwd]').on('click',function(){
    		if($(this).data('pwd')=='show'){
    			$('.fa-eye[data-frame="'+$(this).data('frame')+'"]').css('cssText', 'display:block!important');
    			$(this).css('display','none');
    			$('#'+$(this).data('frame')).attr('type','text');
    		}else if($(this).data('pwd')=='hide'){
    			$('.fa-eye-slash[data-frame="'+$(this).data('frame')+'"]').css('cssText', 'display:block!important');
    			$(this).css('display','none');
    			$('#'+$(this).data('frame')).attr('type','password');
    		}
     	});
     	
     	$('a[data-reveal-id="modifyPWD"]').on('click',function(){
     	    $('#N_PASSWORD').val('');
     	    $('#O_PASSWORD').val('');
     	});
     	
     	$('#confirm').on('click',function(){
     	    newPwd=$('#N_PASSWORD').val();
     	    oldPwd=$('#O_PASSWORD').val();
     	    if(oldPwd==null||oldPwd==''){
				layer.alert('原密码不能为空！',{title:'警告',offset:[150]});
				return;
     	    }else if(newPwd==null||newPwd==''){
     	        layer.alert('新密码不能为空！',{title:'警告',offset:[150]});
     	        return;
     	    }
     	    RegExpValidate('^[a-zA-Z]\\w{5,14}$','N_PASSWORD','regExpError("密码格式错误，必须是由字母开头的6-15位字符");');
     	    if(newPwd==oldPwd){
     	      alert('新密码不能与原密码相同,请重新输入!');
     	      return;
     	    }  
     	    param = $('#updateData').serialize();
     	    $.ajax({
				type:'post', 
				data:param,
				url:'user/updatePassword.do',
				dataType:'json',
				success: function (data) {
				    if(data.retcode=="0"){
				    	alert("密码修改成功!");
				    	$('#modifyPWD a[data-type="close"]').click();
				    }else{
				    	alert(data.errbuf);
				    }						  
				},
				error: function () {
				    alert("获取数据失败");
				}	
            });              
     	});
     	
        $('#changeIMG').on('click',function(){
    		$('.cropped_old img').removeAttr('src');
    		$('.imageBox').css('background-image','');
    		$('.cropped_new img').attr('src','/image/user/system_blank.png');
    		imgurl=$('#user-img-sm').attr('src');
    		$('#headimg_uid').val($('#USER_ID').val());
    		$('#headimg_uname').val($('#USER_NAME').val());
    		$('.cropped_old img').attr('src',imgurl+'?temp=' + Math.random()); 
    	});    		 
    
        jQuery.json={
            getUnreadMail:function(data){
                $('#unread_menu').html('');
            	record=data.rows.length;
				if(record>3){
				    for(i=0;i<3;i++){
				        newmail='<li><a class="pointer" data-iframehref="mail/RecMail.do?autoQuery=Y&sendId='+data.rows[i].SEND_ID+'" data-title="收件箱"><div class="pull-left"><img src="/image/login/mail.png" class="img-circle" alt="User Image"></div><h4>'
                		+(data.rows[i].MAIL_TITLE).substring(0, 15)+'...<small><i class="fa fa-clock-o"></i>'
                		+data.rows[i].SEND_DATE+'</small></h4><p>From:<span>'
                		+data.rows[i].SEND_USER_DESC+'</span></p></a></li>';
				        $('#unread_menu').append(newmail);    	
				    }	
				}else{
				    for(i=0;i<record;i++){
				        newmail='<li><a class="pointer" data-iframehref="mail/RecMail.do?autoQuery=Y&sendId='+data.rows[i].SEND_ID+'" data-title="收件箱"><div class="pull-left"><img src="/image/login/mail.png" class="img-circle" alt="User Image"></div><h4>'
                		+(data.rows[i].MAIL_TITLE).substring(0, 15)+'...</h4><p>From:<span>'
                		+data.rows[i].SEND_USER_DESC+'</span></p><p><small><i class="fa fa-clock-o"></i>'
                		+data.rows[i].SEND_DATE+'</small></p></a></li>';
				        $('#unread_menu').append(newmail); 		
				    }
				}
            	
            }
        }
        
        $('#mailrefresh').click();

	</script>
  </body>
</html>

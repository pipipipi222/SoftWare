<%@ page language="java" pageEncoding="UTF-8" %>
<% 
String path=request.getContextPath(); 
String basePath=request.getScheme()
    + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    
    <head>
        <title>
            瑾晨书店
        </title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"
        />
        <link href="css/slider.css" rel="stylesheet" type="text/css" media="all"
        />
        <script type="text/javascript" src="js/jquery-1.7.2.min.js">
        </script>
        <script type="text/javascript" src="js/move-top.js">
        </script>
        <script type="text/javascript" src="js/easing.js">
        </script>
        <script type="text/javascript" src="js/startstop-slider.js">
        </script>
        <script type="text/javascript">
        
        	$(function()
			{ 
				// 所有提示文字隐藏
				$("#usernameError").hide();
			});        

	// 验证用户名和密码
	function loginCheck()
	{
		var resultCode = "";
	
		// 先去校验用户名和密码
		$.ajax(
		{
			url:"<%=basePath%>/checkLoginInfo",
			username: $("#username").val(),
			data:{username:$("#username").val(),password: $("#password").val()},
			type:'POST',
			async: false,
			success: (function(data)
			{
				// 获取校验结果
				resultCode = data;
			}),
			error:(function(xhr)
			{
				alert('请求有问题\n'+xhr.responseText);
			})
		});
		
	  // 如果正确，直接放通	
      if(resultCode == "1")
	  {
	  	$("#usernameError").hide();
	  }
	  else
	  {
	    // 如果不正确，返回false
	  	$("#usernameError").show();
	  	return false;
	  }
	};
        </script>
    </head>
    
<body>
    <input type="hidden" id="menuColor" value="index" />
    <div class="wrap">
        <div class="header">
            <jsp:include page="topCommon.jsp"></jsp:include>
        </div>
        <div class="main">
            <div class="content">
                <div class="section group">
                    <div class="col span_2_of_3">
                        <div class="contact-form">
                            <h2>
                                登陆
                            </h2>
                            <form method="post" action="<%=basePath%>/login" onsubmit="return loginCheck();">
                                <div>
                                    <span>
                                        <label>
                                            用户名:
                                        </label>
                                        <font color="red">
                                            <label id="usernameError">
                                                用户名密码不匹配
                                            </label>
                                        </font>
                                    </span>
                                    <span>
                                        <input id="username" name="username" type="text" class="textbox">
                                    </span>
                                </div>
                                <div>
                                    <span>
                                        <label>
                                            密码：
                                        </label>
                                    </span>
                                    <span>
                                        <input id="password" name="password" type="password" class="textbox">
                                    </span>
                                </div>
                                <div>
                                    <span>
                                    </span>
                                </div>
                                <div>
                                    <span>
                                        <input type="reset" value="重置" class="myButton">
                                        <input type="submit" value="登陆" class="myButton">
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col span_1_of_3">
                        <div class="contact_info">
                            <h3>
                                如何找到我们
                            </h3>
                            <div class="map">
                                <iframe width="100%" height="175" frameborder="0" scrolling="no" marginheight="0"
                                marginwidth="0" src="https://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265&amp;output=embed">
                                </iframe>
                                <br>
                                <small>
                                    <a href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265"
                                    style="color:#666;text-align:left;font-size:12px">
                                        View Larger Map
                                    </a>
                                </small>
                            </div>
                        </div>
                                                <div class="company_address">
                            <h3>
                                公司信息 :
                            </h3>
                            <p>
                                南京,
                            </p>
                            <p>
                                夫子庙,
                            </p>
                            <p>
                               江苏
                            </p>
                            <p>
                                电话:(025) 222 666 444
                            </p>
                            <p>
                                传真: (000) 000 00 00 0
                            </p>
                            <p>
                                Email:
                                <span>
                                    800@126.com
                                </span>
                            </p>
                            <p>
                                友情链接:
                                <span>
                                    Facebook
                                </span>
                                ,
                                <span>
                                    Twitter
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="bottomCommon.jsp"></jsp:include>
</body>

</html>
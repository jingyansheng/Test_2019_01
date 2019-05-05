<!doctype html>
<html lang="zh_CN">
  <head>
    <meta charset="utf-8">
    <title>登录 - 中科软测试工程</title>
    <link rel="stylesheet" href="/bootstrap-4.0.0-beta/css/bootstrap.min.css" />
    <style type="text/css">
      /* body */
      body {
        font-size: 14px;
        background-color: #f4f4f4;
        text-align: center;
      }

      /* title */
      h2.title {
        font-size: 2rem;
        text-align: center;
      }
      
      /* form */
      .login-container {
        background-color: #ffffff;
        display: inline-block;
        width: 38rem;
        padding: 4rem 4rem 2rem 4rem;
        text-align: left;
      }
      .login-container .btn-login {
        width: 100%;
      }
    </style>
    <script type="text/javascript" src="/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="/bootstrap-4.0.0-beta/js/bootstrap.min.js"></script>
    <script type="text/javascript">
      function login(){
        var loginname = document.getElementById("name").value;
        var password = document.getElementById("password").value;
        if($.trim(loginname) != '' && $.trim(password) != ''){
          document.getElementById("loginForm").submit();
        } else {
          alert("UserName and password can not be empty.");
        }
      }

      $(function () {
        var tip = $("#tipInfo").val();
        if(tip.trim().length>0){
          $("#tip").show();
        }
      })
    </script>
  </head>
  <body>
    <h2 class="title">SinoSoft Feedback center</h2>
    <hr/>
    <div class="alert alert-warning alert-dismissible fade show" role="alert" style="display: none;" id="tip">
      <input id="tipInfo" value="${reason!}" type="hidden"/>
      <strong>${reason!}</strong>
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <div class="login-container">
      <form action="/login" method="post" id="loginForm">
        <div class="form-group">
          <label for="name">Username or email address</label>
          <input type="text" class="form-control" id="name" name="name" placeholder="Enter your email or user name">
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password">
        </div>
        <div class="form-group">
          <input type="button" class="btn btn-primary btn-login" value="Sign in" onclick="login(  )">
        </div>
        <div class="form-group">
          <a href="/register">Sign up</a>
        </div>
      </form>
    </div>
  </body>
</html>
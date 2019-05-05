<!doctype html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>注册 - 中科软测试工程</title>
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
        $(function () {
            var tip = $("#tip").val();
            if(tip.trim() != ""){
                alert(tip);
            }
        })
    </script>
</head>
<body>
<h2 class="title">Join SinoSoft</h2>
<hr/>
<input id="tip" type="hidden" value="${reason}"/>
<div class="login-container">
    <form action="/creAccount" method="post" id="creAccountForm">
        <div class="form-group">
            <label for="name">Username or email address</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter your email or user name">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password">
        </div>
        <div class="form-group">
            <label for="rePassword">Password</label>
            <input type="password" class="form-control" id="rePassword" name="rePassword" placeholder="Confirm your password">
        </div>
        <div class="form-group">
            <input id="creAccount" name="creAccount" class="btn btn-primary btn-login" type="button" value="Creating account" >
        </div>
    </form>
</div>
<script type="text/javascript">
    $("#creAccount").click(function () {
        var name = $("#name").val();
        var password = $("#password").val();
        var rePassword = $("#rePassword").val();
        if($.trim(name) != '' && $.trim(password) != '' && $.trim(rePassword) != ''){
            if(password == rePassword){
                verifyRepeat(name);
            }else{
                alert("Inconsistent password");
            }
        }else{
            alert("Username or password cannot be empty");
        }

    })
    function verifyRepeat(name) {
        $.ajax({
            type:"post",
            url:"/verifyRepeat",
            async:false,
            data:{"name":name},
            dataType:"text",
            success:function (data) {
                if(data == 'true'){
                    alert("Username is already taken");
                    return;
                }else{
                    $("#creAccountForm").submit();
                    return;
                }
            }
        })
    }

</script>
</body>
</html>

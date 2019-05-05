<!doctype html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>index - exame questionnaire</title>
    <link rel="stylesheet" href="/bootstrap-4.0.0-beta/css/bootstrap.min.css" />
    <style>
        /* body */
        body {
            font-size: 14px;
            background-color: #f4f4f4;
        }

        /* title */
        h2.title {
            font-size: 2rem;
            text-align: center;
        }

        .form-horizontal{
            width: 80%;
            padding-left: 20%;
        }
    </style>
    <script type="text/javascript" src="/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="/bootstrap-4.0.0-beta/js/bootstrap.min.js"></script>
    <script type="text/javascript" src='/tinymce/js/tinymce/tinymce.min.js'></script>
    <script type="text/javascript">
        $(function () {
            var quesUserid = $("#userid").val();
            var nowUserid = $("#nowUserid").val();
            var readOnly = 1;
            if(quesUserid == nowUserid){
                var readOnly =0;
            }else{
                $("#subButton").hide();
                $("#title").attr("disabled",true);
            }
            tinyMCE.init({
                selector:'#description',//页面元素选择器
                toolbar: true, //隐藏工具栏
                menubar: false, //隐藏菜单栏
                elementpath: true, //隐藏底部路径
                plugins:'lists',
                toolbar: 'formatselect | fontsizeselect | bold italic | forecolor backcolor | alignleft aligncenter alignright | numlist bullist',
                readonly : readOnly
            })
        })
        function submitQues() {
            $("#saveQues").submit();
        }
        function backList() {
            location = "/ques/quesList";
        }
    </script>
</head>
<body>
<h2 class="title">SinoSoft Feedback center</h2>
<hr/>
<form class="form-horizontal" id="saveQues" action="/ques/saveQues" method="post" >
    <input type="hidden" id="id" name="id" value="${ques.id!}"/>
    <input type="hidden" id="author" name="author" value="${ques.author!}"/>
    <input type="hidden" id="date" name="date" value="${ques.date!}"/>
    <input type="hidden" id="userid" name="userid" value="${ques.userid!}"/>
    <input type="hidden" id="nowUserid" name="nowUserid" value="${nowUserid!}"/>
    <div class="form-group">
        <div class="col-sm-10">
            <input type="text" class="form-control" id="title" name="title" placeholder="Please enter a title" value="${ques.title!}">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-10">
            <div id="description">${ques.description!}</div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button id="subButton" type="button" class="btn btn-primary btn-sm active" onclick="submitQues();">Submit</button>
            <button id="backButton" type="button" class="btn btn-default btn-sm active" onclick="backList();">Back</button>
        </div>
    </div>
</form>
</body>
</html>

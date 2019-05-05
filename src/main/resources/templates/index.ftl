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
        .mainBody{
            width: 80%;
            margin: 0 auto;
        }
        .topButton{
            text-align:right;
            margin-bottom: 10px;
            width: 100%;
        }
        #myTab{
            width: 100%;
        }
        .nav-link{
            font-size: 24px;
        }
    </style>
    <script type="text/javascript" src="/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="/bootstrap-4.0.0-beta/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function cre(){
            location = "/ques/creQues";
        }
        function openQues(id) {
            location = "/ques/editQues?id="+id;
        }
        function signout() {
            location = "/logout";
        }
    </script>
</head>
<body>
<h2 class="title">SinoSoft Feedback center</h2>
<div class="mainBody">
    <div class="topButton">
        <input id="creQues" type="button" class="btn btn-primary" onclick="cre();" value="New"/>
        <input id="signout" type="button" class="btn btn-primary btn-danger" onclick="signout();" value="Signout"/>
    </div>

    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#tab1" role="tab" aria-controls="home" aria-selected="true">啥也没有</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#tab2" role="tab" aria-controls="profile" aria-selected="false">我要反馈</a>
        </li>
        <#if user.name ?? && user.name=='admin'>
        <li class="nav-item">
            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#tab3" role="tab" aria-controls="contact" aria-selected="false">老子是管理员</a>
        </li>
        </#if>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="home-tab">哈哈哈哈  这里什么都没有</div>
        <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="profile-tab">
            <div class="listQues">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <td>title</td>
                        <td>author</td>
                        <td>date</td>
                    </tr>
                    </thead>
                    <tbody>
                    <#list quesList! as ques>
                        <tr>
                            <td width="70%" onclick="openQues('${ques.id}');">${ques.title!}</td>
                            <td width="10%" onclick="openQues('${ques.id}');">${ques.author!}</td>
                            <td width="10%" onclick="openQues('${ques.id}');">${ques.date!}</td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="contact-tab">哈哈 老子是管理员</div>
    </div>
</div>
</body>
</html>

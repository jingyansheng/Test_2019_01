<!doctype html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
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
        .listQues{
            padding-top: 10px;
            width: 80%;
            margin:0 auto;
            position:relative;
        }
        #creQues{
            margin-bottom: 10px;
        }
        #signout{
            float: right;
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
<hr/>

<div class="listQues">
    <input id="creQues" type="button" class="btn btn-primary" onclick="cre();" value="New"/>
    <input id="signout" type="button" class="btn btn-primary btn-danger" onclick="signout();" value="Signout"/>
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
    </div>
    </table>
</body>
</html>

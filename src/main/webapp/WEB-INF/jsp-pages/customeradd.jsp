<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2020/12/14
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书管理系统</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <link href="${APP_PATH }/static/css/dui.css" rel="stylesheet">
    <link href="${APP_PATH }/static/css/main.css" rel="stylesheet">
    <style type="text/css">
        .book-edit.readonly .img:after,.book-edit.readonly .img#picker,.book-edit.readonly .btns-item {display: none;}
        .book-edit button.success{width: 25%;border-radius: 5px;margin-left: 25%;}
    </style>
</head>
<body>
<div class="index container">
    <div class="header">
        <img class="logo" src="${APP_PATH }/static/images/logo.png">
        <div class="title">
            <h3>百疆书社 -- 图书馆管理</h3>
            <h5>BAIJIANG BOOKSTORE LIBRARY MANAGE</h5>
        </div>
        <div class="toolbar">
            <a id="account">${user.name}</a>
            <a id="pwdedit" onclick="pwdedit()">修改密码</a>
            <a id="signout" onclick="signout()">注销</a>
            <img class="usericon" src="${APP_PATH }/static/images/icons/usericon.png">
        </div>
    </div>
    <div class="main">
        <div class="toolbar">
            <div class="btns-wrap">
                <div class="btns-tool">
                    <a id="editbook" title="借阅管理" href="borrowList"></a>
                    <a id="addbook" title="添加图书" href="bookList"></a>
                    <a id="typemgr" title="类别管理" href="typeList"></a>
                    <a id="bookmgr" title="客户管理" href="customerList" class="cur"></a>
                    <a id="usermgr" title="用户管理" href="userList" ></a>
                </div>
            </div>
        </div>
        <div class="subpage">
            <div class="book-edit">
                <div class="title">添加客户</div>
                <div class="search-form">
                </div>
                <div class="form">

                    <form  method="post" id="myform"  action="customerSave">
                        <div class="form-item">
                            <label>用户名</label>
                            <input id="username" name="name">
                        </div>
                        <div class="form-item">
                            <label class="name-label">手机号码</label>
                            <input id="phone" name="phone" type="number">
                        </div>
                        <div class="form-item">
                            <label class="name-label">住址</label>
                            <input id="address" name="address">
                        </div>
                        <div class="form-item">
                            <label class="name-label">工作单位</label>
                            <input id="company" name="company">
                        </div>
                    </form>
                    <div class="form-item btns-item" style="text-align: left;margin-top: 2%;">
                        <button class="primary success" id="save" onclick="save()">保存修改</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function xmTanUploadImg(obj) {

        var file = obj.files[0];

        var reader = new FileReader();
        reader.onload = function (e) {
            var img = document.getElementById("xmTanImg");
            img.src = e.target.result;
        }
        reader.readAsDataURL(file)
    }
    function signout(){
        if(confirm("确定要注销吗？")){
            location.href = "userLoginOut";
        }
    }
    function save(){
        //获取表单的值
        var myform = document.getElementById("myform");
        myform.submit();
        alert("添加成功！");
    }
    function pwdedit() {
        window.location="pwEdit"
    }
</script>
</html>
<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2020/12/14
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <a id="addbook" title="添加图书" href="bookList" class="cur"></a>
                    <a id="typemgr" title="类别管理" href="typeList"></a>
                    <a id="bookmgr" title="客户管理" href="customerList"></a>
                    <a id="usermgr" title="用户管理" href="userList" ></a>
                </div>
            </div>
        </div>
        <div class="subpage">
            <div class="book-edit">
                <div class="title">添加书籍</div>
                <div class="search-form">
                </div>
                <div class="form">

                    <form  method="post" id="myform"  action="bookSave" enctype="multipart/form-data" >
                        <div class="form-item">
                            <label>书名: </label>
                            <input id="name" name="name">
                        </div>
                        <div class="form-item">
                            <label>英文名: </label>
                            <input id="ename" name="ename">
                        </div>
                        <div class="form-item">
                            <label>类别: </label>

                            <select id="typeid" name="typeid">
                                <c:forEach var="type" items="${types}">
                                <option value="${type.id}">${type.typename}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-item">
                            <label>作者: </label>
                            <input id="author" name="author">
                        </div>
                        <div class="form-item">
                            <label>出版社: </label>
                            <input id="publish" name="publisher">
                        </div>
                        <div class="form-item">
                            <label>出版日期: </label>
                            <input id="publishdate" name="pdate" type="date">
                        </div>
                        <div class="form-item">
                            <label>ISBN: </label>
                            <input id="isbn" name="isbn">
                        </div>
                        <div class="form-item">
                            <label>价格: </label>
                            <input id="price" name="price" type="number">
                        </div>
                        <div class="form-item">
                            <label>存放位置: </label>
                            <input id="location" name="address">
                        </div>
                        <div class="text-item">
                            <label>简介: </label>
                            <textarea id="introduction" name="brief"></textarea>
                        </div>
                        <div class="file-item">
                            <label>照片: </label>
                            <input id="pic" type="file" accept="image/*" onchange="xmTanUploadImg(this)" name="image">
                            <img style="width: 100px;height:100px;float: left;" id="xmTanImg" alt="请选择图片"/><br/>

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
        //实现上传的图片的预览功能
        var file = obj.files[0];

        var reader = new FileReader();
        reader.onload = function (e) {
            var img = document.getElementById("xmTanImg");
            //将获取的图片的路径赋值到img标签的src属性上来实现
            // result 属性将包含一个data:URL 格式的字符串（base64 编码）以表示所读取文件的内容。
            img.src = e.target.result;
        }
        reader.readAsDataURL(file)
    }
    function signout(){
        if(confirm("确定要注销吗？")){
            location.href = "userLoginOut";
        }
    }
    function pwdedit() {
        window.location="pwEdit"
    }
    function save(){
        //获取表单的值
        var myform = document.getElementById("myform");
        myform.submit();
        alert("添加成功！");
    }
</script>
</html>
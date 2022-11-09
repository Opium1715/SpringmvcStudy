<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2020/11/16
  Time: 19:01
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
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link href="${APP_PATH }/static/css/dui.css" rel="stylesheet">
    <link href="${APP_PATH }/static/css/main.css" rel="stylesheet">
    <link href="${APP_PATH}/static/css/pagenavi.css" rel="stylesheet">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<%--    <link rel="stylesheet" href="${APP_PATH }/static/bootstrap-3.4.1-dist/css/bootstrap.min.css"--%>
<%--          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">--%>

<%--    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->--%>
<%--    <link rel="stylesheet" href="${APP_PATH }/static/bootstrap-3.4.1-dist/css/bootstrap-theme.min.css"--%>
<%--          integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">--%>

<%--    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->--%>
<%--    <script src="${APP_PATH }/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"--%>
<%--            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"--%>
<%--            crossorigin="anonymous"></script>--%>
    <style type="text/css">
        .type-list .dialog {
            height: 200px !important;
            margin-left: -320px;
            margin-top: -180px;
            width: 740px;
        }

        .type-list .dialog input {
            width: 60% !important;
        }

        .type-list .dialog .btns-item {
            margin-top: 30px !important;
        }

        .type-add {
            display: none;
        }

        .dialog {
            height: 200px;
            width: 600px;
        }

        .dialog.dialog-page {
            height: 200px;
            width: 700px;
        }

        .dialog.dialog-page .body {
            height: 200px;
            width: 700px;
        }
    </style>
</head>
<body onload="init()">
<div class="index container">
    <div class="header">
        <img class="logo" src="${APP_PATH }/static/images/logo.png">
        <div class="title">
            <h3>百疆书社 -- 图书馆管理</h3>
            <h5>BAIJIANG BOOKSTORE LIBRARY MANAGE</h5>
        </div>
        <div class="toolbar">
            <a id="account">${sessionScope.admin.name}</a>
<%--            <a id="pwdedit" onclick="editSave()">修改密码</a>--%>
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
                    <a id="typemgr" title="类别管理" href="typeList" class="cur"></a>
                    <a id="bookmgr" title="客户管理" href="customerList"></a>
                    <a id="usermgr" title="用户管理" href="userList"></a>
                </div>
            </div>
        </div>
        <div class="subpage">
            <div class="concierge-list">
                <div class="search-form">
                    <div class="form-item">
                        <label>分类名称</label>
                        <input id="inputTypeName">
                    </div>

                    <div class="form-item btns-item">
                        <button class="success" id="new" onclick="onNew()">新增</button>
                        <button class="primary" id="search" onclick="loadRecord()">查询</button>
                    </div>
                </div>
                <div class="listwrap">
                    <table>
                        <thead>
                        <tr>
                            <th style="width: 10%;">序号</th>
                            <th style="width: 10%;">类别</th>
                            <th style="width: 10%;">操作</th>
                        </tr>
                        </thead>
                        <tbody id="list-rows">

                        <c:forEach var="type" items="${pageInfo.list}">
                            <tr>
                                <td class="tC">${type.id}</td>
                                <td class="tC">${type.typename}</td>

                                <td class="tC" style="    display: flex;
    justify-content: center;
    align-items: center;
">
                                    <a class="edit btn primary" href="#" onclick="onEdit(${type.id})">修改信息</a>
                                    <a class="delete btn danger" href="#" onclick="deleteEle(${type.id})">删除</a>
                                </td>
                            </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                </div>

                <!-- 显示分页信息 -->
                <div class="row">
                <!--分页文字信息  -->

                <!-- 分页条信息 -->
                <div class="row-left">
                    <nav aria-label="Page navigation">
                        <ul class="nav">

                            <c:if test="${pageInfo.hasPreviousPage }">
                                <li><a href="${APP_PATH}/typeList?PageNo=${pageInfo.navigateFirstPage}">首页</a></li>
                                <li><a href="${APP_PATH }/typeList?PageNo=${pageInfo.prePage}"
                                       aria-label="Previous"> <span aria-hidden="true">上一页</span>
                                </a></li>
                            </c:if>


                            <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                <c:if test="${page_Num == pageInfo.pageNum }">
                                    <li class="active">${pageInfo.pageNum}</li>
                                </c:if>
                                <c:if test="${page_Num != pageInfo.pageNum }">
                                    <li><a href="${APP_PATH }/typeList?PageNo=${page_Num}">${page_Num}</a></li>
                                </c:if>

                            </c:forEach>


                            <c:if test="${pageInfo.hasNextPage }">
                                <li><a href="${APP_PATH }/typeList?PageNo=${pageInfo.nextPage}"
                                       aria-label="Next"> <span aria-hidden="true">下一页</span>
                                </a></li>
                                <li><a href="${APP_PATH }/typeList?PageNo=${pageInfo.pages}">末页</a></li>
                            </c:if>

                        </ul>
                    </nav>
                </div>
                <br>
                <div class="total">当前第 ${pageInfo.pageNum }页,共${pageInfo.pages }
                    页,共 ${pageInfo.total } 条记录
                </div>
            </div>

            </div>

            <div class="dialog dialog-page" style="display: none;" id="edit">
                <div class="header">
                    <span>编辑类别</span><i class="close" onclick="closeEdit()"></i>
                </div>
                <div class="body">
                    <div class="concierge-add">

                        <div class="form">

                            <form method="post" id="myform" action="typeSave">
                                <div class="form-item">
                                    <c:if test="${!empty type.id}">
                                        <input name="id" type="hidden" value="${type.id}">
                                    </c:if>
<%--                                    <input name="id" type="hidden" value="${type.id}">--%>
                                    <label>类型</label>
                                    <input id="type" name="typename" style="color: #0f0f0f">
                                </div>
                            </form>

                            <div class="form-item btns-item">
                                <button class="primary" id="save" onclick="newSave()" style="color: #0f0f0f">保存</button>
                                <button id="cancle" onclick="closeEdit()" style="color: #0f0f0f">取消</button>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
            <div id="shadow"></div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var count = 4;

    function signout() {
        if (confirm("确定要注销吗？")) {
            location.href = "userLoginOut";
        }
    }

    function deleteEle(e) {
        if (confirm("确定要删除吗？")) {
            var form = document.createElement("form");
            document.body.appendChild(form);
            form.action="typeDelete";
            form.method="post";
            var input = document.createElement("input");
            input.value=e;
            input.type="hidden";
            input.name="id";
            form.appendChild(input);
            var input_method = document.createElement("input");
            input_method.name="_method";
            input_method.type="hidden";
            input_method.value="delete"
            form.appendChild(input_method);
            form.submit();
            // window.location = "typeDelete?id=" + e;
            document.removeChild(form);
        }
    }

    function onEdit(id) {
        //使用js跳转页面
        window.location.href = "typeList?id=" + id + "&PageNo=" + ${pageInfo.pageNum};

    }

    function init() {
        var opo = "${opo}";
        if (opo === "edit") {
            document.getElementById("type").value = "${type.typename}";
            document.getElementById("edit").style.display = "block";
            document.getElementById("shadow").style.display = "block";
        }
    }

    function onNew() {
        document.getElementById("edit").style.display = "block";
        document.getElementById("shadow").style.display = "block";
    }

    function newSave() {

        //获取表单的值
        var myform = document.getElementById("myform");

        //判断到底是更新还是添加
        var opo = "${opo}";
        //每次更新都需要从服务器跳转，那么form的title属性就会变空，就不等于save了
        if (opo == "edit" && myform.title != "save") {
            //不建议使用地址加参数，使用的是get请求
            myform.action = "typeUpdate";
        }
        myform.submit();
        //提交表单
    }

    function editSave() {
        alert("修改成功！");
        var para = document.createElement("tr");
        var value = document.getElementById("type").value;
        var list = document.getElementById("list-rows");
        list.appendChild(para);
        closeEdit();
    }

    function closeEdit() {
        //还原表单 js代码
        document.getElementById("type").value = "";

        var myform = document.getElementById("myform");
        myform.title = "save";//设置成一个添加标识
        myform.action = "typeSave";

        document.getElementById("edit").style.display = "none";
        document.getElementById("shadow").style.display = "none";
    }

    function loadRecord() {
        let typeName = document.getElementById("inputTypeName").value
        window.location = "typeListSearch?typeName=" + typeName
        alert("查询成功！");
    }

    function pwdedit() {
        window.location = "pwEdit"
    }
</script>
</html>
<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2020/11/16
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>图书管理系统</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <link href="${APP_PATH }/static/css/dui.css" rel="stylesheet">
    <link href="${APP_PATH }/static/css/main.css" rel="stylesheet">
    <link href="${APP_PATH}/static/css/pagenavi.css" rel="stylesheet">
<%--    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->--%>
<%--    <link rel="stylesheet" href="${APP_PATH }/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">--%>

<%--    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->--%>
<%--    <link rel="stylesheet" href="${APP_PATH }/static/bootstrap-3.4.1-dist/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">--%>

<%--    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->--%>
<%--    <script src="${APP_PATH }/static/bootstrap-3.4.1-dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>--%>
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
<%--            <a id="pwdedit" onclick="pwdedit()">修改密码</a>--%>
            <a id="signout" onclick="signout()">注销</a>
            <img class="usericon" src="${APP_PATH }/static/images/icons/usericon.png">
        </div>
    </div>
    <div class="main">
        <div class="toolbar">
            <div class="btns-wrap">
                <div class="btns-tool">
                    <a id="editbook" title="借阅管理" href="borrowList" class="cur"></a>
                    <a id="addbook" title="图书管理" href="bookList" ></a>
                    <a id="typemgr" title="类别管理" href="typeList"></a>
                    <a id="bookmgr" title="客户管理" href="customerList" ></a>
                    <a id="usermgr" title="用户管理" href="userList" ></a>
                </div>
            </div>
        </div>
        <div class="subpage">
            <div class="concierge-list">
                <div class="search-form">
                    <div class="form-item">
                        <label>书名</label>
                        <input id="inputBookName">
                    </div>
                    <div class="form-item">
                        <label>借书人</label>
                        <input id="inputUsername">
                    </div>
                    ${user.name}
                    <div class="form-item btns-item">
                        <button class="success" id="new" onclick="onNew()">借书</button>
                        <button class="primary" id="search" onclick="loadRecord()">查询</button>
                    </div>
                </div>
                <div class="listwrap">
                    <table>
                        <thead>
                        <tr>
                            <th style="width: 10%;">序号</th>
                            <th style="width: 10%;">书名</th>
                            <th style="width: 10%;">借书人</th>
                            <th style="width: 10%;">借书日期</th>
                            <th style="width: 10%;">还书日期</th>
                            <th style="width: 10%;">操作</th>
                        </tr>
                        </thead>
                        <tbody id="list-rows">

                        <c:forEach var="row" items="${pageInfo.list}">
                        <tr>
                            <td class="tC">${row.id}</td>
                            <td class="tC">${row.book.name}</td>
                            <td class="tC">${row.customer.name}</td>
<%--                            <td class="tC">${row.bdate}</td>--%>
                            <td class="tC">
                                <fmt:formatDate value="${row.bdate}" type="date"/>
                            </td>
                            <td class="tC">
                                <fmt:formatDate value="${row.rdate}" type="date"/>
                            </td>

                            <td class="tC">
                                <a class="edit btn primary" href="#" onclick="onEdit(${row.id})">还书</a>
                                <a class="delete btn danger" href="#" onclick="deleteEle(${row.id})">删除</a>
                            </td>
                        </tr></c:forEach>


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
                                    <li><a href="${APP_PATH}/borrowList?PageNo=${pageInfo.navigateFirstPage}">首页</a></li>
                                    <li><a href="${APP_PATH }/borrowList?PageNo=${pageInfo.prePage}"
                                           aria-label="Previous"> <span aria-hidden="true">上一页</span>
                                    </a></li>
                                </c:if>


                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                        <li class="active">${pageInfo.pageNum}</li>
                                    </c:if>
                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                        <li><a href="${APP_PATH }/borrowList?PageNo=${page_Num}">${page_Num}</a></li>
                                    </c:if>

                                </c:forEach>


                                <c:if test="${pageInfo.hasNextPage }">
                                    <li><a href="${APP_PATH }/borrowList?PageNo=${pageInfo.nextPage}"
                                           aria-label="Next"> <span aria-hidden="true">下一页</span>
                                    </a></li>
                                    <li><a href="${APP_PATH }/borrowList?PageNo=${pageInfo.pages}">末页</a></li>
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
                    <span>编辑客户</span><i class="close" onclick="closeEdit()"></i>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
<script type="text/javascript">

    var count = 4;
    function signout(){
        if(confirm("确定要注销吗？")){
            location.href = "userLoginOut";
        }
    }
    function deleteEle(e){
        if(confirm("确定要删除吗？")){
            var form = document.createElement("form");
            document.body.appendChild(form);
            form.action="borrowDelete";
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
            document.removeChild(form);
        }
    }
    function onEdit(id){
        //使用js跳转页面
       window.location="returnBook?id="+id;


    }

    function onNew(){
       window.location="borrowAdd";
    }


    function newSave(){

        //获取表单的值
        var myform = document.getElementById("myform");

        myform.submit();
        //提交表单
    }
    function loadRecord() {
        let username = document.getElementById("inputUsername").value
        let bookName = document.getElementById("inputBookName").value
        window.location="borrowListSearch?bookName=" + bookName + "&username=" + username
    }
function pwdedit() {
    window.location="pwEdit"
}
</script>
</html>
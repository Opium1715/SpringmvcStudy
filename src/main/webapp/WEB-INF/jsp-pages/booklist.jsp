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
    <style type="text/css">
        .type-list .dialog {height:980px !important;margin-left: -320px;margin-top: -250px;width: 740px;}
        .type-list .dialog input {width: 60% !important;}
        .type-list .dialog .btns-item {margin-top: -10px !important;}
        .type-add{display: none;}
        .dialog{height:980px;width:600px;}
        .dialog.dialog-page {height:980px;width:700px;margin-top: -380px;}
        .dialog.dialog-page .body{height: 980px;width:700px;}
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
<%--            <a id="pwdedit" onclick="pwdedit()">修改密码</a>--%>
            <a id="signout" onclick="signout()">注销</a>
            <img class="usericon" src="${APP_PATH }/static/images/icons/usericon.png">
        </div>
    </div>
    <div class="main">
        <div class="toolbar">
            <div class="btns-wrap">
                <div class="btns-tool">
                    <a id="editbook" title="借阅管理" href="borrowList"></a>
                    <a id="addbook" title="图书管理" href="bookList" class="cur"></a>
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
                        <input id="inputBookName" >
                    </div>
                    <div class="form-item">
                        <label>分类</label>
                        <input id="inputBookType">
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
                            <th style="width: 10%;">书名</th>
                            <th style="width: 10%;">作者</th>
                            <th style="width: 10%;">出版社</th>
                            <th style="width: 10%;">价格</th>
                            <th style="width: 10%;">类别</th>
                            <th style="width: 10%;">图片</th>
                            <th style="width: 10%;">操作</th>
                        </tr>
                        </thead>
                        <tbody id="list-rows">

                        <c:forEach var="book" items="${pageInfo.list}">
                        <tr>
                            <td class="tC">${book.id}</td>
                            <td class="tC">${book.name}</td>
                            <td class="tC">${book.author}</td>
                            <td class="tC">${book.publisher}</td>
                            <td class="tC">${book.price}</td>
                            <td class="tC">${book.type.typename}</td>
                            <td class="tC"><img src="${APP_PATH }/static/upload/book/${book.imageName}" style="height: 60px;width:60px;"></td>

                            <td class="tC">
                                <a class="edit btn primary" href="#" onclick="onEdit(${book.id})">修改信息</a>
                                <a class="delete btn danger" href="#" onclick="deleteEle(${book.id})">删除</a>
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
                                    <li><a href="${APP_PATH}/bookList?PageNo=${pageInfo.navigateFirstPage}">首页</a></li>
                                    <li><a href="${APP_PATH }/bookList?PageNo=${pageInfo.prePage}"
                                           aria-label="Previous"> <span aria-hidden="true">上一页</span>
                                    </a></li>
                                </c:if>


                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                        <li class="active">${pageInfo.pageNum}</li>
                                    </c:if>
                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                        <li><a href="${APP_PATH }/bookList?PageNo=${page_Num}">${page_Num}</a></li>
                                    </c:if>

                                </c:forEach>


                                <c:if test="${pageInfo.hasNextPage }">
                                    <li><a href="${APP_PATH }/bookList?PageNo=${pageInfo.nextPage}"
                                           aria-label="Next"> <span aria-hidden="true">下一页</span>
                                    </a></li>
                                    <li><a href="${APP_PATH }/bookList?PageNo=${pageInfo.pages}">末页</a></li>
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
                <div class="body">
                    <div class="concierge-add">

                            <div class="form">

                                <form  method="post" id="myform"  action="typeSave">


                                    <div class="form-item">
                                        <label>书名: </label>
                                        <input id="bookname" name="name">
                                    </div>
                                    <div class="form-item">
                                        <label>英文名: </label>
                                        <input id="ename" name="ename">
                                    </div>
                                    <div class="form-item">
                                        <label>类别: </label>
                                        <select id="typeid" name="typeid">
                                            <option value="0">天文</option>
                                            <option value="1">地理</option>
                                            <option value="2">历史</option>
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
                                        <input id="publishdate" name="pdate">
                                    </div>
                                    <div class="form-item">
                                        <label>ISBN: </label>
                                        <input id="isbn" name="isbn">
                                    </div>
                                    <div class="form-item">
                                        <label>价格: </label>
                                        <input id="price" name="price">
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
                                        <img style="width: 100px;height:100px;float: left;" id="xmTanImg"/><br/>
                                        <%--<input type="file" id="pic" name="pic" onchange="xmTanUploadImg(this)"/>--%>
                                    </div>

                                </form>

                                <div class="form-item btns-item">
                                    <button class="primary" id="save" onclick="newSave()">保存</button>
                                    <button id="cancle" onclick="closeEdit()">取消</button>
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
    //选择图片，马上预览
    function xmTanUploadImg(obj) {

        var file = obj.files[0];

        var reader = new FileReader();
        reader.onload = function (e) {
            var img = document.getElementById("xmTanImg");
            img.src = e.target.result;
        }
        reader.readAsDataURL(file)
    }



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
            form.action="bookDelete";
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
       window.location="bookEdit?id="+id;


    }
function init() {
        var opo="${opo}";
if(opo=="edit"){
 document.getElementById("type").value="${type.type}";


          document.getElementById("edit").style.display="block";
       document.getElementById("shadow").style.display="block";
}
}
    function onNew(){
       window.location="bookAdd";
    }
    function newSave(){

        //获取表单的值
        var myform = document.getElementById("myform");

        //判断到底是更新还是添加
        var opo="${opo}";
        if(opo=="edit"&&myform.title!="save"){
            //不建议使用地址加参数，使用的是get请求
            myform.action="typeUpdate?id=${type.id}";
        }
        myform.submit();
        //提交表单
    }
    function editSave(){
        alert("修改成功！");
        var para = document.createElement("tr");
        var value = document.getElementById("type").value;
        var list = document.getElementById("list-rows");
        list.appendChild(para);
        closeEdit();
    }
    function closeEdit(){
        //还原表单 js代码
     //   document.getElementById("type").value="";

        var myform = document.getElementById("myform");
        myform.title="save";//设置成一个添加标识
        myform.action="typeSave";

        document.getElementById("edit").style.display="none";
        document.getElementById("shadow").style.display="none";
    }
    function loadRecord(){
        let searchParam = {
            bookName : document.getElementById("inputBookName").value,
            bookType : document.getElementById("inputBookType").value
        }
        console.log(searchParam)
        window.location="bookListSearch?bookName=" +  searchParam.bookName + "&bookType=" + searchParam.bookType
        alert("查询成功！");
    }
    function pwdedit() {
        window.location="pwEdit"
    }

</script>
</html>
<%--
  Created by IntelliJ IDEA.
  User: sunggyu-lim
  Date: 2023/01/01
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>


<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:400,300">

    <style>

        .sidebar {
            z-index: 5;
        }
        .row {
            --bs-gutter-x: 0;
        }

        .itemRegisterBtn {
            position: relative;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #eeeeee;
        }

        .table {
            --bs-table-bg: #fff;
        }

        .table.addList, label {
            --bs-table-bg: #5f7175;
            --bs-table-color: #fff;
            text-align: center;
            line-height: 39px;
            font-size: 16px;
        }

        tr {
            height: 55px;
        }

        h1 {
            font-size: 1.7em;
            margin: 30px 0;
        }

        h2 {
            font-size: 1.1em;
            margin: 20px 0 10px 0;
        }

        .table td {
            /*--bs-table-bg: #fffff;*/
            background-color: #fff;
            color: #37393b;
            text-align: center;
            line-height: 39px;
            font-size: 16px;
            font-weight: bold;
        }

        .tableList {
            background-color: #fff;
            height: 672px;
        }

        td a {
            color: #37393b;
            background-color: #fff;
            text-decoration: none;
        }

        .table button {
            color: #fff;
            width: 100px;
            --bs-btn-font-weight: 600;
            border: none;
        }

        .searchBox {
            background-color: white;
            padding: 20px 80px 5px 80px;
            color: #212529;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        form > * {
            background-color: white;
            position: relative;
        }

        form .form-control, .form-select {
            height: 40px;
            margin: 5px 0 5px 0;
        }

        .input-group {
            margin-bottom: 0;
        }

        .itemRegisterBtn {
            float: right;
            margin-top: 20px;
        }

        .itemRegisterBtn button {
            background-color: #658e99;
            text-align: center;
            width: 150px;
            height: 55px;
            color: #fff;
            line-height: 39px;
            --bs-btn-font-weight: 600;
            border: none;
        }

        form div div, label {
            background-color: white;
        }

        .searchBtn {
            width: 100px;
            height: 40px;
            margin: 5px 0px 5px 0px;
            --bs-btn-font-weight: 600;
            background-color: #658e99;
            border: none;
        }

        /*??????????????????*/
        .pagination {
            position: relative;
            justify-content: center;
            height: 50px;
            /*right: 10%;*/
        }

        .pagination a {
            z-index: 2;
            position: relative;
            display: inline-block;
            color: #2c3e50;
            text-decoration: none;
            /*font-size: 1.2rem;*/
            padding: 9px 15px 4px;
            font-family: 'Open Sans', sans-serif;
        }

        .pagination a:before {
            z-index: -1;
            position: absolute;
            height: 100%;
            width: 100%;
            content: "";
            top: 0;
            left: 0;
            background-color: #2c3e50;
            border-radius: 24px;
            transform: scale(0);
            transition: all 0.2s;
        }

        .pagination a:hover,
        .pagination a .pagination-active {
            color: #fff;
        }

        .pagination a:hover:before,
        .pagination a .pagination-active:before {
            transform: scale(1);
        }

        .pagination .pagination-active {
            color: #fff;
        }

        .pagination .pagination-active:before {
            transform: scale(1);
        }

        .pagination-newer, .pagination-older {
            border-style: solid;
            border-width: 0;
            border-radius: 20px;
            padding: 9px 10px !important;
            margin-bottom: 13px;
        }

        .btnStyle{
            background-color: #598f9b;
        }

    </style>
</head>
<body>
<c:if test="${not empty message }">
    <div style="cursor:pointer" onclick="">
        <script>
            alert('<c:out value="${message }"/>')
        </script>
    </div>
</c:if>
<div class="row">
    <div class= "col-3 sidebar" style="max-width: 300px">
        <my:header></my:header>
    </div>
    <div class="col" style="margin: 0 auto;max-width:70%;min-width: 600px">
        <div class="">
            <div class="row justify-content-between">
                <div class="col">
                    <h1 id="header"><i class="fa-solid fa-layer-group" style="margin-right: 10px;"></i>?????? ?????? ??? ??????</h1>
                </div>
                <div class="itemRegisterBtn col-auto">
                    <c:url value="/item/register" var="registerLink"></c:url>
                    <button type="button" class="btn btn-secondary" onclick="location.href='${registerLink}' ">?????? ??????
                    </button>
                </div>
            </div>
            <div class="searchBox">
                <c:url value="/item/list" var="listLink"></c:url>

                <%--            ???????????? ?????? ????????????--%>

                <%--      <form action="${listLink}" role="search">--%>
                <%--                        <div style="display: flex;justify-content: space-between;">--%>
                <%--                            <div>--%>
                <%--                                <label>????????????</label>--%>
                <%--                                <input class="form-control" value="${param.m_item_id}" type="search" name="m_item_id"--%>
                <%--                                       placeholder="??????" autocomplete='off' style="width: 210px">--%>
                <%--                            </div>--%>
                <%--                            <div>--%>
                <%--                                <label>????????????</label>--%>
                <%--                                <input class="form-select" type="text" list="groupList" style="width: 210px"/>--%>
                <%--                                <datalist id="groupList">--%>
                <%--                                    <c:forEach items="${groupList}" var="groupList">--%>
                <%--                                        <option class="non" value="${groupList.m_item_group}">${groupList.m_item_group}</option>--%>
                <%--                                    </c:forEach>--%>
                <%--                                </datalist>--%>
                <%--                            </div>--%>
                <%--                            <div style="float: right">--%>
                <%--                                <label>?????????</label>--%>
                <%--                                <input class="form-select" type="text" list="manufacturerList" style="width: 210px;"/>--%>
                <%--                                <datalist id="manufacturerList">--%>
                <%--                                    <c:forEach items="${manufacturerList}" var="manufacturerList">--%>
                <%--                                        <option class="non"--%>
                <%--                                                value="${manufacturerList.m_item_manufacturer}">${manufacturerList.m_item_manufacturer}</option>--%>
                <%--                                    </c:forEach>--%>
                <%--                                </datalist>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>

                <form action="${listLink}" class="d-flex" role="search">
                    <div class="input-group flex-nowrap" style="float: none;">
                        <select name="t" class="form-select">
                            <option value="all">??????</option>
                            <option value="itemId" ${param.t == 'itemId' ? 'selected' : '' }>????????????</option>
                            <option value="itemGroup" ${param.t == 'itemGroup' ? 'selected' : '' }>????????????</option>
                            <option value="itemManufacturer" ${param.t == 'itemManufacturer' ? 'selected' : '' }>?????????
                            </option>
                            <option value="itemName" ${param.t == 'itemName' ? 'selected' : '' }>?????????</option>
                        </select>

                        <input value="${param.q}" type="search" class="form-control" placeholder="Search"
                               aria-label="Search" name="q" style="width:600px">
                        <button class="btn btn-secondary searchBtn" type="submit" value="??????">??????</button>
                    </div>
                </form>
            </div>

            <div style="display: flex;background-color: transparent">
                <c:url value="/item/remove" var="removeLink"/>
                <form id="removeForm" action="${removeLink }" method="post">
                    <input type="hidden" id="removeInput" name="m_item_id" value="">
                </form>
                <button class="btn btn-danger removeBtn" style="margin-left: auto;margin-bottom: 10px;"
                        data-bs-toggle="modal"
                        data-bs-target="#removeModal" value="??????" disabled>????????????
                </button>
            </div>

            <div class="tableList">
                <table class="table addList">
                    <thead>
                    <tr>
                        <th style="width: 50px"><input name="selectAll" type="checkbox" value="selectAll"
                                                       onclick="selectAll(this)"
                                                       style="position: relative;top: -14px;background-color: transparent;">
                        </th>
                        <th style="width: 200px">????????????</th>
                        <th style="width: 200px">????????????</th>
                        <th style="width: 200px">?????????</th>
                        <th style="width: 250px">?????????</th>
                        <th style="width: 100px">??????</th>
                        <th style="width: 100px"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${itemList}" var="itemList">
                        <tr>
                            <td>
                                <input name="itemBox" type="checkbox" value="${itemList.m_item_id}"
                                       onclick='checkSelectAll(); activeBtn()' style="position: relative;top: 10px">
                            </td>
                            <td class="selectItemId">
                                    ${itemList.m_item_id}
                            </td>
                            <td>
                                    ${itemList.m_item_group}
                            </td>
                            <td>
                                    ${itemList.m_item_manufacturer}
                            </td>
                            <td>
                                    ${itemList.m_item_name}
                            </td>
                            <td>
                                    ${itemList.m_item_unit}
                            </td>
                            <td>
                                <c:url value="/item/register" var="registerLink">
                                    <c:param name="m_item_id" value="${itemList.m_item_id}"></c:param>
                                </c:url>
                                <button type="button" class="btn btnStyle"
                                        onclick="location.href='${registerLink}' ">??????
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="row">
                <div class="col">
                    <nav aria-label="pagination-container" style=" background-color: #fff">
                        <div class="pagination">

                            <%-- ?????? ??????( 1???????????? ????????? ??????) --%>
                            <c:if test="${itemDto.currentPageNumber ne 1 }">
                                <c:url value="/item/list" var="listLink">
                                    <c:param name="page" value="1"/>
                                    <c:param name="q" value="${param.q }"/>
                                    <c:param name="t" value="${param.t }"/>
                                </c:url>
                                <a href="${listLink }" class="pagination-newer">
                                    <i class="bi bi-chevron-double-left"></i>
                                </a>
                            </c:if>

                            <%-- ?????? ??????--%>
                            <c:if test="${itemDto.hasPrevButton }">
                                <c:url value="/item/list" var="listLink">
                                    <c:param name="page" value="${itemDto.jumpPrevPageNumber }"></c:param>
                                    <c:param name="q" value="${param.q }"/>
                                    <c:param name="t" value="${param.t }"/>
                                </c:url>
                                <a href="${listLink }" class="pagination-newer">
                                    <i class="bi bi-chevron-left"></i>
                                </a>
                            </c:if>

                            <c:forEach begin="${itemDto.leftPageNumber}" end="${itemDto.rightPageNumber}"
                                       var="pageNumber">
                                <c:url value="/item/list" var="listLink">
                                    <c:param name="page" value="${pageNumber }"/>
                                    <c:param name="q" value="${param.q }"/>
                                    <c:param name="t" value="${param.t }"/>
                                </c:url>
                                <span class="pagination-inner">
                              <%-- ?????????????????? active ????????? ?????? --%>
                                <a class="${itemDto.currentPageNumber eq pageNumber ? 'pagination-active' : ''}"
                                   href="${listLink}">${pageNumber}</a>
                        </span>
                            </c:forEach>

                            <%-- ?????? ?????? --%>
                            <c:if test="${itemDto.hasNextButton }">
                                <c:url value="/item/list" var="listLink">
                                    <c:param name="page" value="${itemDto.jumpNextPageNumber }"></c:param>
                                    <c:param name="q" value="${param.q }"/>
                                    <c:param name="t" value="${param.t }"/>
                                </c:url>
                                <a href="${listLink }" class="pagination-older">
                                    <i class="bi bi-chevron-right"></i>
                                </a>
                            </c:if>

                            <%-- ?????? ?????? --%>
                            <c:if test="${itemDto.currentPageNumber ne itemDto.lastPageNumber }">
                                <c:url value="/item/list" var="listLink">
                                    <c:param value="${itemDto.lastPageNumber }" name="page"/>
                                    <c:param name="q" value="${param.q }"/>
                                    <c:param name="t" value="${param.t }"/>
                                </c:url>
                                <a href="${listLink }" class="pagination-older">
                                    <i class="bi bi-chevron-double-right"></i>
                                </a>
                            </c:if>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('.pagination-inner a').on('click', function () {
            $(this).siblings().removeClass('pagination-active');
            $(this).addClass('pagination-active');
        })
    </script>
    <!-- remove Modal -->
    <div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 style="font-family: 'LINESeedKR-Bd'" class="modal-title fs-5" id="exampleModalLabel">??????
                        ??????</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ????????????????????????? ????????? ??? ????????????.
                </div>
                <div class="modal-footer">
                    <button style="font-family: 'LINESeedKR-Bd'" type="button" class="btn btn-secondary"
                            data-bs-dismiss="modal">??????
                    </button>
                    <button style="font-family: 'LINESeedKR-Bd'" id="removeButton" type="submit"
                            class="btn btn-danger">??????
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script>
    // ???????????? select
    var initialText = $('.GroupEditable').val();
    $('.groupEditOption').val(initialText);

    $('#groupSelect').change(function () {
        var selected = $('option:selected', this).attr('class');
        var optionText = $('.GroupEditable').text();

        if (selected == "GroupEditable") {
            $('.groupEditOption').show();


            $('.groupEditOption').keyup(function () {
                var editText = $('.groupEditOption').val();
                $('.GroupEditable').val(editText);
                $('.GroupEditable').html(editText);
            });

        } else {
            $('.groupEditOption').hide();
        }
    });

    // ?????? ????????? select
    var initialText = $('.manufacturerEditable').val();
    $('.ManufacturerEditOption').val(initialText);

    $('#manufacturerSelect').change(function () {
        var selected = $('option:selected', this).attr('class');
        var optionText = $('.manufacturerEditable').text();

        if (selected == "manufacturerEditable") {
            $('.ManufacturerEditOption').show();


            $('.ManufacturerEditOption').keyup(function () {
                var editText = $('.ManufacturerEditOption').val();
                $('.manufacturerEditable').val(editText);
                $('.manufacturerEditable').html(editText);
            });

        } else {
            $('.ManufacturerEditOption').hide();
        }
    });

</script>
<script>
    // ???????????? ??????
    function checkSelectAll() {
        const selectAll = document.querySelector('input[name="selectAll"]');
        const checkboxes = document.querySelectorAll('input[name="itemBox"]');
        const checked = document.querySelectorAll('input[name="itemBox"]:checked');

        if (checkboxes.length === checked.length) {
            selectAll.checked = true;
        } else {
            selectAll.checked = false;
        }
    }

    // ???????????? ??????
    function selectAll(selectAll) {
        const checkboxes = document.getElementsByName('itemBox');
        const checked = document.querySelectorAll('input[name="itemBox"]:checked');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked
        })
        // ???????????? ??? ???????????? ?????????
        if (checkboxes.length === 10 && checked.length === 10) {
            document.querySelector(".removeBtn").disabled = true;
        } else {
            document.querySelector(".removeBtn").disabled = false;
        }
    }

    // ???????????? ?????????
    function activeBtn() {
        const checked = document.querySelectorAll('input[name="itemBox"]:checked');
        if (checked.length > 0) {
            document.querySelector(".removeBtn").disabled = false;
        } else {
            document.querySelector(".removeBtn").disabled = true;
        }
    }

    // ?????? ??????
    function remove() {
        const length = document.getElementsByName("itemBox").length;
        const removeIdList = [];
        for (let i = 0; i < length; i++) {
            const checkedBox = document.getElementsByName("itemBox")[i].checked;

            if (checkedBox) {
                const selectId = document.getElementsByName("itemBox")[i].value;
                removeIdList.push(selectId);
            }
        }
        document.querySelector("#removeInput").value = removeIdList;
        document.getElementById('removeForm').submit();
    }

    // ???????????? ?????? ???
    document.querySelector("#removeButton").addEventListener("click", remove);
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</html>

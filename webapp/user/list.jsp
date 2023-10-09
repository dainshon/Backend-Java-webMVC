<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Collection" %>
<%@ page import="jwp.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>KUIT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark" aria-label="Fourth navbar example">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"> KUIT </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample04"
                aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample04">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-bs-toggle="dropdown"
                       aria-expanded="false">Home</a>
                    <ul class="dropdown-menu" aria-labelledby="dropdown04">
                        <li><a class="dropdown-item" href="#">Profile</a></li>
                        <li><a class="dropdown-item" href="#">Settings</a></li>
                    </ul>
                </li>
            </ul>
            <form>
                <input class="form-control" type="text" placeholder="Search" aria-label="Search">
            </form>
        </div>
    </div>
</nav>
<div class="navbar-default">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
        </a>

        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
            <li><a href="/index.html" class="nav-link px-2 link-secondary">Q&A</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
            <li><a href="/user/userList" class="nav-link px-2 link-dark">User List</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">About</a></li>
        </ul>

        <div class="col-md-3 text-end">

        <c:choose>
        <c:when test="${not empty sessionScope.user}">
        	<a href="/user/logout" role="button" class="btn btn-outline-primary me-2">Log-Out</a>
        	<a href="/user/updateForm?userId=${sessionScope.user.userId}" role="button" class="btn btn-primary" >개인정보수정</a>
        </c:when>
        <c:otherwise>
        	<a href="/user/login" type="button" class="btn btn-outline-primary me-2">Log-In</a>
        	<a href="/user/signup" type="button" class="btn btn-primary">Sign-up</a>
        </c:otherwise>
        </c:choose>

        </div>
    </header>

    <div class="container" id="main">
        <table class="table table-striped">
            <thead class="col-md-12">
            <tr>
                <th class="col-md-3">아이디</th>
                <th class="col-md-3">이름</th>
                <th class="col-md-3">이메일</th>
                <th class="col-md-3">#</th>

            </tr>
            </thead>
            <tbody>
            <%
                Collection<User> users = (Collection<User>) request.getAttribute("users");
                String myId = (String) session.getAttribute("myId");
                for (User user : users) {
            %>
            <tr>
                <th class="col-md-3"><%= user.getUserId() %>
                </th>
                <th class="col-md-3"><%= user.getName() %>
                </th>
                <th class="col-md-3"><%= user.getEmail() %>
                </th>

                <%
                if(myId == user.getUserId()){
                %>

                <th class="col-md-3"><a href="/user/updateForm?userId=<%= user.getUserId() %>" class="btn btn-success" role="button">수정</a></th>

                <%
                }else{
                %>
                <th class="col-md-3"><a href="/user/updateForm?userId=<%= user.getUserId() %>" class="btn btn-success" role="button">${myId}, ${user.getUserId()}</a></th>

                <%
                }
                %>

            </tr>
            <%

                }
            %>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../js/scripts.js"></script>
</body>
</html>
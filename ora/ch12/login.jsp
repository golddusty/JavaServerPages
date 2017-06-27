<%@ page contentType="text/html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<html>
  <head>
    <title>Project Billboard</title>
  </head>
  <body bgcolor="white">
    <h1>Welcome to the Project Billboard</h1>
    Your personalized project news web site.
    <p>
    <font color="red">
      <c:out value="${param.errorMsg}" />
    </font>

    <form action="authenticate.jsp" method="post">

      <input type="hidden" name="origURL" 
        value="<c:out value="${param.origURL}" />">

      Please enter your User Name and Password, and click Enter.
      <p>
      Name: 
      <input name="userName" 
        value="<c:out value="${cookie.userName.value}" />" 
        size="10">
      Password: 
      <input type="password" name="password" 
        value="<c:out value="${cookie.password.value}" />" 
        size="10">
      <input type="submit" value="Enter">
      <p>
      Remember my name and password:
      <input type="checkbox" name="remember"
        <c:if test="${!empty cookie.userName}">checked</c:if>>
      <br>
      (This feature requires cookies to be enabled in your browser)
    </form>
  </body>
</html>

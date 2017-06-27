<%@ page contentType="text/html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%-- 
  Set the locale to the selected one, if any. Otherwise, let the
  <fmt:bundle> action pick the best one based on the Accept-Language
  header.
--%>
<c:if test="${param.language == 'en'}">
  <fmt:setLocale value="en" scope="session" />
</c:if>
<c:if test="${param.language == 'sv'}">
  <fmt:setLocale value="sv" scope="session" />
</c:if>
<c:if test="${param.language == 'de'}">
  <fmt:setLocale value="de" scope="session" />
</c:if>

<fmt:setBundle basename="input" var="inputBundle" />
<fmt:setBundle basename="input" scope="session" />

<html>
  <head>
    <title>
      <fmt:message key="title" />
    </title>
  </head>
  <body bgcolor="white">
    <h1>
      <fmt:message key="title" />
    </h1>

    <fmt:message key="select_language" />
    <form action="input.jsp">
      <c:set var="currLang" value="${inputBundle.locale.language}" />
      <input type="radio" name="language" value="en"
        <c:if test="${currLang == 'en'}">checked</c:if>>
        <fmt:message key="english" /><br>
      <input type="radio" name="language" value="sv"
        <c:if test="${currLang == 'sv'}">checked</c:if>>
        <fmt:message key="swedish" /><br>
      <input type="radio" name="language" value="de"
        <c:if test="${currLang == 'de'}">checked</c:if>>
        <fmt:message key="german" /><br>
      <p>
      <input type="submit" 
        value="<fmt:message key="new_language" />">
    </form>

    <form action="process.jsp" method="post">
      <fmt:message key="date" /><br>
      <br>
      <jsp:useBean id="now" class="java.util.Date" />
      <input type="text" name="date">
      (<fmt:formatDate value="${now}" dateStyle="full" />)
      <p>
      <fmt:message key="number" /><br>
      <br>
      <input type="text" name="number">
      (<fmt:formatNumber value="1000.9" pattern="####.00"/>)
      <p>
      <input type="submit" 
        value="<fmt:message key="submit" />">
    </form>
  </body>
</html>

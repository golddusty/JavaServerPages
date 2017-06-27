<%@ page contentType="text/html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<html>
  <head>
    <title>Project Billboard</title>
  </head>
  <body bgcolor="white">

    <h1>Welcome <c:out value="${validUser.firstName}" /></h1>
    <h2>Number of active sessions: 
      <c:out value="${session_counter[0]}" />
    </h2>
    Your profile currently shows you like information about the 
    following checked-off projects. If you like to update your
    profile, make the appropriate changes below and click 
    Update Profile.
    <form action="updateProfile.do" method="post">

      <c:forEach items="${validUser.projects}" var="current">
        <c:choose>
          <c:when test="${current == 'JSP'}"> 
            <c:set var="jspSelected" value="true" />
          </c:when>
          <c:when test="${current == 'Servlet'}"> 
            <c:set var="servletSelected" value="true" />
          </c:when>
          <c:when test="${current == 'EJB'}"> 
            <c:set var="ejbSelected" value="true" />
          </c:when>
        </c:choose>
      </c:forEach>
      <input type="checkbox" name="projects" value="JSP"
        <c:if test="${jspSelected}">checked</c:if>>JSP<br>
      <input type="checkbox" name="projects" value="Servlet"
        <c:if test="${servletSelected}">checked</c:if>>Servlet<br>
      <input type="checkbox" name="projects" value="EJB"
        <c:if test="${ejbSelected}">checked</c:if>>EJB<br>
      <input type="submit" value="Update Profile">
    </form>
    <hr>

    When you're done reading the news, please <a href="../logout.do">
    log out</a>.

    <hr>
    <a href="entermsg.jsp">Post a new message</a>
    <p>

    <%-- Get all new items --%>
    <jsp:useBean id="news" scope="application"
      class="com.ora.jsp.beans.news.NewsBean" />
    <c:set var="newsItems" value="${news.newsItems}" />

    <%--
       Loop through all user projects and for each, loop through 
       all news items and display the ones that match the current 
       project.
    --%>
    <table>
      <c:forEach items="${validUser.projects}" var="projectName">
        <tr>
          <td colspan="2">
            <b>Project: <c:out value="${projectName}" /></b>
          </td>
        </tr>
        <c:forEach items="${newsItems}" var="newsItem">
          <c:if test="${newsItem.category == projectName}">
            <tr>
              <td>
                <c:out value="${newsItem.postedBy}" />
              </td>
              <td>
                <c:out value="${newsItem.postedDate}" />
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <c:out value="${newsItem.msg}" />
              </td>
            </tr>
            <tr>
              <td colspan="2"><hr></td>
            </tr>
          </c:if>
        </c:forEach>
      </c:forEach>
    </table>
  </body>
</html>

<%@ page contentType="text/html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>

<html>
  <head>
    <title>Search Result</title>
  </head>
  <body bgcolor="white">

  <c:choose>
    <c:when test="${empList.rowCount == 0}">
      Sorry, no employees were found.
    </c:when>
    <c:otherwise>
      The following employees were found:
      <p>
      <table border="1">
        <th>Last Name</th>
        <th>First Name</th>
        <th>Department</th>
        <th>Email Address</th>
        <th>Modified</th>
        <c:forEach items="${empList.rows}" var="row">
          <tr>
            <td><c:out value="${row.LastName}" /></td>
            <td><c:out value="${row.FirstName}" /></td>
            <td><c:out value="${row.Dept}" /></td>
            <td><c:out value="${row.EmailAddr}" /></td>
            <td><c:out value="${row.ModDate}" /></td>
            <td>
              <form action="delete.jsp" method="post">
                <input type="hidden" name="userName"
                  value="<c:out value="${row.UserName}" />">
                <input type="hidden" name="firstName"
                  value="<c:out value="${param.firstName}" />">
                <input type="hidden" name="lastName"
                  value="<c:out value="${param.lastName}" />">
                <input type="hidden" name="dept"
                  value="<c:out value="${param.dept}" />">
                <input type="submit" value="Delete">
              </form>
            </td>
          </tr>
        </c:forEach>
      </table>
    </c:otherwise>
  </c:choose>
  </body>
</html>

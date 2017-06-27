<%@ page contentType="text/html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<html>
  <head>
    <title>Employee Info Stored</title>
  </head>
  <body bgcolor="white">
    This is the information stored in the employee database:

    <table>
      <c:forEach items="${newEmpDbInfo.rows}" var="row">
        <c:forEach items="${row}" var="column">
          <tr>
            <td align=right>
              <b><c:out value="${column.key}" />:</b>
            </td>
            <td>
              <c:out value="${column.value}" />
            </td>
          </tr>
        </c:forEach>
      </c:forEach>
    </table>

  </body>
</html>

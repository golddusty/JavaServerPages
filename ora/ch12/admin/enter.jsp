<%@ page contentType="text/html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<html>
  <head>
    <title>Employee Entry Form</title>
  </head>
  <body bgcolor="white">

    Please enter information about an employee below:
    <form action="validate.jsp" method="post">
      <table>
        <tr>
          <td>User Name:</td>
          <td><input type="text" name="userName"
            value="<c:out value="${param.userName}" />">
          </td>
          <td><c:out value="${userNameError}" /></td>
        </tr>
        <tr>
          <td>Password:</td>
          <td><input type="text" name="password"
            value="<c:out value="${param.password}" />">
          </td>
          <td><c:out value="${passwordError}" /></td>
        </tr>
        <tr>
          <td>First Name:</td>
          <td><input type="text" name="firstName"
            value="<c:out value="${param.firstName}" />">
          </td>
          <td><c:out value="${firstNameError}" /></td>
        </tr>
        <tr>
          <td>Last Name:</td>
          <td><input type="text" name="lastName"
            value="<c:out value="${param.lastName}" />">
          </td>
          <td><c:out value="${lastNameError}" /></td>
        </tr>
        <tr>
          <td>Department:</td>
          <td><input type="text" name="dept"
            value="<c:out value="${param.dept}" />">
          </td>
          <td><c:out value="${deptError}" /></td>
        </tr>
        <tr>
          <td>Employment Date:</td>
          <td><input type="text" name="empDate"
            value="<c:out value="${param.empDate}" />">
          </td>
          <td><c:out value="${empDateError}" /></td>
          <td>(Use format yyyy-mm-dd)</td>
        </tr>
        <tr>
          <td>Email Address:</td>
          <td><input type="text" name="emailAddr"
            value="<c:out value="${param.emailAddr}" />">
          </td>
          <td><c:out value="${emailAddrError}"/></td>
          <td>(Use format name@company.com)</td>
        </tr>
        <tr>
          <td colspan=2><input type="submit" value="Submit"></td>
        </tr>
      </table>
    </form>

  </body>
</html>

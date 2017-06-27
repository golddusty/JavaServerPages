<%@ page contentType="text/html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="ora" uri="orataglib" %>
<%@ page isErrorPage="true" %>

<html>
  <head>
    <title>Sorry</title>
  </head>
  <body bgcolor="white">
    We're sorry but the request could not be processed. 
    Detailed information about the error has been logged so we will
    analyze it and correct whatever is causing it as soon as possible.
    <p>
    Please try again, and 
    <a href="mailto:webmaster@mycompany.com">let us know</a> if the
    problem persists.

    <ora:fileWrite fileName="log">
      Error in: <c:out value="${sourcePage}" /> 
      Error message: <c:out value="${pageContext.exception.message}" /> 
    </ora:fileWrite>

    <ora:debug type="params" />

  </body>
</html>

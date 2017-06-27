<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<html>
  <head>
    <title>Counter page</title>
  </head>
  <body bgcolor="white">

    <%-- Increment counters --%>
    <c:set var="sessionCounter" scope="session"
      value="${sessionCounter + 1}" />
    <c:set var="applCounter" scope="application"
      value="${applCounter + 1}" />

    <h1>Counter page</h1>

    This page has been visited <b>
    <c:out value="${sessionCounter}" />
    </b> times within the current session, and <b>
    <c:out value="${applCounter}" />
    </b> times by all users since the application was started.
  </body>
</html>

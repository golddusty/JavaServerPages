<jsp:root 
  xmlns:jsp="http://java.sun.com/JSP/Page" 
  xmlns:c="http://java.sun.com/jstl/core"
  version="1.2"> 
 
  <jsp:directive.page contentType="text/html" /> 
 
  <html>
    <head>
      <title>A JSP Document</title>
    </head>
    <body bgcolor="white">
      <h1>All Request Parameters</h1>

      <ul> 
        <c:forEach items="${paramValues}" var="current"> 
          <li> 
            <c:out value="${current.key}" />:
            <c:forEach items="${current.value}" var="parValue">
              <br/>
              <c:out value="${parValue}" /> 
            </c:forEach>
          </li> 
        </c:forEach> 
      </ul> 

    </body>
  </html>

</jsp:root>

<%@ page language="java" contentType="text/html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<html>
  <head>
    <title>Product Description</title>
  </head>
  <body bgcolor="white">

    <jsp:useBean id="catalog" scope="application"
      class="com.ora.jsp.beans.shopping.CatalogBean"
    />

    <%-- Get the specified ProductBean from the catalog --%>
    <c:set var="product" value="${catalog.productsById[param.id]}" />

    <h1>
      <c:out value="${product.name}" />
    </h1>

    <c:out value="${product.descr}" />

    <p>
    <c:url var="addtocartURL" value="addtocart.jsp">
      <c:param name="id" value="${product.id}" />
    </c:url>
 
    <a href="<c:out value="${addtocartURL}" escapeXml="false" />">
      Add this book to the shopping cart</a>

  </body>
</html>

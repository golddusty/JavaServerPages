<%@ page language="java" contentType="text/html" %>
<%@ taglib prefix="c_rt" uri="http://java.sun.com/jstl/core_rt" %>
<html>
  <head>
    <title>Browser Check</title>
  </head>
  <body bgcolor="white">

    <% String userAgent = request.getHeader("User-Agent"); %>
    <c_rt:choose>
      <c_rt:when test='<%= userAgent.indexOf("MSIE") != -1 %>' >
         You're using Internet Explorer.
      </c_rt:when>
      <c_rt:when test='<%= userAgent.indexOf("Mozilla") != 1 %>' >
         You're probably using Netscape.
      </c_rt:when>
      <c_rt:otherwise>
         You're using a browser I don't know about.
      </c_rt:otherwise>
    </c_rt:choose>

  </body>
</html>

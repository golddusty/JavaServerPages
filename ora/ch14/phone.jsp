<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" 
%><%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" 
%><%@ taglib prefix="ora" uri="orataglib" 
%><ora:ifContains value="${header.Accept}" 
    substring="text/vnd.wap.wml" var="isWMLBrowser" 
/><c:choose><c:when test="${isWMLBrowser}"><ora:setHeader 
  name="Content-Type" value="text/vnd.wap.wml" 
/><c:import url="wml.xsl" var="stylesheet" 
/></c:when><c:otherwise><ora:setHeader name="Content-Type" 
  value="text/html"
/><c:import url="html.xsl" var="stylesheet" 
/></c:otherwise></c:choose><x:transform xslt="${stylesheet}">
  <?xml version="1.0" encoding="ISO-8859-1"?>
  <employees>
    <employee id="123">
      <first-name>Hans</first-name>
      <last-name>Bergsten</last-name>
      <telephone>310-555-1212</telephone>
    </employee>
    <employee id="456">
      <first-name>Bob</first-name>
      <last-name>Eckstein</last-name>
      <telephone>800-555-5678</telephone>
    </employee>
    <employee id="789">
      <first-name>Paula</first-name>
      <last-name>Ferguson</last-name>
      <telephone>213-555-1234</telephone>
    </employee>
  </employees>
</x:transform>

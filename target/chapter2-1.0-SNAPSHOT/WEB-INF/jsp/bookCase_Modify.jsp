<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<%@ page import="com.smart.domain.BookCase" %>
<%@ page import="com.smart.core.ChStr" %>
<html>
<head>
<title>�޸������Ϣ</title>
<meta http-equiv="Content-Type" content="text/html" charset="gb2312">
<link href="${path}/CSS/style.css" rel="stylesheet">
</head>

<body>
<table width="292" height="175" border="0" cellpadding="0" cellspacing="0" background="${path}/Images/subBG.jpg">
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="3%" height="38">&nbsp;</td>
        <td width="94%">&nbsp;</td>
        <td width="3%">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><%
BookCase bookCaseForm=(BookCase)request.getAttribute("bookCaseQueryif");
ChStr chStr=new ChStr();
%>
          <form name="form1" method="post" action="${path}/bookCase/bookCaseModify.html">

    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="50" align="center">            ������ƣ�
            <input name="id" type="hidden" size="50" value="<%=bookCaseForm.getId()%>">
    <input name="name" type="text" value="<%=chStr.toChinese(bookCaseForm.getName())%>"></td>
      </tr>
      <tr>
        <td height="35" align="center"><input name="Submit" type="submit" class="btn_grey" value="����">
&nbsp;
<input name="Submit2" type="reset" class="btn_grey" value="����">
&nbsp;
<input name="Submit3" type="button" class="btn_grey" onClick="window.close()" value="�ر�"></td>
      </tr>
    </table>
          </form></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>

</body>
</html>
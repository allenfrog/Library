<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<c:set scope="page" value="${pageContext.request.contextPath}" var="path"/>
<%@ page import="com.smart.domain.Reader" %>
<%@ page import="com.smart.domain.Borrow" %>
<%@ page import="java.util.*"%>
<html>
<%
Reader readerForm=(Reader)request.getAttribute("readerinfo");
Collection coll=(Collection)request.getAttribute("borrowinfo");
%>
<head>
<title>图书馆管理系统</title>
<link href="${path}/CSS/style.css" rel="stylesheet">
	<script language="javascript">
		function checkreader(form){
			if(form.barcode.value==""){
				alert("请输入读者条形码!");form.barcode.focus();return;
			}
			form.submit();
		}
	</script>
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="100%" height="558"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="27" valign="top" style="padding:5px;" class="word_orange">&nbsp;当前位置：图书借还 &gt; 图书归还 &gt;&gt;&gt;</td>
  </tr>
  <tr>
    <td align="center" valign="top" style="padding:5px;"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="47" background="${path}/Images/borrowBackRenew_back.gif">&nbsp;</td>
      </tr>
      <tr>
        <td height="72" align="center" valign="top" background="${path}/Images/main_booksort_1.gif" bgcolor="#F8BF73"><table width="96%" border="0" cellpadding="1" cellspacing="1" bordercolor="#F8BF73">
          <tr>
            <td valign="top" bgcolor="#F8BF73"><%
int ID=0;
String name="";
String sex="";
String barcode="";
String birthday="";
String paperType="";
String paperNO="";
int number=0;
String typename="";
if(readerForm!=null){
	ID=readerForm.getId().intValue();
	name=chStr.toChinese(readerForm.getName());
	sex=chStr.toChinese(readerForm.getSex());
	barcode=readerForm.getBarcode();
	birthday=readerForm.getBirthday();
	paperType=chStr.toChinese(readerForm.getPaperType());
	paperNO=readerForm.getPaperNO();
	number=readerForm.getNumber();
	typename=chStr.toChinese(readerForm.getTypename());
}
%>
             <form name="form1" method="post" action="${path}/borrow/bookback.html">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
				
                  <tr>
                    <td><table width="90%" height="21" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="24%" height="18" style="padding-left:7px;padding-top:7px;"><img src="${path}/Images/reader_checkbg.jpg" width="142" height="18"></td>
                          <td width="76%" style="padding-top:7px;">读者条形码：
                            <input name="barcode" type="text" id="barcode" value="<%=barcode%>" size="24">
                            &nbsp;
                            <input name="Button" type="button" class="btn_grey" value="确定" onClick="checkreader(form1)"></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="13" align="left" style="padding-left:7px;"><hr width="90%" size="1"></td>
                    </tr>
                  <tr>
                    <td align="center"><table width="96%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td height="27">姓&nbsp;&nbsp;&nbsp;&nbsp;名：
                            <input name="readername" type="text" id="readername" value="<%=name%>"></td>
                          <td>性&nbsp;&nbsp;&nbsp;&nbsp;别：
                            <input name="sex" type="text" id="sex" value="<%=sex%>"></td>
                          <td>读者类型：
                            <input name="readerType" type="text" id="readerType" value="<%=typename%>"></td>
                        </tr>
                        <tr>
                          <td height="27">证件类型：
                            <input name="paperType" type="text" id="paperType" value="<%=paperType%>"></td>
                          <td>证件号码：
                            <input name="paperNo" type="text" id="paperNo" value="<%=paperNO%>"></td>
                          <td>可借数量：
                            <input name="number" type="text" id="number" value="<%=number%>" size="17">
                            册
                            &nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>		 
              </table></form></td>
          </tr>
          <tr>
            <td valign="top"><table width="100%" height="35" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#F6B83B" bgcolor="#FFFFFF">
                <tr align="center" bgcolor="#e3F4F7">
                  <td width="24%" height="25" bgcolor="#FFF9D9">图书名称</td>
                  <td width="12%" bgcolor="#FFF9D9">借阅时间</td>
                  <td width="13%" bgcolor="#FFF9D9">应还时间</td>
                  <td width="14%" bgcolor="#FFF9D9">出版社</td>
                  <td width="12%" bgcolor="#FFF9D9">书架</td>
                  <td bgcolor="#FFF9D9">定价(元)</td>
                  <td width="12%" bgcolor="#FFF9D9"><input name="Button22" type="button" class="btn_grey" value="完成归还" onClick="window.location.href='${path}/book/getbookBackjsp.html'"></td>
                </tr>
                <%
int id=0;
String bookname="";
String borrowTime="";
String backTime="";
Float price=new Float(0);
String pubname="";
String bookcase="";
if(coll!=null && !coll.isEmpty()){
	Iterator it=coll.iterator();
	while(it.hasNext()){
	Borrow borrowForm=(Borrow)it.next();
        id=borrowForm.getId().intValue();
	bookname=chStr.toChinese(borrowForm.getBookName());
	borrowTime=borrowForm.getBorrowTime();
	backTime=borrowForm.getBackTime();
	price=borrowForm.getPrice();
	pubname=chStr.toChinese(borrowForm.getPubName());
	bookcase=chStr.toChinese(borrowForm.getBookcaseName());
%>
                <tr>
                  <td height="25" style="padding:5px;">&nbsp;<%=bookname%></td>
                  <td style="padding:5px;">&nbsp;<%=borrowTime%></td>
                  <td style="padding:5px;">&nbsp;<%=backTime%></td>
                  <td align="center">&nbsp;<%=pubname%></td>
                  <td align="center">&nbsp;<%=bookcase%></td>
                  <td width="13%" align="center">&nbsp;<%=price%></td>
                  <td width="12%" align="center"><a href="${path}/borrow/bookback.html?barcode=<%=barcode%>&id=<%=id%>&operator=<%=chStr.toChinese(manager)%>">归还</a>&nbsp;</td>
                </tr>
                <%	}
}%>
            </table>
			</td>
          </tr>
		 
        </table></td>
      </tr>
      <tr>
        <td height="19" background="${path}/Images/main_booksort_2.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
    <%@ include file="copyright.jsp"%></td>
  </tr>
</table>
</body>
</html>

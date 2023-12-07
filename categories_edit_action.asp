<!--#include file="connection.asp"-->
<%
	cid = Request.Form("cid")
	cname = Request.Form("txtCname")
	cdesc = Request.Form("taCdesc")
	cimage = Request.Form("txtCimage")
	corder = Request.Form("txtCorder")
	cstatus = Request.Form("rdCstatus")

	sql = "UPDATE category SET cname='" & cname & "',cdesc='" & cdesc & "',cimage='" & cimage & "',corder=" & corder & ",cstatus=" & cstatus & " where cid = " & cid 
	conn.execute sql 
	conn.close

	session("categories_error") = "Cập nhật thành công!"
	Response.Redirect("category.asp")
%>
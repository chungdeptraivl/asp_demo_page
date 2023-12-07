<!--#include file="connection.asp"-->
<html>
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<%
			TenDangNhap=Request.Form("txtTenDangNhap")
			MatKhau = Request.Form("txtMatKhau")
			sql = "select * from [user] where [username]='" & TenDangNhap & "' and [password]='" & MatKhau &"'"
			rs.open sql, conn 
			a = rs("username")
			if (not rs.eof) then 
				Session("login") = true
				Session("TenDangNhap1") = a 
				Session("loi_dangnhap") = ""
			else 
				Session("login") = false
				Session("TenDangNhap1") = ""
				Session("loi_dangnhap") = "Thông tin đăng nhập bị sai"
			end if
			if (Session("login")= true) then
			'Response.write(Session("TenDangNhap"))
				Response.Redirect("admin.asp")
			else 
				Response.Redirect("login.asp")
			end if 
			rs.close 
			conn.close 
		%>
	</body>
</html>
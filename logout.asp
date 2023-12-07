<html>
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<%
			Session("login")=false
			Session("loi_dangnhap")="Bạn vừa đăng xuất khỏi hệ thống!"
			Session("TenDangNhap") = ""
			Response.Redirect("login.asp")
		%>
	</body>
</html>
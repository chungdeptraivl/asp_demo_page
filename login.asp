<html>
    <head>
        <meta charset="utf-8">
    </head>

    <body>
        <form name=f action="login_action.asp" method=POST>
			<h1 align=center>Đăng nhập vào hệ thống</h1>
			<table border = 0 align=center width=500>
				<tr>
					<td colspan=2 align=center>
						<font color=red><%=Session("loi_dangnhap")%></font>
					</td>
				</tr>
				<tr>
					<td>Tên đăng nhập:</td>
					<td><input type=text name=txtTenDangNhap></td>
				</tr>
				<tr>
					<td>Mật khẩu:</td>
					<td><input type=password name=txtMatKhau></td>
				</tr>
				<tr>
					<td align=right><input type=submit name=cmdGuiDi value="Đăng nhập"></td>
					<td><input type=reset value="Làm lại">
						<input type=hidden name=cmdKey value="3323535335325">
					</td>
					
				</tr>
			</table>
		</form>
    </body>
</html>
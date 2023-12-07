<!--#include file="connection.asp"-->
<%
	cid = Request.Querystring("cid")
	sql = "SELECT * FROM category WHERE cid = " & cid
	rs.open sql, conn 
	if (rs.eof) then
		session("categories_error")="Dữ liệu không tồn tại!"
		Response.Redirect("category.asp")
	else
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title><style>
			nav {
				width: 100%;
				height: 40px;
				background-color: antiquewhite;
				display: flex;
				align-items: center;
				justify-content: flex-start;
			}

			a {
				text-decoration: none;
				color: black;
				font-weight: bold;
			}

			.products, .categories {
				margin-right: 20px;
			}

			.products:hover, .categories:hover {
				color: rgb(134, 134, 134);
			}

			.wrapper {
				width: 100%;
				background: #ccc;
			}

			.wrapper > .content {
				width: 100%;
			}

            .addForm {
                padding: 40px;
                background: #ddd;

            }
		</style>
	</head>
	<body>
		<%
			if (Session("login") = false) then
				Session("loi_dangnhap") = "Bạn phải đăng nhập mới vào được trang này!"
				Response.Redirect("login.asp")
			else
		%>
		<h4 align=right>Chào mừng bạn: <% Response.write(Session("TenDangNhap1"))%>
			<button style="margin-left: 16px"> 
				<a href="logout.asp">Đăng xuất</a>
			</button>
		</h4>
		<%
		    end if 
		%>

        <header>
			<nav>
				<a href="/product.asp" class="products">Trang sản phẩm</a>
				<a href="/category.asp" class="categories">Trang loại sản phẩm</a>
			</nav>
		</header>
		<div class="wrapper">
			<div class="addForm">
                <h1 align=center>Sửa nhóm sản phẩm</h1>
                <center>
                    <font color=red>
                        <%=Session("categories_edit_error")%>
                    </font>
                </center>
                <form action="categories_edit_action.asp" method=POST>
                <table border=0 cellspacing=5 cellpadding=5 align=center>
                    <tr>
                        <td>Tên nhóm:</td>
                        <td><input type=text name=txtCname value="<%=rs("cname")%>"></td>
                    </tr>
                    <tr>
                        <td>Mô tả:</td>
                        <td><textarea cols=20 rows=6 name=taCdesc><%=rs("cdesc")%></textarea></td>
                    </tr>
                    <tr>
                        <td>Ảnh:</td>
                        <td>
                        <input type=text name=txtCimage value="<%=rs("cimage")%>">
                        <br><img src="images/<%=rs("cimage")%>" width=120>	
                        </td>
                    </tr>
                    <tr>
                        <td>Thứ tự sắp xếp:</td>
                        <td><input type=text name=txtCorder value="<%=rs("corder")%>"></td>
                    </tr>
                    <tr>
                        <td>Trạng thái:</td>
                        <td>
                            <input type=radio name=rdCstatus value=1 <% if (rs("cstatus")=1) then response.write(" checked")%>>Hoạt động
                            <Input type=radio name=rdCstatus value=0 <% if (rs("cstatus")=0) then response.write(" checked")%>>Ngừng hoạt động
                        </td>
                    </tr>
                    <tr>
                        <td align=right><input type=submit value="Cập nhật">
                        <input type=hidden value="<%=rs("cid")%>" name="cid">
                        </td>
                        <td><input type=reset value="Hủy bỏ"></td>
                    </tr>
                </table>
                </form>
            </div>
        </div>
	</body>
	<%
		end if 
		rs.close
		conn.close 
	%>
</html>
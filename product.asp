<!-- #include file = "connection.asp" -->

<%
    rs.cursorLocation = 3
    rs.pagesize = 3 ' Thiết lập kích thước trang là 3 sản phẩm

    str = Request("txtSearch")

    sql = "SELECT product.*, category.cname FROM product, category WHERE product.cid = category.cid"
    if str <> "" then
        sql = sql & " AND pname LIKE '%" & str & "%'"
    end if

    rs.open sql, conn

    pagecount = rs.pagecount 
    p = CInt(Request("page"))
    if (p<1) then
        p = 1
    end if 
    if (p>pagecount) then 
        p = pagecount 
    end if
    rs.absolutepage = p 
%>

<html>
	<head>
		<meta charset="utf-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

		<style>
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
				padding: 40px 0 40px 0;
			}

			.wrapper > .content {
				width: 100%;
			}

			table, th, td {
                background: #fff;
                border: 1px solid black;
                border-collapse: collapse;
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
			<h1 align=center>Danh sách các sản phẩm trong hệ thống</h1>
			<center>
				<font color=red><%=Session("product_error")%>
			</center>
			<br>
			<div style="display: flex; justify-content: space-around">
				<button style="margin: 0 0 10px 10px; padding: 4px">
					<a href="product_add.asp">Thêm mới sản phẩm</a>
				</button>
				<form action="" method=POST>
					Nhập tên sp cần tìm:
					<input type=text size=50 name=txtSearch value="<%=str%>" style="padding: 8px">
					<input type=submit name=cmd value="Tìm kiếm" style="padding: 8px">
				</form>
			</div>
			<table border=1 cellspacing=5 cellpadding=5 align=center style="width: 100%">
				<tr>
					<th>Mã sản phẩm</th>
					<th>Tên sản phẩm </th>
					<th>Mô tả</th>
					<th>Ảnh</th>
					<th>Giá tiền</th>
					<th>Số lượng</th>
					<th>Nhóm sản phẩm</th>
					<th>Trạng thái</th>
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
				<%
				if (rs.eof) then
					response.write("<tr><td colspan=7>Tập dữ liệu rỗng!</td></tr>")
				else
					while not rs.eof 
				%>
					<tr>
						<td><%=rs("pid")%></td>
						<td><%=rs("pname")%></td>
						<td><%=rs("pdesc")%></td>
						<td><img src="images/<%=rs("pimage")%>" width=200></td>
						<td><%=rs("pprice")%></td>
						<td><%=rs("pquantity")%></td>
						<td><%=rs("cname")%></td>
						<td>
							<%
								if (rs("pstatus")=1) then
									response.write("Hoạt động")
								else 
									response.write("Ngừng hoạt động")
								end if 
							%>
						</td>
						<td>
							<center>
								<a href="product_edit.asp?pid=<%=rs("pid")%>">
									<i class="fa-solid fa-pen-to-square"></i>
								</a>
							</center>
						</td>
						<td>
							<center>
								<a onclick="return confirm('Bạn có chắc muốn xoá <%=rs("pname")%> hay ko?');"  href="product_delete.asp?pid=<%=rs("pid")%>">
									<i class="fa-solid fa-trash"></i>
								</a>
							</center>
						</td>
					</tr>
				<%
					rs.movenext
				wend
				end if
				%>
			</table>

			 <center>
                <%
                    for i = 1 to pagecount
                        if (i=p) then
                            response.write(" " & i & " ")
                        else 
                            response.write(" <a href=?page=" & i & "&txtSearch=" & Server.URLEncode(str) & ">" & i & "</a> ")
                        end if 
                    next 
                %>
            </center>
		</div>
	</body>
</html>

<%
	rs.close
	conn.close 
%>
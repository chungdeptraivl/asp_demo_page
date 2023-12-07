<!--#include file="connection.asp"-->
<%
	'lấy dữ liệu sắp xếp theo corder giảm dần
	sql = "select * from category order by corder desc"
	rs.open sql, conn 
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
				background: #ddd;
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
			<h1 align=center>Danh mục nhóm sản phẩm</h1>
		    <center>
                <font color=red>
                    <%=Session("categories_error")%>
                </font>
		
                <br>
            </center>
            <button style="margin: 0 0 10px 10px; padding: 4px">
                <a href="categories_add.asp">Thêm mới một danh mục</a>
            </button>
            <table border=1 cellspacing=5 cellpadding=5 align=center class="content">
                <tr>
                    <th>Mã</th>
                    <th>Tên</th>
                    <th>Mô tả</th>
                    <th>Ảnh</th>
                    <th>Sắp xếp</th>
                    <th>Trạng thái</th>
                    <th>Sửa</th>
                    <th>Xóa</th>
                </tr>
                <%
                    if (rs.eof) then
                        response.write("<tr><td colspan=6>Bảng không có dữ liệu!</td></tr>")
                    else 
                        while not rs.eof 
                        %>
                            <tr>
                                <td><%=rs("cid")%></td>
                                <td><%=rs("cname")%></td>
                                <td><%=rs("cdesc")%></td>
                                <td><img src="images/<%=rs("cimage")%>" width=200></td>
                                <td><%=rs("corder")%></td>
                                <td>
                                    <% if (rs("cstatus")=0) then
                                            response.write("Ngừng hoạt động")
                                       else 
                                            response.write("Hoạt động")
                                       end if 
                                    %>
                                </td>
                                <td>
                                    <center>
                                        <a href="categories_edit.asp?cid=<%=rs("cid")%>">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </a>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <a href="categories_delete.asp?cid=<%=rs("cid")%>">
                                            <i class="fa-solid fa-trash"></i>
                                        </a>
                                    </center>
                                </td>
                        <%		
                        rs.movenext
                        wend 
                    end if
                    rs.close 
                    conn.close 
                %>
            </table>
        </div>
	</body>
</html>
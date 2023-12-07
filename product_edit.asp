<!--#include file="connection.asp"-->
<%
	pid = Request.QueryString("pid")
	sql = "SELECT * FROM product WHERE pid = " & pid
	rs1.open sql, conn 
	if (rs1.eof) then
		session("product_error")="Dữ liệu không tồn tại!"
		Response.Redirect("product.asp")
	else  
	rs.open "SELECT * FROM category", conn 
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
                <h1 align=center>Sửa một sản phẩm</h1>
                <center>
                    <font color=red><%=Session("product_edit_error")%></font>
                </center>
                <form method=POST action="product_edit_action.asp?pid=<%=pid%>">
                    <table border=0 align=center width=400>
                        <tr>
                            <td>Tên sản phẩm:</td>
                            <td><input style="width:180px" type=text name=txtPname value="<%=rs1("pname")%>"></td>
                        </tr>
                        <tr>
                            <td>Mô tả:</td>
                            <td><textarea cols=20 style="width:180px" rows=6 name=taPdesc><%=rs1("pdesc")%></textarea></td>
                        </tr>
                        <tr>
                            <td>Ảnh:</td>
                            <td><input type=text  style="width:180px" name=txtPimage  value="<%=rs1("pimage")%>"></td>
                        </tr>
                        <tr>
                            <td>Giá:</td>
                            <td><input type=text style="width:180px" name=txtPprice  value="<%=rs1("pprice")%>"></td>
                        </tr>
                        <tr>
                            <td>Số lượng:</td>
                            <td><input type=text style="width:180px" name=txtPquantity value="<%=rs1("pquantity")%>"></td>
                        </tr>
                        <tr>
                            <td>Danh mục:</td>
                            <td>
                                <select name=slCid>
                                    <% while not rs.eof 
                                    %>
                                        <option value="<%=rs("cid")%>"
                                        <% if rs1("cid")=rs("cid") then	
                                            response.write(" selected ")
                                            end if 
                                        %>
                                        ><%=rs("cname")%></option>
                                    <%
                                        rs.movenext
                                        wend
                                        rs.close
                                        
                                    %>
                                </select>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>Trạng thái:</td>
                            <td><input type=radio
                                <% if (rs1("pstatus")=1) then 
                                    response.write(" checked ")
                                    end if 
                                %>
                                    name=rdPstatus value=1>Hoạt động
                                <input type=radio
                                <% if (rs1("pstatus")=0) then 
                                    response.write(" checked ")
                                    end if 
                                %>
                                name=rdPstatus value=0>Ngừng Hoạt động
                            </td>
                        </tr>
                        <tr>
                            <td align=right><input type=submit value="Cập nhật"></td>
                            <td><input type=reset value="Làm lại">
                        </tr>
                    </table>
                </form>
            </div>
        </div>
	</body>
</html>

<%
	end if 
	Session("product_edit_error")=""
	conn.close
%>
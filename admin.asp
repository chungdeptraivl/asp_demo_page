<html>
	<head>
		<meta charset="utf-8">

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
			}

			.wrapper > .content {
				width: 100%;
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
			<img src="https://golookexplore.com/wp-content/uploads/2020/05/swiss-oldest-town-1450572_1280.jpg" class="content"/>
		</div>
	</body>
</html>
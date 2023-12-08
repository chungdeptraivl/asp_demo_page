<!--#include file="connection.asp"-->
<%
	rs0.open "select * from configuration where configname='categories_default'", conn 
	rs.open "select * from category", conn 
	cid = Request("cid")
	if (cid="") then
		cid = rs0("configvalue")
	end if 
	rs1.open "select a.*,b.cname from product a, category b  where a.cid=b.cid and a.cid=" & cid , conn 
	
%>
<html>
	<head>
		<meta charset="utf-8">
		<style style="text/css">
			.title-box-pro-home {
				overflow: hidden;
				margin-bottom: 5px;
				border-bottom: solid 2px #333;
				height: 36px;
				background: #4471c2;
			}
			.title-box-pro-home .h-title {
				float: left;
				background: #e00;
				color: #fff;
				font-size: 16px;
				line-height: 34px;
				padding: 0 15px;
				position: relative;
				padding-right: 8px;
			}
			.h-title {
				margin: 0;
				padding: 0;
			}
			.title-box-pro-home .list-sub {
				float: left;
				margin-top: 11px;
				margin-left: 30px;
				font-weight: bold;
			}
			.title-box-pro-home .list-sub a:first-child {
				border: none;
			}
			.title-box-pro-home .list-sub a {
				border-left: solid 1px #ccc;
				padding: 0 8px;
				color: white;
			}
			a {
				color: #333;
				text-decoration: none;
			}
			.product-list li {
				min-height: 370px!important;
			}
			.product-list li {
				position: relative;
				cursor: pointer;
				background: #fff;
				overflow: hidden;
				float: left;
				width: 18%;
				border-right: solid 1px #ddd;
				border-bottom: solid 1px #ddd;
			}
			.product-list li .p-container {
				padding: 8px;
			}
			.p-container {
				padding: 15px;
				overflow: hidden;
			}
			.p-oldprice2 i, .p-price2 i {
				font-size: 12px;
				font-weight: normal;
			}

			.p-oldprice2 i, .p-price2 i {
				font-size: 12px;
				font-weight: normal;
			
			.p-bottom {
				display: block;
				margin-top: 8px;
				overflow: hidden;
				height: 18px;
			}
			.btn-cart-stop {
				color: #d42333;
				background: url('images/icon_addcart_new.jpg') left 1px no-repeat;
				padding-left: 17px;
				font-size: 13px;
				float: right;
			}
			.ul {
				padding: 0;
				margin: 0;
				list-style: none;
			}
		</style>
	</head>
	<body>
		<div class="box-pro-home js-product-category-home loaded" data-id="1144" data-holder="#product-list-home1144" data-cat="boxcat1144">
            <div class="title-box-pro-home">
                
                <a href="?cid=<%=rs("cid")%>"><h2 class="h-title"><%=rs("cname")%></h2></a>
                
                <div class="list-sub">
                    <%
						rs.movenext
						while not rs.eof 
					%> 
                    <a href="?cid=<%=rs("cid")%>"><%=rs("cname")%></a>
					<%
						rs.movenext
					 	wend
						rs.close
					%>
                </div>
			</div>
            <div class="clear"></div>
			<%
				if (rs1.eof) then 
				 response.write("<br>Không có sản phẩm theo nhóm. Vui lòng chọn nhóm khác!")
				else 
					 
			%>
            <ul class="ul product-list  apple-product  product-list-full" id="product-list-home1144" style="min-height:200px;display: flex;flex-wrap: wrap;">
				<%
					while not rs1.eof
				%>
				<li onclick="" class="p-item-group">
				<div class="p-container">
				<a href="product_detail.asp?pid=<%=rs1("pid")%>" class="p-img"><img src="images/<%=rs1("pimage")%>" alt="" width="200px"></a>
				<a href="product_detail.asp?pid=<%=rs1("pid")%>" class="p-name">
					<%=rs1("pname")%>	
				</a>
				<br>
				<span class="p-oldprice2"></span>
				<span class="p-price2"><i>Giá bán:</i><%=rs1("pprice")%>₫</span>
				<span class="p-bottom"><span style="color: #12bd1b;"><%
					if (rs1("pquantity")>0) then 
					%>✔ Có hàng
					<%
					else 
						response.write("Hết hàng")
					end if 
					%>
				</span>
				<a href="" class="btn-cart-stop">Giỏ hàng</a></span>
				</div>
				</li>
			<%
				rs1.movenext
				wend 
				rs1.close
				end if 
			%>
			
			</ul>
            <div class="clear"></div>
        </div>
	</body>
</html>
<%
	conn.close
%>
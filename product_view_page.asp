<!--#include file="connection.asp"-->
<%
	rs.cursorLocation = 3
	rs.pagesize = 1 
	sql = "select a.*,b.cname from product a, categories b where a.cid = b.cid"
	rs.open sql, conn 'lấy dữ liệu
	pagecount = rs.pagecount 
	p = Cint(Request("page"))
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
	</head>
	<body>
		<h1 align=center>Danh sách sản phẩm có phân trang</h1>
		<table align=center border=1 width=100%>
			<tr>
				<th>Mã</th>
				<th>Tên</th>
				<th>Ảnh</th>
				<th>Đơn giá</th>
				<th>Số lượng</th>
				<th>Tên nhóm</th>
				<th>Chi tiết</th>
			</tr>
			<%
				while not rs.eof and rs.absolutepage=p
				%>
				<tr>
					<td><%=rs("pid")%></td>
					<td><%=rs("pname")%></td>
					<td><img src="images/<%=rs("pimage")%>" width=150></td>
					<td><%=rs("pprice")%></td>
					<td><%=rs("pquantity")%></td>
					<td><%=rs("cname")%></td>
					<td><a href="product_detail.asp?pid=<%=rs("pid")%>">Chi tiết</a></td>
				</tr>
			<%
					rs.movenext
				wend 
			%>
		</table>
		<center>
			<%
				for i = 1 to pagecount
					if (i=p) then
						response.write(" " & i & " ")
					else 
						response.write(" <a href=?page=" & i & ">" & i & "</a> ")
					end if 
					
				next 
			%>
		</center>
	</body>
</html>
<%
	rs.close
	conn.close 
%>
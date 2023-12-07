<!--#include file="connection.asp"-->
<%
	pname=Request.Form("txtPname")
	pdesc=Request.Form("taPdesc")
	pimage=Request.Form("txtPimage")
	cid=Request.Form("slCid")
	pprice = Request.Form("txtPprice")
	pquantity = Request.Form("txtPquantity")
	pstatus=Request.Form("rdPstatus")

	'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
	sql="SELECT * FROM product WHERE pname='" & pname &"'"
	rs.open sql, conn 
	if (not rs.eof) then
		Session("product_add_error")="Tên sản phẩm: " & pname &" đã có rồi!"
		Response.Redirect("product_add.asp")	
    else 
		sql = "INSERT INTO product(pname, pdesc, pimage, cid, pstatus, pprice, pquantity) values ('" & pname & "','" & pdesc & "','" & pimage & "'," & cid & "," & pstatus & "," &pprice & "," & pquantity & ")"
		'Response.write(sql)
		conn.execute sql 
		
		Session("product_add_error")=""
		Session("product_error")="Thêm mới thành công"
		Response.Redirect("product.asp")
	end if		
	rs.close
    conn.close
%>
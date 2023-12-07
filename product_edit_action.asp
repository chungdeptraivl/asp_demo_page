<!--#include file="connection.asp"-->
<%
	pid = Request.QueryString("pid")
	pname=Request.Form("txtPname")
	pdesc=Request.Form("taPdesc")
	pimage=Request.Form("txtPimage")
	cid=Request.Form("slCid")
	pprice = Request.Form("txtPprice")
	pquantity = Request.Form("txtPquantity")
	pstatus=Request.Form("rdPstatus")

	'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
	sql="SELECT * FROM product WHERE pname='" & pname &"' and pid<>" & pid 
	rs.open sql, conn 
	if (not rs.eof) then
		Session("product_edit_error")="Tên sản phẩm: " & pname &" đã có rồi!"
		Response.Redirect("product_edit.asp")	
    else 
		sql = "UPDATE product SET pname='" & pname & "',pdesc='" & pdesc & "',pimage ='" & pimage & "',pprice = " & pprice & ",pquantity = " & pquantity & ",cid = " & cid & ",pstatus = " & pstatus & " where pid = " & pid 
		'Response.write(sql)
		conn.execute sql 
		Session("product_edit_error")=""
		Session("product_error")="Cập nhật thành công"
		Response.Redirect("product.asp")
	end if		
	rs.close
    conn.close
%>
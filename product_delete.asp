<!-- #include file = "connection.asp" -->

<%

    pid = Request.QueryString("pid")

    sql = "DELETE FROM product WHERE pid = " & pid
    conn.execute sql

    Session("product_error") = "Xóa thành công!"
    Response.Redirect("product.asp")

    conn.close
%>
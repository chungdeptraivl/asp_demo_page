<!-- #include file = "connection.asp" -->

<%

    cid = Request.QueryString("cid")

    sql = "DELETE FROM category WHERE cid =" & cid
    conn.execute sql
    conn.close

    Session("categories_error") = "Xóa thành công!"
    Response.Redirect("category.asp")

%>
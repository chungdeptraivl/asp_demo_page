<!--#include file = "connection.asp" -->
<% 

    cname = Request.Form("txtCname")
    cdesc = Request.Form("taCdesc")
    cimage = Request.Form("txtCimage")
    corder = Request.Form("txtCorder")
    cstatus = Request.Form("rdCstatus")

    sql = "SELECT * FROM category WHERE cname like '"& cname &"'"
    rs.open sql, conn

    if(not rs.eof) then 
        Session("categories_add_error") = "Danh mục " & canme & " đã tồn tại!!"
        Response.Redirect("categories_add.asp")
    else 
        sql = "INSERT INTO category (cname, cdesc, cimage, corder, cstatus) VALUES ('"& cname &"', '"& cdesc &"', '"& cimage &"', '"& corder &"', '"& cstatus &"')"
        conn.execute sql

        Session("categories_error") = "Thêm mới thành công"
        Response.Redirect("category.asp")
    end if
    rs.close
    conn.close
%>
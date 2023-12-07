<%
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")

Dim rs, rs1, rs2
Set rs = Server.CreateObject("ADODB.Recordset")
Set rs1 = Server.CreateObject("ADODB.Recordset")
Set rs2 = Server.CreateObject("ADODB.Recordset")

' Thay đổi thông tin kết nối đến SQL Server
Dim strconn
strconn = "Provider=SQLOLEDB;Server=.\SQLEXPRESS;Database=asp;Trusted_Connection=yes;"

conn.open strconn ' Mở kết nối đến SQL Server

' Đoạn mã SQL bạn cần thực hiện
'sql = "INSERT INTO Categories(cname, cimage, cdesc, corder, cstatus) VALUES ('Samsun','samsung.jpg','Hãng điện thoại được ưa chuộng thứ hai hiện nay',2,1)" 
'sql = "DELETE FROM Categories WHERE cid > 2"
'conn.execute sql ' Thực hiện insert hoặc delete

' Đóng kết nối sau khi sử dụng xong
'conn.close
%>

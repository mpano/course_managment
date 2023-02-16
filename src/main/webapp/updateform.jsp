<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>registration update</title>
</head>
<body>
<h2>update form</h2><br><br><br><br><br><br>
<%
    String code=request.getParameter("code");
    DriverManager.registerDriver(new org.postgresql.Driver());
    Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/student","postgres","Akim@123");
    Statement statement=connection.createStatement();
    ResultSet resultSet=statement.executeQuery("SELECT * from cource where code='"+code+"'");
    while (resultSet.next()){
        String coursecode=resultSet.getString(1);
        String name=resultSet.getString(2);
        String credit=resultSet.getString(3);


%>

<form action="update.jsp" method="post">
    <label>Enter the coursecode</label>
    <input type="text" readonly name="coursecode" value="<%=coursecode%>" />
    <br><br>
    <label>Enter the course Name</label>
    <input type="text" name="name" value="<%=name%>" />
    <br><br>
    <label>Enter the course credit</label>
    <input type="text" name="credit" value="<%=credit%>" />
    <br><br>
    <input type="submit" value="submit">

</form>
<%
    }
%>

</body>
</html>
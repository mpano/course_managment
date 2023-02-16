<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>

<%
    try {
    String code=request.getParameter("coursecode");
    String name=request.getParameter("name");
   // String credit=request.getParameter("credit");

    int credit=Integer.parseInt(request.getParameter("credit"));


    DriverManager.registerDriver(new org.postgresql.Driver());
    Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/student","postgres","Akim@123");
    Statement statement=connection.createStatement();
    String query="INSERT INTO cource values ('"+code+"','"+name+"','"+credit+"')";
    statement.execute(query);
    connection.close();

    out.println("<h1>course name:  "+name+" have saved successfully</h1>");

    }catch (Exception ex){
        out.println("<h1>samething wrong </h1>");
    }

%>
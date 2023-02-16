<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%
    try {
    String ccode =request.getParameter("coursecode");
    String name=request.getParameter("name");
    //String credit=request.getParameter("credit");
        int credit=Integer.parseInt(request.getParameter("credit"));
    DriverManager.registerDriver(new org.postgresql.Driver());
    Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/student","postgres","Akim@123");
    Statement statement=connection.createStatement();
    String qy="update cource set name='"+name+"', credits='"+credit+"' where code='"+ccode+"' ";
    statement.execute(qy);
    connection.close();

    String message="<h1> you have update "+name+" successfully </h1>";
    application.setAttribute("actionmsg",message);

   }catch (Exception e){
        out.println("<h1> samething wrong</h1>"+e.getMessage());
   }

%>

<jsp:forward page="index.jsp"></jsp:forward>
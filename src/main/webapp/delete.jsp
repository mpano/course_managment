<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>

<%
try {

    String ccode = request.getParameter("code");
    String name=request.getParameter("name");
    String credit=request.getParameter("credit");
    DriverManager.registerDriver(new org.postgresql.Driver());
    Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost", "postgres", "Akim@123");
    Statement statement = connection.createStatement();
    String qly = "delete from cource where code='"+ccode+"'";
    statement.execute(qly);
    connection.close();

    String message="<h1> you have deleted course:  "+name+" successfully </h1>";
    application.setAttribute("actionmsg",message);


}catch (Exception e){
     out.println("<h1> ooops samething wrong </h1>"+e.getMessage());

}

%>

<jsp:forward page="index.jsp"></jsp:forward>
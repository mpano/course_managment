<%@ page import="java.sql.*" %>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
<h2>Hello World!</h2>

<h3><a href="registrarcourses.html">add course</a></h3>
<table class="table">
    <thead class="thead-dark">
    <tr>
        <th>cource code</th>
        <th>course name</th>
        <th>creadits</th>
        <th>Action</th>
    </tr>
    </thead>
<%


        DriverManager.registerDriver(new org.postgresql.Driver());
        Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/student","postgres","Akim@123");
        Statement statement=connection.createStatement();
        ResultSet resultSet=statement.executeQuery("select * from cource");
        while (resultSet.next()){
            String code=resultSet.getString(1);
            String name=resultSet.getString(2);
            String credit=resultSet.getString(3);
            %>
    <tbody>
    <tr>
        <td><%=code%></td>
        <td><%=name%></td>
        <td><%=credit%></td>
        <td>
            <a href="updateform.jsp?code=<%=code%>">update</a> &nbsp;&nbsp;
            <a href="deletecourse.jsp?code=<%=code%>">delete</a>
            <!--   <form action="delete.jsp" method="post">
               <input type="hidden" value="<%=code%>" name="code"   />
                <input type="submit" value="delete">
            </form>  -->
        </td>

    </tr>
    </tbody>
       <%
           }
       %>

</table>
</body>
</html>

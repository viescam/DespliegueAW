<%-- 
    Document   : conexion
    Created on : 10-oct-2016, 12:18:43
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>

<html>
    <body>
        <%
            String nombre=""; 
            int id=0;
            try{
                Connection con;

                PreparedStatement st;

                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String urlBBDD = "jdbc:mysql://localhost:3306/spacex";
                con = (java.sql.DriverManager.getConnection(urlBBDD,"root","root"));


                st=con.prepareStatement("SELECT * FROM cohetes");
                ResultSet rs = st.executeQuery();
                rs.next();
                id=rs.getInt("idCohete");
                nombre=rs.getString("nombre");

                }
            catch(SQLException e){
                //throw new RuntimeException(e);
            }
        %>
        <%=id%>
        <%=nombre%>
    </body>
</html>

<%-- 
    Document   : conexion
    Created on : 10-oct-2016, 12:18:43
    Author     : alumno
--%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection conexion = null;
            ResultSet rs;
            String url = "jdbc/spacex",
                    sql = "SELECT * FROM cohetes WHERE idCohete = 1;",
                    nombrecohete = "";
            int idcohete = 0;
            PreparedStatement ps;

            try {
                InitialContext initCtx = new InitialContext();;
                Context envCtx = (Context) initCtx.lookup("java:comp/env");
                DataSource dataSource = (DataSource) envCtx.lookup(url);
                conexion = dataSource.getConnection();
//                Class.forName("com.mysql.jdbc.Driver").newInstance();
//                conexion = DriverManager.getConnection(url, user, password);
                ps = conexion.prepareStatement(sql);
                rs = ps.executeQuery();
                rs.next();
                idcohete = rs.getInt("idCohete");
                nombrecohete = rs.getString("nombre");
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            } finally {
                conexion.close();
            }
        %>
        <%=idcohete%>
        <%=nombrecohete%>
    </body>
</html>

<%-- 
    Document   : conexion
    Created on : 10-oct-2016, 12:18:43
    Author     : alumno
--%>

<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <body>
        <%  
            InitialContext initCtx=new InitialContext();;
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource dataSource = (DataSource)envCtx.lookup("jdbc/spacex");
            
            String nombre=""; 
            int id=0;
            Connection con=null;
            try{
                con=dataSource.getConnection(); 
                //Usar la conexión
 
                

                PreparedStatement st;

                /*Class.forName("com.mysql.jdbc.Driver").newInstance();
                String urlBBDD = "jdbc:mysql://localhost:3306/spacex";
                con = dataSource.getConnection(urlBBDD,"root","root");*/


                st=con.prepareStatement("SELECT * FROM cohetes");
                ResultSet rs = st.executeQuery();
                rs.next();
                id=rs.getInt("idCohete");
                nombre=rs.getString("nombre");

                }
            catch(SQLException e){
                //throw new RuntimeException(e);
            }
            finally{
                con.close();
            }
        %>
        <%=id%>
        <%=nombre%>
    </body>
</html>

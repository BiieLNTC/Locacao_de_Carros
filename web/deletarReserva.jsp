<%@ page contentType="text/html; charset=UTF-8" %>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.conexao"%>

<<html>
    <head>
        <title>title</title>
    </head>
    <body onload="excluiu()">

    </body>
</html>


<%

    String id = request.getParameter("idReservaDelete");

    Statement st = null;
    ResultSet rs = null;
    ResultSet rc = null;
    PreparedStatement ps = null;

    try {

        st = new conexao().conectar().createStatement();

        String sql = "DELETE FROM reservas WHERE Id = ?";
        ps = new conexao().conectar().prepareStatement(sql);
        ps.setString(1, id);
        
        ps.executeUpdate();

    } catch (Exception e) {
        out.println("Erro durante a conexão com o banco de dados: " + e.getMessage());
    }

    response.sendRedirect("area.jsp");
%>

<script>
    function caiu()
    {
        alert("Reserva deletada!");
    }
</script>
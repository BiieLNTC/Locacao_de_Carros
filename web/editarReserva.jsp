<%@ page contentType="text/html; charset=UTF-8" %>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.conexao"%>

<html>
    <head>
        <title>title</title>
    </head>
    <body onload="editou()">

    </body>
</html>

<%
    String id = request.getParameter("idReserva");
    String localRetirada = request.getParameter("local-retirada-edit");
    String dataRetirada = request.getParameter("data-retirada-edit");
    String horaRetirada = request.getParameter("hora-retirada-edit");
    String localDevolucao = request.getParameter("local-devolucao-edit");
    String dataDevolucao = request.getParameter("data-devolucao-edit");
    String horaDevolucao = request.getParameter("hora-devolucao-edit");
    String categoria = request.getParameter("grupo-edit");  

    Statement st = null;
    ResultSet rs = null;
    ResultSet rc = null;
    PreparedStatement ps = null;

    try {

        st = new conexao().conectar().createStatement();

        String sql = "UPDATE reservas SET Categoria = ?, LocalRetirada = ?, DataRetirada = ?, HoraRetirada = ?,LocalDevolucao = ?, DataDevolucao =?, HoraDevolucao = ? WHERE Id = ?";
        ps = new conexao().conectar().prepareStatement(sql);
        ps.setString(1, categoria);
        ps.setString(2, localRetirada);
        ps.setString(3, dataRetirada);
        ps.setString(4, horaRetirada);
        ps.setString(5, localDevolucao);
        ps.setString(6, dataDevolucao);
        ps.setString(7, horaDevolucao);
        ps.setString(8, id);

        ps.executeUpdate();

    } catch (Exception e) {
        out.println("Erro durante a conexão com o banco de dados: " + e.getMessage());
    }

    response.sendRedirect("area.jsp");
%>

<script>
    function editou()
    {
        alert("Reserva editada!");
    }
</script>
%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.conexao"%>

<%
    Statement st = null;
    ResultSet rs = null;
    ResultSet rc = null;
    PreparedStatement ps = null;

    String localRetirada = request.getParameter("local-retirada");
    String dataRetirada = request.getParameter("data-retirada");
    String horaRetirada = request.getParameter("hora-retirada");
    String localDevolucao = request.getParameter("local-devolucao");
    String dataDevolucao = request.getParameter("data-devolucao");
    String horaDevolucao = request.getParameter("hora-devolucao");
    String grupoCarro = request.getParameter("grupo-carro");

    String valorTotalReservaValue = request.getParameter("valorTotalReserva");
    Double valorTotalReserva = Double.parseDouble(valorTotalReservaValue);

    String protecaoValue = request.getParameter("protecao");
    boolean protecao = Boolean.parseBoolean(protecaoValue);

    String protecaocValue = request.getParameter("protecaoC");
    boolean protecaoC = Boolean.parseBoolean(protecaocValue);

    String coberturaTerceiroValue = request.getParameter("coberturaTerceiro");
    boolean coberturaTerceiro = Boolean.parseBoolean(coberturaTerceiroValue);

    String condutorValue = request.getParameter("condutor");
    boolean condutor = Boolean.parseBoolean(condutorValue);

    try {

        st = new conexao().conectar().createStatement();

        String IdUsuario = (String) session.getAttribute("IdUsuario");

        String sql = "INSERT INTO reservas (IdCliente, Categoria, Valor, LocalRetirada, DataRetirada, HoraRetirada, LocalDevolucao, DataDevolucao, HoraDevolucao, Protecao, ProtecaoCompleta, CoberturaTerceiros, CondutorJovem) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        ps = new conexao().conectar().prepareStatement(sql);

        // Define os valores dos parâmetros na instrução SQL
        ps.setString(1, IdUsuario);
        ps.setString(2, grupoCarro);
        ps.setDouble(3, valorTotalReserva);
        ps.setString(4, localRetirada);
        ps.setString(5, dataRetirada);
        ps.setString(6, horaRetirada);
        ps.setString(7, localDevolucao);
        ps.setString(8, dataDevolucao);
        ps.setString(9, horaDevolucao);
        ps.setBoolean(10, protecao);
        ps.setBoolean(11, protecaoC);
        ps.setBoolean(12, coberturaTerceiro);
        ps.setBoolean(13, condutor);

        // Executa a instrução SQL de inserção
        int rowsInserted = ps.executeUpdate();

    } catch (Exception e) {
        out.println("Erro durante a conexão com o banco de dados: " + e.getMessage());
    }

    response.sendRedirect("area.jsp");
%>

<body onload="ConfirmarReserva()">

</body>

<scrip>
    function ConfirmarReserva(){
    alert('Reserva concluída com sucesso!');
    }
</scrip>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.ZoneId" %>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="config.conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Locale"%>
<%@page import="config.conexao"%>
<%@page import ="java.sql.*"%>
<%@page import ="com.mysql.jdbc.Driver"%>
<%
        PrintWriter write = response.getWriter();
        Connection connection = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Statement st = null;
            
        String nome = request.getParameter("nome");
        
        String data = request.getParameter("data-nascimento");
         
        String cpf = request.getParameter("cpf");
        String genero = request.getParameter("genero");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String senha = request.getParameter("senha");
        String cep = request.getParameter("cep");
        String logradouro = request.getParameter("logradouro");
        String endereco = request.getParameter("endereco");
        String numero = request.getParameter("numero");
        String bairro = request.getParameter("bairro");
        String complemento = request.getParameter("complemento");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String confirmsenha = request.getParameter("confirma-senha");
      
        String query = "INSERT INTO cliente (Nome, CPF, Genero, Email, DataNascimento, Telefone, Senha, CEP,Logradouro,Endereco, Numero, Bairro, Complemento, Cidade, Uf) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
        ps = new conexao().conectar().prepareStatement(query);
        ps.setString(1, nome);
        ps.setString(2, cpf);
        ps.setString(3, genero);
        ps.setString(4, email);
        ps.setString(5, data);
        ps.setString(6, telefone);
        ps.setString(7, senha);
        ps.setString(8, cep);
        ps.setString(9, logradouro);
        ps.setString(10, endereco);
        ps.setString(11, numero);
        ps.setString(12, bairro);
        ps.setString(13, complemento);
        ps.setString(14, cidade);
        ps.setString(15, estado);
        
        ps.executeUpdate();
        
      response.sendRedirect("page-login.jsp");
%>

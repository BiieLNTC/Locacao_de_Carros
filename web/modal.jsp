<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.conexao"%>

<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NuCars Locação</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="./Styles/style-modal.css">
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <%
        Statement st = null;
        ResultSet rs = null;
        String id = request.getParameter("idReservaEdit");

        try {
            st = new conexao().conectar().createStatement();
            rs = st.executeQuery("select * from reservas where Id = " + id);
            rs.next();
    %>

    <body>
        <div class="modal-container">
            <div class="modal">
                <form action="editarReserva.jsp" class="form-inline">
                    <div class="row">
                        <div class="form-group col-4">
                            <label>Local de Retirada</label>
                            <select class="form-select" name="local-retirada-edit" id="local-retirada-edit">
                                <option ></option>
                                <option value="Agencia Guarulhos" <% if (rs.getString(6).equals("Agencia Guarulhos")) { %>selected<% } %>>Aeroporto Guarulhos - São Paulo - SP</option>
                                <option value="Agencia Viracopos" <% if (rs.getString(6).equals("Agencia Viracopos")) { %>selected<% } %>>Aeroporto Viracopos - Campinas - SP</option>
                                <option value="Agencia Piracicaba"<% if (rs.getString(6).equals("Agencia Piracicaba")) { %>selected<% } %>>Agência Piracicaba - SP</option>
                                <option value="Agencia Ribeirao Preto" <% if (rs.getString(6).equals("Agencia Ribeirao Preto")) { %>selected<% } %>>Agência Ribeirão Preto - SP</option>
                                <option value="Agencia Rio Claro"<% if (rs.getString(6).equals("Agencia Rio Claro")) { %>selected<% } %>>Agência Rio Claro - SP</option>
                                <option value="Agencia Leblon" <% if (rs.getString(6).equals("Agencia Leblon")) { %>selected<% } %>>Agência Leblon - RJ</option>
                                <option value="Agencia Curitiba" <% if (rs.getString(6).equals("Agencia Curitiba")) { %>selected<% }%>>Agência Curitiba - PR</option>
                            </select>    
                        </div>
                        <div class="form-group col-3">
                            <label>Data Retirada</label>
                            <input type="date" name="data-retirada-edit" id="data-retirada-edit" value="<%rs.getDate(7);%>" class="form-control">
                        </div>
                        <div class="form-group col-3">
                            <label>Hora Retirada</label>
                            <select class="form-select" name="hora-retirada-edit" id="hora-retirada-edit">
                                <option selected></option>
                                <option value="8:00" <% if (rs.getString(8).equals("8:00")) { %>selected<% } %>>8:00</option>
                                <option value="8:30" <% if (rs.getString(8).equals("8:30")) { %>selected<% } %>>8:30</option>
                                <option value="9:00" <% if (rs.getString(8).equals("9:00")) { %>selected<% } %>>9:00</option>
                                <option value="9:30" <% if (rs.getString(8).equals("9:30")) { %>selected<% } %>>9:30</option>
                                <option value="10:00" <% if (rs.getString(8).equals("10:00")) { %>selected<% } %>>10:00</option>
                                <option value="10:30" <% if (rs.getString(8).equals("10:30")) { %>selected<% } %>>10:30</option>
                                <option value="11:00" <% if (rs.getString(8).equals("11:00")) { %>selected<% } %>>11:00</option>
                                <option value="11:30" <% if (rs.getString(8).equals("11:30")) { %>selected<% } %>>11:30</option>
                                <option value="12:00" <% if (rs.getString(8).equals("12:00")) { %>selected<% } %>>12:00</option>
                                <option value="12:30" <% if (rs.getString(8).equals("12:30")) { %>selected<% } %>>12:30</option>
                                <option value="13:00" <% if (rs.getString(8).equals("13:00")) { %>selected<% } %>>13:00</option>
                                <option value="13:30" <% if (rs.getString(8).equals("13:30")) { %>selected<% } %>>13:30</option>
                                <option value="14:00" <% if (rs.getString(8).equals("14:00")) { %>selected<% } %>>14:00</option>
                                <option value="14:30" <% if (rs.getString(8).equals("14:30")) { %>selected<% } %>>14:30</option>
                                <option value="15:00" <% if (rs.getString(8).equals("15:00")) { %>selected<% } %>>15:00</option>
                                <option value="15:30" <% if (rs.getString(8).equals("15:30")) { %>selected<% } %>>15:30</option>
                                <option value="16:00" <% if (rs.getString(8).equals("16:00")) { %>selected<% } %>>16:00</option>
                                <option value="16:30" <% if (rs.getString(8).equals("16:30")) { %>selected<% } %>>16:30</option>
                                <option value="17:00" <% if (rs.getString(8).equals("17:00")) { %>selected<% } %>>17:00</option>
                                <option value="17:30" <% if (rs.getString(8).equals("17:30")) { %>selected<% } %>>17:30</option>
                                <option value="18:00" <% if (rs.getString(8).equals("18:00")) { %>selected<% }%>>18:00</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="form-group col-4">
                            <label>Local de Devolução</label>
                            <select class="form-select" name="local-devolucao-edit" value="<%rs.getString(9);%>" id="local-devolucao-edit">
                                <option selected></option>
                                <option value="Agencia Guarulhos" <% if (rs.getString(9).equals("Agencia Guarulhos")) { %>selected<% } %>>Aeroporto Guarulhos - São Paulo - SP</option>
                                <option value="Agencia Viracopos" <% if (rs.getString(9).equals("Agencia Viracopos")) { %>selected<% } %>>Aeroporto Viracopos - Campinas - SP</option>
                                <option value="Agencia Piracicaba"<% if (rs.getString(9).equals("Agencia Piracicaba")) { %>selected<% } %>>Agência Piracicaba - SP</option>
                                <option value="Agencia Ribeirao Preto" <% if (rs.getString(9).equals("Agencia Ribeirao Preto")) { %>selected<% } %>>Agência Ribeirão Preto - SP</option>
                                <option value="Agencia Rio Claro"<% if (rs.getString(9).equals("Agencia Rio Claro")) { %>selected<% } %>>Agência Rio Claro - SP</option>
                                <option value="Agencia Leblon" <% if (rs.getString(9).equals("Agencia Leblon")) { %>selected<% } %>>Agência Leblon - RJ</option>
                                <option value="Agencia Curitiba" <% if (rs.getString(9).equals("Agencia Curitiba")) { %>selected<% } %>>Agência Curitiba - PR</option>
                            </select>
                        </div>
                        <div class="form-group col-3">
                            <label>Data Devolução</label>
                            <input type="date" name="data-devolucao-edit" value="<%rs.getDate(10);%>" class="form-control" id="data-devolucao-edit">

                        </div>
                        <div class="form-group col-3">
                            <label>Hora Devolução</label>
                            <select class="form-select" name="hora-devolucao-edit" id="hora-devolucao-edit">
                                <option selected></option>
                                <option value="8:00" <% if (rs.getString(11).equals("8:00")) { %>selected<% } %>>8:00</option>
                                <option value="8:30" <% if (rs.getString(11).equals("8:30")) { %>selected<% } %>>8:30</option>
                                <option value="9:00" <% if (rs.getString(11).equals("9:00")) { %>selected<% } %>>9:00</option>
                                <option value="9:30" <% if (rs.getString(11).equals("9:30")) { %>selected<% } %>>9:30</option>
                                <option value="10:00" <% if (rs.getString(11).equals("10:00")) { %>selected<% } %>>10:00</option>
                                <option value="10:30" <% if (rs.getString(11).equals("10:30")) { %>selected<% } %>>10:30</option>
                                <option value="11:00" <% if (rs.getString(11).equals("11:00")) { %>selected<% } %>>11:00</option>
                                <option value="11:30" <% if (rs.getString(11).equals("11:30")) { %>selected<% } %>>11:30</option>
                                <option value="12:00" <% if (rs.getString(11).equals("12:00")) { %>selected<% } %>>12:00</option>
                                <option value="12:30" <% if (rs.getString(11).equals("12:30")) { %>selected<% } %>>12:30</option>
                                <option value="13:00" <% if (rs.getString(11).equals("13:00")) { %>selected<% } %>>13:00</option>
                                <option value="13:30" <% if (rs.getString(11).equals("13:30")) { %>selected<% } %>>13:30</option>
                                <option value="14:00" <% if (rs.getString(11).equals("14:00")) { %>selected<% } %>>14:00</option>
                                <option value="14:30" <% if (rs.getString(11).equals("14:30")) { %>selected<% } %>>14:30</option>
                                <option value="15:00" <% if (rs.getString(11).equals("15:00")) { %>selected<% } %>>15:00</option>
                                <option value="15:30" <% if (rs.getString(11).equals("15:30")) { %>selected<% } %>>15:30</option>
                                <option value="16:00" <% if (rs.getString(11).equals("16:00")) { %>selected<% } %>>16:00</option>
                                <option value="16:30" <% if (rs.getString(11).equals("16:30")) { %>selected<% } %>>16:30</option>
                                <option value="17:00" <% if (rs.getString(11).equals("17:00")) { %>selected<% } %>>17:00</option>
                                <option value="17:30" <% if (rs.getString(11).equals("17:30")) { %>selected<% } %>>17:30</option>
                                <option value="18:00" <% if (rs.getString(11).equals("18:00")) { %>selected<% }%>>18:00</option>
                            </select>
                        </div>
                        <div class="form-group col-2">
                            <button type="submit" class="btnSalvar">Salvar</button>
                            <input type="hidden" value="<%=rs.getInt(1)%>" id="idReserva" name="idReserva">
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="form-group col-4">
                            <label>Grupo</label>
                            <select class="form-select" name="grupo-edit" value="<%rs.getString(3);%>" id="grupo-edit">
                                <option selected></option>
                                <option value="Grupo A - COMPACTO COM AR" <% if (rs.getString(3).equals("Grupo A - COMPACTO COM AR")) { %>selected<% } %>>Grupo A - COMPACTO COM AR</option>
                                <option value="Grupo B - ECONOMICO COM AR" <% if (rs.getString(3).equals("Grupo B - ECONOMICO COM AR")){ %>selected<% } %>>Grupo B - ECONOMICO COM AR</option>
                                <option value="Agencia Piracicaba"<% if (rs.getString(3).equals("Grupo FX - AUTOMATICO")) { %>selected<% } %>>Grupo FX - AUTOMATICO</option>
                                <option value="Agencia Ribeirao Preto" <% if (rs.getString(3).equals("GRUPO GC - SUV COMPACTO")) { %>selected<% } %>>GRUPO GC - SUV COMPACTO</option>                
                            </select>
                        </div>
                    </div>                            
                </form>

            </div>
        </div>
    </body>

    <%        } catch (Exception e) {
            out.print(e);
        }
    %>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous">
    </script>
</html
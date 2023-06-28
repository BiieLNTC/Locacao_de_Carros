<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="config.conexao"%>
<%@page import ="java.sql.*"%>
<%@page import ="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NuCars Locação - Cadastro</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="./Styles/style.css">
    <link rel="stylesheet" href="./Styles/cadastro.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
</head>

    <%
        ResultSet rs = null;
        ResultSet rc = null;
        Statement st = null;
    %>

<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-light">
            <div class="container">
                <a href="index.jsp" class="navbar-brand">
                    <img src="img/Nucars_logo.png" alt="" width="142">
                </a>
                <button class="navbar-toggler" data-toggle="collapse" data-target="#nav-principal" id="hamburguer">
                    <i class="fas fa-bars text-white"></i>
                </button>
                <div class="collapse navbar-collapse" id="nav-principal">

                </div>
            </div>
        </nav>
    </header>

    <div class="container">
        <div class="area-registro">
            <h1>CRIAR CONTA</h1>
            <form action="Cadastrados.jsp" method="post">
                <h3>Dados Pessoais</h3>
                <div class="row">
                    <div class="col-3">
                        <label for="nome" class="form-label">Nome Completo</label>
                        <input type="text" name="nome" id="nome" class="form-control">
                    </div>
                    <div class="col-3">
                        <label for="dt-nascimento" class="form-label">Data de Nascimento</label>
                        <input class="form-control" type="date" name="data-nascimento" id="dt-nascimento">
                    </div>
                    <div class="col-3">
                        <label for="cpf" class="form-label">CPF</label>
                        <input type="text" name="cpf" id="cpf" class="form-control">
                    </div>

                    <div class="col-3">
                        <label class="form-label" for="genero">Gênero</label><br>
                        <div class="form-check-inline">
                            <input type="radio" class="form-check-input" id="feminino" name="genero" value="F">
                            <label class="form-check-label" for="feminino">Feminino</label>
                        </div>
                        <div class="form-check-inline">
                            <input type="radio" class="form-check-input" id="masculino" name="genero" value="M">
                            <label class="form-check-label" for="masculino">Masculino</label>
                        </div>
                        <div class="form-check-inline">
                            <input type="radio" class="form-check-input" id="outro" name="genero" value="O">
                            <label class="form-check-label" for="outro">Outro</label>
                        </div>
                    </div>
                    <div class="col-6">
                        <label class="form-label" for="email">E-mail</label>
                        <input class="form-control" type="email" name="email" id="email">
                    </div>
                    <div class="col-6">
                        <label class="form-label" for="telefone">Telefone</label>
                        <input class="form-control" type="text" name="telefone" id="telefone">
                    </div>
                    <div class="col-6">
                        <label class="form-label" for="senha">Crie sua Senha</label>
                        <input class="form-control" type="password" name="senha" id="senha">
                    </div>
                    <div class="col-6">
                        <label class="form-label" for="confirma-senha">Confirme sua Senha</label>
                        <input class="form-control" type="password" name="confirma-senha" id="confirma-senha">
                    </div>
                </div>

                <h3>Endereco</h3>
                <div id="appCep">
                    <div class="row">
                        <div class="col-4">
                            <label class="form-label">CEP</label>
                            <input class="form-control" maxlength="8" id="cep" name="cep" type="text">
                        </div>
                        <div class="col-4">
                            <label class="form-label">Logradouro</label>
                            <input class="form-control" id="logradouro" id="logradouro" name="logradouro" type="text">
                        </div>
                        <div class="col-4">
                            <label class="form-label">Endereço</label>
                            <input class="form-control" id="endereco" type="text" name="endereco">
                        </div>
                        <div class="col-4">
                            <label class="form-label">Número</label>
                            <input class="form-control" id="numero" type="text" name="numero">
                        </div>
                        <div class="col-4">
                            <label class="form-label">Bairro</label>
                            <input class="form-control" id="bairro" type="text" name="bairro">
                        </div>
                        <div class="col-4">
                            <label class="form-label">Complemento</label>
                            <input class="form-control" id="complemento" type="text" name="complemento">
                        </div>
                        <div class="col-4">
                            <label class="form-label">Cidade</label>
                            <input class="form-control" id="cidade" id="cidade" type="text" name="cidade">
                        </div>
                        <div class="col-4">
                            <label class="form-label">Estado</label>
                            <select class="form-select" id="estado" name="estado">
                                <option selected></option>
                                <option value="AC">Acre</option>
                                <option value="AL">Alagoas</option>
                                <option value="AP">Amapá</option>
                                <option value="AM">Amazonas</option>
                                <option value="BA">Bahia</option>
                                <option value="CE">Ceará</option>
                                <option value="DF">Distrito Federal</option>
                                <option value="ES">Espírito Santo</option>
                                <option value="GO">Goiás</option>
                                <option value="MA">Maranhão</option>
                                <option value="MT">Mato Grosso</option>
                                <option value="MS">Mato Grosso do Sul</option>
                                <option value="MG">Minas Gerais</option>
                                <option value="PA">Pará</option>
                                <option value="PB">Paraíba</option>
                                <option value="PR">Paraná</option>
                                <option value="PE">Pernambuco</option>
                                <option value="PI">Piauí</option>
                                <option value="RJ">Rio de Janeiro</option>
                                <option value="RN">Rio Grande do Norte</option>
                                <option value="RS">Rio Grande do Sul</option>
                                <option value="RO">Rondônia</option>
                                <option value="RR">Roraima</option>
                                <option value="SC">Santa Catarina</option>
                                <option value="SP">São Paulo</option>
                                <option value="SE">Sergipe</option>
                                <option value="TO">Tocantins</option>
                            </select>
                        </div>
                    </div>
                </div>
                <p><button type="submit" class="btn-cadastrar" onclick="valida()">CADASTRAR</button></p>
            </form>
            
        </div>
    </div>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-3">
                    <h3>Informações ao Consumidor</h3>
                    <ul>
                        <li>
                            Sede: <a href="https://goo.gl/maps/yRN7Qz2Fm8v5dnMp9" target="_blanc">
                                2428 Dell Ave
                                Los Angeles, California, EUA
                            </a>
                        </li>
                        <li>
                            CNPJ: 42.955.991/0001-06
                        </li>
                    </ul>
                </div>
                <div class="col-3">
                    <h3>Contato</h3>
                    <ul>
                        <li>
                            E-mail: suporte@nucars.com
                        </li>
                        <li>
                            Telefone: 0800 797 2023
                        </li>
                    </ul>
                </div>
                <div class="col-3 mt-4">
                    <ul>
                        <li>
                            <a href="grupo.jsp">Grupo de Carros</a>
                        </li>
                        <li>
                            <a href="sobre-nos.jsp">Sobre nós</a>
                        </li>
                        <li>
                            <a href="ajuda.jsp">Ajuda</a>
                        </li>
                    </ul>
                </div>
                <div class="col-3">
                    <h3>Redes Sociais</h3>
                    <ul>
                        <li>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-facebook" viewBox="0 0 16 16">
                                <path
                                    d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
                            </svg>
                            <span><a href="">facebook.com/nucars</a></span><br>
                        </li>
                        <li>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-whatsapp" viewBox="0 0 16 16">
                                <path
                                    d="M13.601 2.326A7.854 7.854 0 0 0 7.994 0C3.627 0 .068 3.558.064 7.926c0 1.399.366 2.76 1.057 3.965L0 16l4.204-1.102a7.933 7.933 0 0 0 3.79.965h.004c4.368 0 7.926-3.558 7.93-7.93A7.898 7.898 0 0 0 13.6 2.326zM7.994 14.521a6.573 6.573 0 0 1-3.356-.92l-.24-.144-2.494.654.666-2.433-.156-.251a6.56 6.56 0 0 1-1.007-3.505c0-3.626 2.957-6.584 6.591-6.584a6.56 6.56 0 0 1 4.66 1.931 6.557 6.557 0 0 1 1.928 4.66c-.004 3.639-2.961 6.592-6.592 6.592zm3.615-4.934c-.197-.099-1.17-.578-1.353-.646-.182-.065-.315-.099-.445.099-.133.197-.513.646-.627.775-.114.133-.232.148-.43.05-.197-.1-.836-.308-1.592-.985-.59-.525-.985-1.175-1.103-1.372-.114-.198-.011-.304.088-.403.087-.088.197-.232.296-.346.1-.114.133-.198.198-.33.065-.134.034-.248-.015-.347-.05-.099-.445-1.076-.612-1.47-.16-.389-.323-.335-.445-.34-.114-.007-.247-.007-.38-.007a.729.729 0 0 0-.529.247c-.182.198-.691.677-.691 1.654 0 .977.71 1.916.81 2.049.098.133 1.394 2.132 3.383 2.992.47.205.84.326 1.129.418.475.152.904.129 1.246.08.38-.058 1.171-.48 1.338-.943.164-.464.164-.86.114-.943-.049-.084-.182-.133-.38-.232z" />
                            </svg>
                            <span><a href="">(11) 94002-8922</a></span>
                        </li>
                        <li>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-instagram" viewBox="0 0 16 16">
                                <path
                                    d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z" />
                            </svg>
                            <span><a href="">instagram.com/nucars</a></span>
                        </li>
                        <li>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-twitter" viewBox="0 0 16 16">
                                <path
                                    d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z" />
                            </svg>
                            <span><a href="">twitter.com/nucars</a></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

</body>




<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="cep.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
    integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
    crossorigin="anonymous"></script>
    <script>
        function valida(){
        var senha = document.getElementById("senha").value;
        
        var confirm = document.getElementById("confirma-senha").value;
        
        if(senha !== confirm){
            alert("senhas divergentes");
            return;
        }
      }

        </script>
</html>

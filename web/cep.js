const addressForm = document.querySelector("#appCep");
const cepInput = document.querySelector("#cep");
const addressInput = document.querySelector("#logradouro");
const cityInput = document.querySelector("#cidade");
const neighborhoodInput = document.querySelector("#bairro");
const regionInput = document.querySelector("#estado");
const complemento = document.querySelector("#complemento")
const formInputs = document.querySelectorAll("[data-input]");

// valida CEP
cepInput.addEventListener("keypress", (e) => {
  const onlyNumbers = /[0-9]|\./;
  const key = String.fromCharCode(e.keyCode);

  // travar para digitar apenas numeros
  if (!onlyNumbers.test(key)) {
    e.preventDefault();
    return;
  }
});

// evento keyup
cepInput.addEventListener("keyup", (e) => {
  const inputValue = e.target.value;

  //   ver se ja digitou um cep
  if (inputValue.length === 8) {
    getAddress(inputValue);
  }

  if(inputValue.length === 0) {
    addressInput.value = "";
  cityInput.value = "";
  neighborhoodInput.value ="";
  complemento.value = "";
  regionInput.value = "";
  }
});

// pega o endereço na API
const getAddress = async (cep) => {
  

  cepInput.blur();

  const apiUrl = `https://viacep.com.br/ws/${cep}/json/`;

  const response = await fetch(apiUrl);

  const data = await response.json();

  console.log(data);
  console.log(formInputs);
  console.log(data.erro);

  // Show error and reset form
  if (data.erro === "true" || data.erro === true) {
    alert('"CEP inválido, tente novamente."')
    addressForm.reset()
    return;
  }

  // Activate disabled attribute if form is empty
  addressInput.value = data.logradouro;
  cityInput.value = data.localidade;
  neighborhoodInput.value = data.bairro;
  complemento.value = data.complemento;
  regionInput.value = data.uf;
};














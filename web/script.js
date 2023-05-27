function MostraSenha() {
    let senha = document.querySelector('#senha-login')
    let olho = document.querySelector('#olho')

    if (senha.getAttribute('type') === 'password') {
        senha.setAttribute('type', 'text')
        olho.removeAttribute('class', 'fas fa-eye')
        olho.setAttribute('class', 'fas fa-eye-slash')
    } else {
        senha.setAttribute('type', 'password')        
        olho.setAttribute('class', 'fas fa-eye')
    }
}
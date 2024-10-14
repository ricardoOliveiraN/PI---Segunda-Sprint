let qtdEmailCorreto = 0; // Declarar a variável em um escopo mais amplo (se necessário)

function validarEmail() {
  const email = inp_email.value;
  const tldsValidos = ['.com', '.br'];
  const posicaoArroba = email.indexOf('@');
  const dominio = email.slice(posicaoArroba + 1);

  let valido = false;
  tldsValidos.forEach(tld => {
    if (dominio.endsWith(tld)) {
      valido = true;
      inp_email.style.borderColor = 'green';
    } else {
      inp_email.style.borderColor = 'red';
    }
  });

  if (!valido) {
    alert('Por favor, digite um endereço de email válido.');
  }

  return valido; // Retorna true se o email for válido, false caso contrário
}

function ENVIAR() {
  if (validarEmail()) {
    // Email válido, abrir tela de login
    abrirTelaLogin();
  } else {
    // Email inválido
  }

}
// FIM DA VALIDAÇÃO DO EMAIL

// validando tela com botão

function ENVIAR() {

    if ( qtdEmailCorreto >= 1) {

        Email = inp_email.value;
        abrirTelaLogin();

        // EU QUERO QUE QUANDO ENTRAR NESSE IF ABRA UMA NOVA TELA COM UMA IMAGEM DE CERTO E UMA FRASE "CADASTRADO COM SUCESSO"

    } else {
            inp_email.style.borderColor = 'red';
        }

}
function abrirTelaLogin() {
    const urlLogin = "file:///C:/Users/ricar/OneDrive/%C3%81rea%20de%20Trabalho/SPTech%20Aulas/PI%20-%20Segunda%20Sprint/PI---Segunda-Sprint/Prot%C3%B3tipo%20do%20Site%20institucional/LoginCadastro/TelaLogin.html";
    window.close();
    window.open(urlLogin);
}
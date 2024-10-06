function AbrirCadastro() {
    const urlTela = 'TelaCadastro.html'; // Endereço da página cadastro do html
    window.close(); // Fecha a página aberta (login)
    window.open(urlTela); // Abre a página cadastro
}

function VisualizarSenha() {
    if (inp_senha2.type == 'password') { // Se o tipo da input for password 
        inp_senha2.type = 'text'; // Transforma em text, ou seja, deixa a senha visível
        img_olho3.src = '../Imagens/olho_fechado.png'; // Abre a imagem do olho fechado
    } else {
        inp_senha2.type = 'password'; // Caso a senha já esteja como text (visível), volta a ser password e esconde a senha
        img_olho3.src = '../Imagens/olho_aberto.png'; // Abre a imagem do olho aberto
    }
} 

// A PARTIR DAQUI COMEÇA AS VALIDAÇÕES DO SITE:

// VALIDAÇÃO DA PRIMEIRA SENHA:
// validações: ter pelo menos uma letra minúscula, ter pelo menos uma letra maiúscula, ter pelo menos um caractere especial e ser maior que 8 caracteres;

var Senha = '';
var qtdCorreto = 0;
var qtdCorretoMini = 0;
var qtdCorretoMais = 0;
var qtdCorretoTam = 0;

function validarSenha(){
    Senha = inp_senha.value;
    var tamanhoSenha = Senha.length;
    var maisculaSenha = Senha.toUpperCase();
    var minisculaSenha = Senha.toLowerCase();
    var possuiArroba = Senha.includes('@');
    var possuiHash = Senha.includes('#');
    var possuiCifrao = Senha.includes('$');
    var possuiPorcent = Senha.includes('%');
    var possuiE = Senha.includes('&');
    var possuiAsterisco = Senha.includes('*');
    var possuiInterrogacao = Senha.includes('!');

    var mensagem = '';
    var mensagemDois = '';

    var mensagemTres = '';
    var mensagemQuatro = '';


    if (tamanhoSenha >= 8){
        mensagem = '<img src="../Imagens/SimboloCertinho.png" style="width: 20px"> Tamanho Correto';
        qtdCorretoTam += 1;
    }else{
        mensagem = '<img src="../Imagens/SimboloErrado.png" style="width: 20px">Tamanho Incorreto (pelo menos 8)';
    }
    if (Senha != minisculaSenha){
        mensagemDois = '<img src="../Imagens/SimboloCertinho.png" style="width: 20px">Maiúscula';
        qtdCorretoMini += 1;
    }else{
        mensagemDois = '<img src="../Imagens/SimboloErrado.png" style="width: 20px">Maiúscula ';
    }
    if (Senha != maisculaSenha){
        mensagemQuatro = `<img src="../Imagens/SimboloCertinho.png" style="width: 20px"> Minúscula`;
        qtdCorretoMais += 1;
    }else{
        mensagemQuatro = '<img src="../Imagens/SimboloErrado.png" style="width: 20px">Minúscula';
    }
    if (possuiArroba || possuiHash || possuiCifrao || possuiPorcent || possuiE || possuiAsterisco || possuiInterrogacao){
        mensagemTres = '<img src="../Imagens/SimboloCertinho.png" style="width: 20px">Caractere especial (! @ # $ % & *)';
        qtdCorreto += 1;
    }else{
        mensagemTres = '<img src="../Imagens/SimboloErrado.png" style="width: 20px">Caractere especial (! @ # $ % & *)'
    }
    div_validarSenha.innerHTML = `${mensagem} <br> ${mensagemDois} <br> ${mensagemQuatro} <br> ${mensagemTres}`

}
// VALIDAÇÃO DE SENHA
function confirmarSenha(){
    div_validarSenha.innerHTML = '';
    var senhaConfirmacao = inp_ConfirmarSenha.value;

    if (senhaConfirmacao != Senha){
        inp_ConfirmarSenha.style.borderColor = 'red';
    }else{
        inp_ConfirmarSenha.style.borderColor = 'green';
        
    }
}
// validando tela com botão

function cadastrar(){

    var Email = inp_email.value;
    var Nome = inp_nome.value;
    var Celular = inp_celular.value;

    if (qtdCorretoTam >= 8 && qtdCorreto >= 1 && qtdCorretoMini >= 1 && qtdCorretoMais >= 1  ){

    }

}
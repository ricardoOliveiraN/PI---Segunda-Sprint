function AbrirLogin() {
    const urlTela = 'login.html';
    window.close();
    window.open(urlTela);
}

function AbrirCadastro() {
    const urlTela = 'cadastro.html';
    window.close();
    window.open(urlTela);
}

function VisualizarSenha() {
    if (txt_senha2.type === 'password') {
        txt_senha2.type = 'text';
        img_olho3.src = 'Imagens/olho_fechado.png';
    } else {
        txt_senha2.type = 'password';
        img_olho3.src = 'Imagens/olho_aberto.png';
    }
}
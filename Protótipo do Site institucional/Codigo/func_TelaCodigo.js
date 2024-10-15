var CodigoCorreto = '1234'

function ValidarCodigo() {

    var OpcaoUm = inp_CodigoUm.value;
    var OpcaoDois = inp_CodigoDois.value;
    var OpcaoTres = inp_CodigoTres.value;
    var OpcaoQuatro = inp_CodigoQuatro.value;

    if (OpcaoUm != '') {
        inp_CodigoUm.style.borderColor = 'white';
    } else {
        inp_CodigoUm.style.borderColor = 'red';
    }
    if (OpcaoDois != '') {
        inp_CodigoDois.style.borderColor = 'white';
    } else {
        inp_CodigoDois.style.borderColor = 'red';
    }
    if (OpcaoTres != '') {
        inp_CodigoTres.style.borderColor = 'white';
    } else {
        inp_CodigoTres.style.borderColor = 'red';
    }
    if (OpcaoQuatro != '') {
        inp_CodigoQuatro.style.borderColor = 'white';
    } else {
        inp_CodigoQuatro.style.borderColor = 'red';
    }

}

function EntrarSite() {

    var OpcaoUm = inp_CodigoUm.value;
    var OpcaoDois = inp_CodigoDois.value;
    var OpcaoTres = inp_CodigoTres.value;
    var OpcaoQuatro = inp_CodigoQuatro.value;


    if (CodigoCorreto[0] == OpcaoUm && CodigoCorreto[1] == OpcaoDois && CodigoCorreto[2] == OpcaoTres && CodigoCorreto[3] == OpcaoQuatro) {
        div_CodigoInvalido.style.display = 'none';
        telaMudarSenha();
    } else {
        div_CodigoInvalido.style.display = 'block';
    }
}

function telaMudarSenha() {
    var urlLogin = "file:///C:/Users/ricar/OneDrive/%C3%81rea%20de%20Trabalho/SPTech%20Aulas/PI%20-%20Segunda%20Sprint/PI---Segunda-Sprint/Prot%C3%B3tipo%20do%20Site%20institucional/SenhaNova/TelaSenhaNova.html";
    window.close();
    window.open(urlLogin);
}
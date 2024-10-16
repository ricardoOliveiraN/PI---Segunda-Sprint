var qtdEmailCorreto = 0;
var qtdCelularCorreto = 0;
var qtdNomeCorreto = 0;

var EmailDefinitivo = '';
var TelefoneDefinitivo = '';
var NomeDefinitivo = '';

function validacoes() {

    var Email = inp_email.value;
    var Telefone = inp_telefone.value;
    var Nome = inp_nome.value;

    if (Email != '') {

        var posicaoArrobaIn = Email.includes('@');
        var tamanhoEmail = Email.length;
        var posicaoCOM = Email.indexOf('.com');
        var posicaoBR = Email.indexOf('.br');
        var posicaoArroba = Email.indexOf('@');
        var possuiEspaco = Email.includes(' ')


        if (posicaoCOM > posicaoArroba || posicaoBR > posicaoArroba) {


            if (((Email[tamanhoEmail - 1] == 'm' && Email[tamanhoEmail - 2] == 'o' && Email[tamanhoEmail - 3] == 'c' && Email[tamanhoEmail - 4] == '.') || (Email[tamanhoEmail - 1] == 'r' && Email[tamanhoEmail - 2] == 'b' && Email[tamanhoEmail - 3] == '.')) && possuiEspaco == false && posicaoArrobaIn == true) {
                qtdEmailCorreto += 1;
                inp_email.style.borderColor = 'green';
                EmailDefinitivo = Email;
            } else {
                inp_email.style.borderColor = 'red';
                qtdEmailCorreto = 0;
            }
        } else {

            if (((Email[tamanhoEmail - 1] == 'm' && Email[tamanhoEmail - 2] == 'o' && Email[tamanhoEmail - 3] == 'c' && Email[tamanhoEmail - 4] == '.') || (Email[tamanhoEmail - 1] == 'r' && Email[tamanhoEmail - 2] == 'b' && Email[tamanhoEmail - 3] == '.')) && possuiEspaco == false && posicaoArrobaIn == true) {
                qtdEmailCorreto += 1;
                inp_email.style.borderColor = 'green';
                EmailDefinitivo = Email;
            } else {
                inp_email.style.borderColor = 'red';
                qtdEmailCorreto = 0;
            }

        }
  
    }else if (Email == '') {
        qtdEmailCorreto = 0;
        inp_email.style.borderColor = 'black';
    }

    var TamanhoCelular = Telefone.length;

    if (Telefone != '' && qtdCelularCorreto == 0) {


        var TelefoneDois = Number(Telefone);

        var PossuiIsso = Telefone.includes('-') || Telefone.includes('(') || Telefone.includes(')') || Telefone.includes('.') || Telefone.includes(' ');

        if (TamanhoCelular == 11 && PossuiIsso == false && isNaN(TelefoneDois) == false) { //colocar uma verificação de valor negativo?

            qtdCelularCorreto += 1;
            inp_telefone.style.borderColor = 'green';
            TelefoneDefinitivo = Telefone;


        } else {

            qtdCelularCorreto = 0;
            inp_telefone.style.borderColor = 'red';
        }

    } else if (Telefone != '' && TamanhoCelular != 11 ) {


        qtdCelularCorreto = 0;
        inp_telefone.style.borderColor = 'red';
        // colocar uma div pra pessoa ver como faz o celular correto?)

    } else if (Telefone == '') {
        qtdCelularCorreto = 0;
        inp_telefone.style.borderColor = 'black';
    }

    if (Nome != '') {
        var PossuiIsso = Nome.includes('1') || Nome.includes('2') || Nome.includes('3') || Nome.includes('4') || Nome.includes('5') || Nome.includes('6') || Nome.includes('7') || Nome.includes('8') || Nome.includes('9') || Nome.includes('0')

        if (PossuiIsso == false){
            qtdNomeCorreto += 1;
            inp_nome.style.borderColor = 'green';
            NomeDefinitivo = Nome;
        }else{
            qtdNomeCorreto = 0;
            inp_nome.style.borderColor = 'red';
        }
    }else if (Nome == ''){
        qtdNomeCorreto = 0;
        inp_nome.style.borderColor = 'black';
    }

}

function cadastrar(){

    var TipoUser = inp_tipo.value;

    if (qtdEmailCorreto >= 1 && qtdCelularCorreto >= 1 && qtdNomeCorreto >= 1 && TipoUser != 0){
        alert('valido')
    }else{
        alert('Inválido')
    }


}
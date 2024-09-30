// Função para obter o ano atual do sistema do usuário
function obterAnoAtual() {
    return new Date().getFullYear();
}


function atualizarAnos() {
    const anoAtual = obterAnoAtual();
    const anoAnterior = anoAtual - 1;
    const anoDoisAnosAtras = anoAtual - 2;


    document.getElementById('ano2Label').innerText = `Ano: ${anoAnterior}`;
    document.getElementById('ano1Label').innerText = `Ano: ${anoDoisAnosAtras}`;
}


atualizarAnos();

// Função para calcular as médias e porcentagens
function calcularMedias() {
    const lucro1 = parseFloat(document.getElementById('lucro1').value);
    const lucro2 = parseFloat(document.getElementById('lucro2').value);
    const produzido1 = parseFloat(document.getElementById('produzido1').value);
    const produzido2 = parseFloat(document.getElementById('produzido2').value);

    const mediaLucro = (lucro1 + lucro2) / 2;
    const mediaProduzido = (produzido1 + produzido2) / 2;


    const aumentoPercentual = 0.35;
    const novoLucro = mediaLucro * (1 + aumentoPercentual);


    const aumentoEmReais = novoLucro - mediaLucro;


    document.getElementById('resultados').innerHTML = `
    <p> Sua empresa apresenta uma média de lucro anual de R$ ${mediaLucro.toFixed(2)}.<br>
        E a média de lúpulo produzido anualmente é de ${mediaProduzido.toFixed(2)} kg.</p>
        Com a implementação do nosso sistema, estima-se que o lucro pode aumentar em até 35%.<br>
    <p> Com isso o lucro medio anual passa a ser de R$ ${novoLucro.toFixed(2)},<br>
        resultando em um aumento de R$ ${aumentoEmReais.toFixed(2)}</p> 
    `;
}

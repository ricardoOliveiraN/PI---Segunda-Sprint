// Função para obter o ano atual do sistema do usuário
function obterAnoAtual() {
    return new Date().getFullYear();
}

// Atualiza os anos automaticamente
function atualizarAnos() {
    const anoAtual = obterAnoAtual();
    const anoAnterior = anoAtual - 1;
    const anoDoisAnosAtras = anoAtual - 2;

    document.getElementById('ano2Label').innerText = `Ano: ${anoAnterior}`;
    document.getElementById('ano1Label').innerText = `Ano: ${anoDoisAnosAtras}`;
}

atualizarAnos();

// Função para calcular as médias e porcentagens com aumento de 8%
function calcularMedias() {
    const lucro1 = parseFloat(document.getElementById('lucro1').value);
    const lucro2 = parseFloat(document.getElementById('lucro2').value);
    const produzido1 = parseFloat(document.getElementById('produzido1').value);
    const produzido2 = parseFloat(document.getElementById('produzido2').value);

    const mediaLucro = (lucro1 + lucro2) / 2;
    const mediaProduzido = (produzido1 + produzido2) / 2;

    const aumentoPercentual = 0.08;
    const novoLucro = mediaLucro * (1 + aumentoPercentual);
    const aumentoEmReais = novoLucro - mediaLucro;

    // Cálculo do lucro por kg
    const lucroPorKgAntes = lucro1 / produzido1;
    const lucroPorKgDepois = novoLucro / mediaProduzido;

    const aumentoProduzidoPercentual = 0.08;
    const aumentoProduzido = mediaProduzido * aumentoProduzidoPercentual;
    const novaProducao = mediaProduzido + aumentoProduzido;


    // Exibição dos resultados
    document.getElementById('resultados').innerHTML = `
    
    Com base nas informações dos anos correspondentes, a sua empresa apresenta:
<ul>
    <li>Média de lucro anual de R$${mediaLucro.toFixed(2)}.</li>
    <li>Média de produção anual de lúpulo é de ${mediaProduzido.toFixed(2)} kg.</li>
    <li>O lucro por kg antes da implementação do sistema era de R$${lucroPorKgAntes.toFixed(2)}.</li>
    <li>Após a implementação do nosso sistema, o lucro por kg passa a ser R$${lucroPorKgDepois.toFixed(2)}.</li>
    <li><p>Com a implementação do nosso sistema, estima-se que o lucro pode aumentar em até 8%.</p></li>
    <li>Com isso, o lucro médio anual passa a ser de R$${novoLucro.toFixed(2)}, resultando em um aumento de R$${aumentoEmReais.toFixed(2)}.</li>
    <li>Além disso, a produção de lúpulo anual também deve aumentar em até 8%, elevando a média para ${novaProducao.toFixed(2)}kg, resultando em um incremento de  ${aumentoProduzido.toFixed(2)}kg.</li>
</ul>
`;
}
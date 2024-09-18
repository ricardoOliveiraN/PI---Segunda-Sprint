const int PINO_SENSOR_LDR = A3; // declara a entrada analógica
int valorLuminosidade; // declara uma variável


void setup() {
  Serial.begin(9600);
}
// configuração de iniciação e comunicação entre arduino e computador

void loop() {
  valorLuminosidade = analogRead(PINO_SENSOR_LDR);
  // os dados coletados pela porta analogica serão armazenados na variável
  // definindo labels/variáveis e valores que serão mostrados na tela para melhorar o entendimento do gráfico
  Serial.print("MiniVoltsMax:");
  Serial.print(900);
  Serial.print(" ");
  Serial.print("Luminosidade:");
  Serial.print(valorLuminosidade);
  Serial.print(" ");
  Serial.print("MiniVoltsMin:");
  Serial.println(400);

  delay(2000);
  // configura para atualizar os dados a cada 2 segundos
}

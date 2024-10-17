int ldr_pin = A5;
int ldr_read = 0;
float vin = 5.00;
float valor_ADC = 0.00488758, r_ohms = 10000;

void setup() {
    Serial.begin(9600);
}

void loop() {
        ldr_read = analogRead(ldr_pin);
        float volt = valor_ADC * ldr_read;
        float res_ldr = (r_ohms * (vin - volt)) / volt;
        float lumens = 500/(res_ldr/1000);


        Serial.print(lux);
    delay(2000);
}

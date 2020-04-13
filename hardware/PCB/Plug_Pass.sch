EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "jeu. 02 avril 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 2750 1550 0    60   ~ 0
D1(Tx)
Text Label 2750 1650 0    60   ~ 0
D0(Rx)
Text Label 2750 1750 0    60   ~ 0
Reset
Text Label 2750 1950 0    60   ~ 0
D2
Text Label 2750 2050 0    60   ~ 0
D3
Text Label 2750 2150 0    60   ~ 0
D4
Text Label 2750 2250 0    60   ~ 0
D5
Text Label 2750 2350 0    60   ~ 0
D6
Text Label 2750 2450 0    60   ~ 0
D7
Text Label 2750 2550 0    60   ~ 0
D8
Text Label 2750 2650 0    60   ~ 0
D9
Text Label 2750 2750 0    60   ~ 0
D10
Text Label 2750 2850 0    60   ~ 0
D11
Text Label 2750 2950 0    60   ~ 0
D12
Text Label 4600 2950 0    60   ~ 0
D13
Text Label 4600 2650 0    60   ~ 0
A0
Text Label 4600 2550 0    60   ~ 0
A1
Text Label 4600 2450 0    60   ~ 0
A2
Text Label 4600 2350 0    60   ~ 0
A3
Text Label 4600 2250 0    60   ~ 0
A4
Text Label 4600 2150 0    60   ~ 0
A5
Text Label 4600 2050 0    60   ~ 0
A6
Text Label 4600 1950 0    60   ~ 0
A7
Text Label 4600 2750 0    60   ~ 0
AREF
Text Label 4600 1750 0    60   ~ 0
Reset
Text Notes 500  600  0    60   ~ 0
Shield for Arduino Nano
Text Label 4300 1400 1    60   ~ 0
Vin
Wire Notes Line
	475  650  1675 650 
Wire Notes Line
	1675 650  1675 475 
$Comp
L Connector_Generic:Conn_01x15 P1
U 1 1 56D73FAC
P 3600 2250
F 0 "P1" H 3600 3050 50  0000 C CNN
F 1 "Digital" V 3700 2250 50  0000 C CNN
F 2 "Socket_Arduino_Nano:Socket_Strip_Arduino_1x15" H 3600 2250 50  0001 C CNN
F 3 "" H 3600 2250 50  0000 C CNN
	1    3600 2250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x15 P2
U 1 1 56D740C7
P 4000 2250
F 0 "P2" H 4000 3050 50  0000 C CNN
F 1 "Analog" V 4100 2250 50  0000 C CNN
F 2 "Socket_Arduino_Nano:Socket_Strip_Arduino_1x15" H 4000 2250 50  0001 C CNN
F 3 "" H 4000 2250 50  0000 C CNN
	1    4000 2250
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 56D7422C
P 3300 3050
F 0 "#PWR01" H 3300 2800 50  0001 C CNN
F 1 "GND" H 3300 2900 50  0000 C CNN
F 2 "" H 3300 3050 50  0000 C CNN
F 3 "" H 3300 3050 50  0000 C CNN
	1    3300 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1850 3300 1850
Wire Wire Line
	3300 1850 3300 3050
$Comp
L power:GND #PWR02
U 1 1 56D746ED
P 4300 3050
F 0 "#PWR02" H 4300 2800 50  0001 C CNN
F 1 "GND" H 4300 2900 50  0000 C CNN
F 2 "" H 4300 3050 50  0000 C CNN
F 3 "" H 4300 3050 50  0000 C CNN
	1    4300 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3050 4300 1650
Wire Wire Line
	4300 1650 4200 1650
Wire Wire Line
	4200 1550 4300 1550
$Comp
L power:+5V #PWR03
U 1 1 56D747E8
P 4400 1400
F 0 "#PWR03" H 4400 1250 50  0001 C CNN
F 1 "+5V" V 4400 1600 28  0000 C CNN
F 2 "" H 4400 1400 50  0000 C CNN
F 3 "" H 4400 1400 50  0000 C CNN
	1    4400 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 1400 4400 1850
Wire Wire Line
	4400 1850 4200 1850
Wire Wire Line
	4500 1400 4500 2850
Wire Wire Line
	4500 2850 4200 2850
Text Notes 3700 1550 0    60   ~ 0
1
$Comp
L Plug_Pass:DS3231M U?
U 1 1 5E8F612C
P 10450 5200
F 0 "U?" H 10100 5550 50  0000 C CNN
F 1 "DS3231M" H 10750 4800 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_7.5x10.3mm_P1.27mm" H 10450 4600 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/DS3231.pdf" H 10720 5250 50  0001 C CNN
	1    10450 5200
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:IRM-10-5 PS?
U 1 1 5E90266B
P 3850 6100
F 0 "PS?" H 3650 6350 50  0000 C CNN
F 1 "IRM-10-5" H 3850 5850 50  0000 C CNN
F 2 "Converter_ACDC:Converter_ACDC_MeanWell_IRM-10-xx_THT" H 3850 5750 50  0001 C CNN
F 3 "https://www.meanwell.com/Upload/PDF/IRM-10/IRM-10-SPEC.PDF" H 3850 5700 50  0001 C CNN
	1    3850 6100
	0    -1   -1   0   
$EndComp
$Comp
L Plug_Pass:G5LE-14_DC5 RLY?
U 1 1 5E903161
P 3850 4800
F 0 "RLY?" V 3385 4800 50  0000 C CNN
F 1 "G5LE-14_DC5" V 3476 4800 50  0000 C CNN
F 2 "digikey-footprints:Relay_THT_G5LE-14" H 4050 5000 50  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 4050 5100 60  0001 L CNN
F 4 "Z1011-ND" H 4050 5200 60  0001 L CNN "Digi-Key_PN"
F 5 "G5LE-14 DC5" H 4050 5300 60  0001 L CNN "MPN"
F 6 "Relays" H 4050 5400 60  0001 L CNN "Category"
F 7 "Power Relays, Over 2 Amps" H 4050 5500 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 4050 5600 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/G5LE-14-DC5/Z1011-ND/280371" H 4050 5700 60  0001 L CNN "DK_Detail_Page"
F 10 "RELAY GEN PURPOSE SPDT 10A 5V" H 4050 5800 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 4050 5900 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4050 6000 60  0001 L CNN "Status"
	1    3850 4800
	0    1    1    0   
$EndComp
$Comp
L Plug_Pass:RF_PN532_Breakout U?
U 1 1 5E8E6712
P 8200 5200
F 0 "U?" H 7900 5750 50  0000 L CNN
F 1 "RF_PN532_Breakout" V 8650 4850 50  0000 L CNN
F 2 "RF_Module:nRF24L01_Breakout" H 8350 5800 50  0001 L CIN
F 3 "http://www.nordicsemi.com/eng/content/download/2730/34105/file/nRF24L01_Product_Specification_v2_0.pdf" H 8200 5100 50  0001 C CNN
	1    8200 5200
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:VCC #PWR?
U 1 1 5E8ED344
P 8200 4500
F 0 "#PWR?" H 8200 4350 50  0001 C CNN
F 1 "VCC" H 8218 4673 50  0000 C CNN
F 2 "" H 8200 4500 50  0001 C CNN
F 3 "" H 8200 4500 50  0001 C CNN
	1    8200 4500
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:VCC #PWR?
U 1 1 5E8ED62D
P 10350 4700
F 0 "#PWR?" H 10350 4550 50  0001 C CNN
F 1 "VCC" H 10367 4873 50  0000 C CNN
F 2 "" H 10350 4700 50  0001 C CNN
F 3 "" H 10350 4700 50  0001 C CNN
	1    10350 4700
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:VCC #PWR?
U 1 1 5E8EE3A2
P 4300 850
F 0 "#PWR?" H 4300 700 50  0001 C CNN
F 1 "VCC" H 4317 1023 50  0000 C CNN
F 2 "" H 4300 850 50  0001 C CNN
F 3 "" H 4300 850 50  0001 C CNN
	1    4300 850 
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR?
U 1 1 5E8EFBFD
P 8200 5950
F 0 "#PWR?" H 8200 5700 50  0001 C CNN
F 1 "GNDREF" H 8205 5777 50  0000 C CNN
F 2 "" H 8200 5950 50  0001 C CNN
F 3 "" H 8200 5950 50  0001 C CNN
	1    8200 5950
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR?
U 1 1 5E8EFF11
P 10450 5700
F 0 "#PWR?" H 10450 5450 50  0001 C CNN
F 1 "GNDREF" H 10455 5527 50  0000 C CNN
F 2 "" H 10450 5700 50  0001 C CNN
F 3 "" H 10450 5700 50  0001 C CNN
	1    10450 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 850  4300 1550
Wire Wire Line
	8200 5800 8200 5950
Wire Wire Line
	8200 4600 8200 4500
Wire Wire Line
	10450 5600 10450 5700
Wire Wire Line
	10350 4800 10350 4700
Text Notes 7050 600  0    50   ~ 0
Shield for breakout modules
Wire Notes Line
	8200 650  8200 500 
Wire Notes Line
	7000 650  8200 650 
$Comp
L Plug_Pass:Conn_01x15_MountingPin J?
U 1 1 5E93F988
P 7800 2150
F 0 "J?" H 7900 2950 50  0000 C CNN
F 1 "Conn_01x15_MountingPin" V 7900 2200 50  0000 C CNN
F 2 "" H 7800 2150 50  0001 C CNN
F 3 "~" H 7800 2150 50  0001 C CNN
	1    7800 2150
	-1   0    0    -1  
$EndComp
$Comp
L Plug_Pass:Conn_01x15_MountingPin J?
U 1 1 5E93FE63
P 10450 2150
F 0 "J?" H 10350 2950 50  0000 L CNN
F 1 "Conn_01x15_MountingPin" V 10550 1700 50  0000 L CNN
F 2 "" H 10450 2150 50  0001 C CNN
F 3 "~" H 10450 2150 50  0001 C CNN
	1    10450 2150
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:Conn_01x08 J?
U 1 1 5E94727E
P 9200 2500
F 0 "J?" H 9100 2900 50  0000 L CNN
F 1 "Conn_01x08" V 9300 2250 50  0000 L CNN
F 2 "" H 9200 2500 50  0001 C CNN
F 3 "~" H 9200 2500 50  0001 C CNN
	1    9200 2500
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:Conn_01x06 J?
U 1 1 5E948590
P 9000 1650
F 0 "J?" H 9050 1950 50  0000 C CNN
F 1 "Conn_01x06" V 9100 1650 50  0000 C CNN
F 2 "" H 9000 1650 50  0001 C CNN
F 3 "~" H 9000 1650 50  0001 C CNN
	1    9000 1650
	-1   0    0    -1  
$EndComp
$Comp
L Plug_Pass:Conn_01x06 J?
U 1 1 5E94C5A7
P 9050 5150
F 0 "J?" H 9100 5450 50  0000 C CNN
F 1 "Conn_01x06" V 9150 5100 50  0000 C CNN
F 2 "" H 9050 5150 50  0001 C CNN
F 3 "~" H 9050 5150 50  0001 C CNN
	1    9050 5150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10950 5000 10950 4450
Wire Wire Line
	10950 4450 9450 4450
Wire Wire Line
	9450 4450 9450 4950
Wire Wire Line
	10950 5300 10950 6000
Wire Wire Line
	10950 6000 9700 6000
Wire Wire Line
	9700 6000 9700 5050
Wire Wire Line
	9700 5050 9250 5050
Wire Wire Line
	9950 5100 9550 5100
Wire Wire Line
	9550 5100 9550 5250
Wire Wire Line
	9550 5250 9250 5250
Wire Wire Line
	10350 4700 9650 4700
Wire Wire Line
	9650 4700 9650 5350
Wire Wire Line
	9650 5350 9550 5350
Connection ~ 10350 4700
Wire Wire Line
	10450 5600 9350 5600
Wire Wire Line
	9350 5600 9350 5450
Wire Wire Line
	9350 5450 9250 5450
Connection ~ 10450 5600
$Comp
L Plug_Pass:GNDREF #PWR?
U 1 1 5E9576C1
P 9350 5600
F 0 "#PWR?" H 9350 5350 50  0001 C CNN
F 1 "GNDREF" H 9355 5427 50  0000 C CNN
F 2 "" H 9350 5600 50  0001 C CNN
F 3 "" H 9350 5600 50  0001 C CNN
	1    9350 5600
	1    0    0    -1  
$EndComp
Connection ~ 9350 5600
$Comp
L Plug_Pass:VCC #PWR?
U 1 1 5E957BD2
P 9550 5350
F 0 "#PWR?" H 9550 5200 50  0001 C CNN
F 1 "VCC" H 9567 5523 50  0000 C CNN
F 2 "" H 9550 5350 50  0001 C CNN
F 3 "" H 9550 5350 50  0001 C CNN
	1    9550 5350
	-1   0    0    1   
$EndComp
Text Notes 8800 4050 0    50   ~ 0
Real-Time Clock Module - DS3231 AT24C32
Wire Notes Line
	8750 4100 10600 4100
Wire Notes Line
	10600 4100 10600 3900
Connection ~ 9550 5350
Wire Wire Line
	9550 5350 9250 5350
Text Label 9250 5250 0    50   ~ 0
SDA
Text Label 9250 5150 0    50   ~ 0
SCL
Text Label 9250 5050 0    50   ~ 0
SQW
Text Label 9250 4950 0    50   ~ 0
32K
Wire Wire Line
	9250 4950 9450 4950
Wire Wire Line
	9500 5150 9500 5000
Wire Wire Line
	9500 5000 9950 5000
Wire Wire Line
	9250 5150 9500 5150
Text Label 9250 5350 0    50   ~ 0
VCC
Text Label 9250 5450 0    50   ~ 0
GND
$Comp
L Plug_Pass:Conn_01x08 J?
U 1 1 5E971DCA
P 7250 5150
F 0 "J?" H 7250 5550 50  0000 L CNN
F 1 "Conn_01x08" V 7350 4850 50  0000 L CNN
F 2 "" H 7250 5150 50  0001 C CNN
F 3 "~" H 7250 5150 50  0001 C CNN
	1    7250 5150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7700 4850 7450 4850
Wire Wire Line
	7700 4950 7450 4950
Wire Wire Line
	7700 5050 7450 5050
Wire Wire Line
	7700 5150 7450 5150
Wire Wire Line
	8200 4500 7650 4500
Wire Wire Line
	7650 4500 7650 5250
Wire Wire Line
	7650 5250 7450 5250
Connection ~ 8200 4500
Wire Wire Line
	8200 5950 7650 5950
Connection ~ 8200 5950
Wire Wire Line
	7700 5450 7450 5450
Wire Wire Line
	7700 5550 7450 5550
Wire Wire Line
	7650 5350 7650 5950
Wire Wire Line
	7450 5350 7650 5350
Wire Notes Line
	7000 4100 8050 4100
Wire Notes Line
	8050 4100 8050 3900
Text Notes 7050 4050 0    50   ~ 0
NFC RFID PN532 Module
Text Label 7450 4850 0    50   ~ 0
SCK
Text Label 7450 4950 0    50   ~ 0
MISO
Text Label 7450 5050 0    50   ~ 0
MOSI
Text Label 7450 5150 0    50   ~ 0
SS
Text Label 7450 5250 0    50   ~ 0
VCC
Text Label 7450 5350 0    50   ~ 0
GND
Text Label 7450 5450 0    50   ~ 0
IRQ
Text Label 7450 5550 0    50   ~ 0
RSTO
NoConn ~ 9000 2800
NoConn ~ 9000 2900
NoConn ~ 9200 1450
NoConn ~ 9200 1550
Wire Wire Line
	10250 1750 9900 1750
Wire Wire Line
	9900 1750 9900 1250
Wire Wire Line
	9900 1750 9900 1850
Wire Wire Line
	9900 1850 9200 1850
Connection ~ 9900 1750
$Comp
L Plug_Pass:VCC #PWR?
U 1 1 5E9C0FBB
P 9900 1250
F 0 "#PWR?" H 9900 1100 50  0001 C CNN
F 1 "VCC" H 9900 1400 50  0000 C CNN
F 2 "" H 9900 1250 50  0001 C CNN
F 3 "" H 9900 1250 50  0001 C CNN
	1    9900 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 1850 9900 3050
Wire Wire Line
	9900 3050 8800 3050
Wire Wire Line
	8800 3050 8800 2600
Wire Wire Line
	8800 2600 9000 2600
Connection ~ 9900 1850
Wire Wire Line
	10250 1550 10100 1550
Wire Wire Line
	9750 1550 9750 1950
Wire Wire Line
	9750 1950 9200 1950
Wire Wire Line
	10100 1550 10100 1250
Connection ~ 10100 1550
Wire Wire Line
	10100 1550 9750 1550
$Comp
L Plug_Pass:GNDREF #PWR?
U 1 1 5E9CA894
P 10100 1250
F 0 "#PWR?" H 10100 1000 50  0001 C CNN
F 1 "GNDREF" H 10050 1100 50  0000 C CNN
F 2 "" H 10100 1250 50  0001 C CNN
F 3 "" H 10100 1250 50  0001 C CNN
	1    10100 1250
	-1   0    0    1   
$EndComp
Wire Wire Line
	10250 2150 9650 2150
Wire Wire Line
	9650 2150 9650 1650
Wire Wire Line
	9650 1650 9200 1650
Wire Wire Line
	10250 2050 9550 2050
Wire Wire Line
	9550 2050 9550 1750
Wire Wire Line
	9550 1750 9200 1750
Text Label 9200 1650 0    50   ~ 0
SCL
Text Label 9200 1750 0    50   ~ 0
SDA
Text Label 9200 1850 0    50   ~ 0
VCC
Text Label 9200 1950 0    50   ~ 0
GND
Text Label 9000 2600 2    50   ~ 0
VCC
Wire Wire Line
	9000 2700 8700 2700
Wire Wire Line
	8700 2700 8700 3100
$Comp
L Plug_Pass:GNDREF #PWR?
U 1 1 5E9D70CA
P 8700 3100
F 0 "#PWR?" H 8700 2850 50  0001 C CNN
F 1 "GNDREF" H 8700 2950 50  0000 C CNN
F 2 "" H 8700 3100 50  0001 C CNN
F 3 "" H 8700 3100 50  0001 C CNN
	1    8700 3100
	1    0    0    -1  
$EndComp
Text Label 9000 2700 2    50   ~ 0
GND
Text Label 9000 2500 2    50   ~ 0
SS
Text Label 9000 2400 2    50   ~ 0
MOSI
Text Label 9000 2300 2    50   ~ 0
MISO
Text Label 9000 2200 2    50   ~ 0
SCK
Text Label 8000 1850 0    50   ~ 0
D2
Text Label 8000 1950 0    50   ~ 0
D3
Text Label 8000 2050 0    50   ~ 0
D4
Text Label 8000 2150 0    50   ~ 0
D5
Text Label 10250 1550 2    50   ~ 0
GND
Text Label 10250 1750 2    50   ~ 0
5V
Text Label 10250 2050 2    50   ~ 0
A5
Text Label 10250 2150 2    50   ~ 0
A4
Wire Notes Line
	7000 6550 6950 6550
Wire Notes Line
	7000 500  7000 6550
Wire Notes Line
	8750 3900 8750 6550
Wire Notes Line
	450  3900 11200 3900
$Comp
L Plug_Pass:Conn_01x15_MountingPin J?
U 1 1 5EA3EB9A
P 1450 2250
F 0 "J?" H 1550 3050 50  0000 C CNN
F 1 "Conn_01x15_MountingPin" V 1600 2250 50  0000 C CNN
F 2 "" H 1450 2250 50  0001 C CNN
F 3 "~" H 1450 2250 50  0001 C CNN
	1    1450 2250
	-1   0    0    -1  
$EndComp
$Comp
L Plug_Pass:Conn_01x15_MountingPin J?
U 1 1 5EA42CA7
P 6050 2250
F 0 "J?" H 5950 3050 50  0000 L CNN
F 1 "Conn_01x15_MountingPin" V 6150 1800 50  0000 L CNN
F 2 "" H 6050 2250 50  0001 C CNN
F 3 "~" H 6050 2250 50  0001 C CNN
	1    6050 2250
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:Conn_01x15_MountingPin J?
U 1 1 5EA4BE95
P 1450 5150
F 0 "J?" H 1550 5950 50  0000 C CNN
F 1 "Conn_01x15_MountingPin" V 1550 5150 50  0000 C CNN
F 2 "" H 1450 5150 50  0001 C CNN
F 3 "~" H 1450 5150 50  0001 C CNN
	1    1450 5150
	-1   0    0    -1  
$EndComp
$Comp
L Plug_Pass:Conn_01x15_MountingPin J?
U 1 1 5EA4C8E8
P 6000 5100
F 0 "J?" H 5850 5950 50  0000 L CNN
F 1 "Conn_01x15_MountingPin" V 6150 4650 50  0000 L CNN
F 2 "" H 6000 5100 50  0001 C CNN
F 3 "~" H 6000 5100 50  0001 C CNN
	1    6000 5100
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:OSTTC030162 J?
U 1 1 5EA69357
P 3750 7050
F 0 "J?" H 4028 7179 50  0000 L CNN
F 1 "OSTTC030162" H 3150 7050 50  0000 L CNN
F 2 "digikey-footprints:Term_Block_1x3_P5mm" H 3950 7250 60  0001 L CNN
F 3 "http://www.on-shore.com/wp-content/uploads/OSTTCXX0162.pdf" H 3950 7350 60  0001 L CNN
F 4 "ED2601-ND" H 3950 7450 60  0001 L CNN "Digi-Key_PN"
F 5 "OSTTC030162" H 3950 7550 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 3950 7650 60  0001 L CNN "Category"
F 7 "Terminal Blocks - Wire to Board" H 3950 7750 60  0001 L CNN "Family"
F 8 "http://www.on-shore.com/wp-content/uploads/OSTTCXX0162.pdf" H 3950 7850 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/on-shore-technology-inc/OSTTC030162/ED2601-ND/614550" H 3950 7950 60  0001 L CNN "DK_Detail_Page"
F 10 "TERM BLK 3POS SIDE ENTRY 5MM PCB" H 3950 8050 60  0001 L CNN "Description"
F 11 "On Shore Technology Inc." H 3950 8150 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3950 8250 60  0001 L CNN "Status"
	1    3750 7050
	1    0    0    -1  
$EndComp
Wire Bus Line
	3850 6850 3850 6750
Wire Bus Line
	3850 6750 3950 6750
Wire Bus Line
	3950 6750 3950 6850
Wire Wire Line
	4350 5400 3350 5400
Wire Wire Line
	3750 6850 3750 6500
Wire Wire Line
	3750 5500 4800 5500
Wire Wire Line
	4800 5500 4800 4400
Wire Wire Line
	4800 4400 5800 4400
Wire Wire Line
	3750 5500 3750 5700
Wire Wire Line
	4950 5700 4950 4500
Wire Wire Line
	4950 4500 5800 4500
Wire Wire Line
	4150 4600 4300 4600
Wire Wire Line
	4300 4600 4300 4500
$Comp
L Plug_Pass:GNDREF #PWR?
U 1 1 5EA95451
P 4650 5800
F 0 "#PWR?" H 4650 5550 50  0001 C CNN
F 1 "GNDREF" H 4650 5650 50  0000 C CNN
F 2 "" H 4650 5800 50  0001 C CNN
F 3 "" H 4650 5800 50  0001 C CNN
	1    4650 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 5700 4650 5700
$Comp
L Plug_Pass:GNDREF #PWR?
U 1 1 5EA96339
P 4300 4500
F 0 "#PWR?" H 4300 4250 50  0001 C CNN
F 1 "GNDREF" H 4300 4350 50  0000 C CNN
F 2 "" H 4300 4500 50  0001 C CNN
F 3 "" H 4300 4500 50  0001 C CNN
	1    4300 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4650 5700 4650 5800
Connection ~ 4650 5700
Wire Wire Line
	4650 5700 4950 5700
$Comp
L power:LINE #PWR?
U 1 1 5EA9C69D
P 3750 7250
F 0 "#PWR?" H 3750 7100 50  0001 C CNN
F 1 "LINE" H 3600 7300 50  0000 C CNN
F 2 "" H 3750 7250 50  0001 C CNN
F 3 "" H 3750 7250 50  0001 C CNN
	1    3750 7250
	1    0    0    -1  
$EndComp
$Comp
L power:NEUT #PWR?
U 1 1 5EA9CAA7
P 3850 7100
F 0 "#PWR?" H 3850 6950 50  0001 C CNN
F 1 "NEUT" H 3850 7300 50  0000 C CNN
F 2 "" H 3850 7100 50  0001 C CNN
F 3 "" H 3850 7100 50  0001 C CNN
	1    3850 7100
	-1   0    0    1   
$EndComp
Wire Wire Line
	3950 6500 3950 6750
$Comp
L power:NEUT #PWR?
U 1 1 5EABF1A9
P 3950 7250
F 0 "#PWR?" H 3950 7100 50  0001 C CNN
F 1 "NEUT" H 4100 7350 50  0000 C CNN
F 2 "" H 3950 7250 50  0001 C CNN
F 3 "" H 3950 7250 50  0001 C CNN
	1    3950 7250
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:QuickDisconnect U?
U 1 1 5EABFF68
P 3350 5200
F 0 "U?" H 3500 5300 50  0000 C CNN
F 1 "QuickDisconnect" H 3350 5050 50  0000 C CNN
F 2 "" H 3350 5200 50  0001 C CNN
F 3 "" H 3350 5200 50  0001 C CNN
	1    3350 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 5400 4350 7250
Wire Wire Line
	3950 7250 4350 7250
Wire Wire Line
	3350 5050 3350 4900
Wire Wire Line
	3350 4900 3550 4900
$Comp
L Plug_Pass:QuickDisconnect U?
U 1 1 5EADCBC4
P 4400 4800
F 0 "U?" H 4400 4700 50  0000 C CNN
F 1 "QuickDisconnect" H 4400 4900 50  0000 C CNN
F 2 "" H 4400 4800 50  0001 C CNN
F 3 "" H 4400 4800 50  0001 C CNN
	1    4400 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 4800 4150 4800
Wire Wire Line
	4600 4800 4600 5250
Wire Wire Line
	4600 5250 5200 5250
Wire Wire Line
	1650 5850 2150 5850
Wire Wire Line
	2150 5850 2150 4600
Wire Wire Line
	2150 4600 3550 4600
$Comp
L Plug_Pass:Conn_WallSocket_Earth J?
U 1 1 5EAEB62E
P 5800 7000
F 0 "J?" H 6054 7011 50  0000 L CNN
F 1 "Conn_WallSocket_Earth" V 6200 6700 50  0000 L CNN
F 2 "" H 5500 7100 50  0001 C CNN
F 3 "~" H 5500 7100 50  0001 C CNN
	1    5800 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 7000 5600 7000
Wire Wire Line
	5200 5250 5200 7000
Wire Wire Line
	3750 7250 3750 7400
Wire Wire Line
	3750 7400 4950 7400
Wire Wire Line
	4950 7400 4950 6800
Wire Wire Line
	4950 6800 5500 6800
Text Label 1650 5850 0    50   ~ 0
D12
Text Label 5800 4400 2    50   ~ 0
VIN
Text Label 5800 4500 2    50   ~ 0
GND
Wire Wire Line
	4300 1550 5850 1550
Connection ~ 4300 1550
Wire Wire Line
	4300 1650 5850 1650
Connection ~ 4300 1650
Wire Wire Line
	4200 1750 5850 1750
Wire Wire Line
	4400 1850 5850 1850
Connection ~ 4400 1850
Wire Wire Line
	4200 2050 5850 2050
Wire Wire Line
	4200 1950 5850 1950
Wire Wire Line
	4200 2150 5850 2150
Wire Wire Line
	4200 2250 5850 2250
Wire Wire Line
	4200 2350 5850 2350
Wire Wire Line
	4200 2450 5850 2450
Wire Wire Line
	4200 2550 5850 2550
Wire Wire Line
	4200 2650 5850 2650
Wire Wire Line
	4200 2750 5850 2750
Wire Wire Line
	4500 2850 5850 2850
Connection ~ 4500 2850
Wire Wire Line
	4200 2950 5850 2950
Wire Wire Line
	1650 1550 3400 1550
Wire Wire Line
	1650 1650 3400 1650
Wire Wire Line
	1650 1750 3400 1750
Wire Wire Line
	3300 1850 1650 1850
Connection ~ 3300 1850
Wire Wire Line
	3400 1950 1650 1950
Wire Wire Line
	3400 2050 1650 2050
Wire Wire Line
	3400 2150 1650 2150
Wire Wire Line
	3400 2250 1650 2250
Wire Wire Line
	1650 2350 3400 2350
Wire Wire Line
	1650 2450 3400 2450
Wire Wire Line
	1650 2550 3400 2550
Wire Wire Line
	1650 2650 3400 2650
Wire Wire Line
	1650 2750 3400 2750
Wire Wire Line
	1650 2850 3400 2850
Wire Wire Line
	1650 2950 3400 2950
$Comp
L power:+3V3 #PWR?
U 1 1 5E9D4087
P 4500 1400
F 0 "#PWR?" H 4500 1250 50  0001 C CNN
F 1 "+3V3" V 4500 1600 39  0000 C CNN
F 2 "" H 4500 1400 50  0001 C CNN
F 3 "" H 4500 1400 50  0001 C CNN
	1    4500 1400
	1    0    0    -1  
$EndComp
NoConn ~ 5800 4600
NoConn ~ 5800 4700
NoConn ~ 5800 4800
NoConn ~ 5800 4900
NoConn ~ 5800 5000
NoConn ~ 5800 5100
NoConn ~ 5800 5200
NoConn ~ 5800 5300
NoConn ~ 5800 5400
NoConn ~ 5800 5500
NoConn ~ 5800 5600
NoConn ~ 5800 5700
NoConn ~ 5800 5800
NoConn ~ 1650 4450
NoConn ~ 1650 4550
NoConn ~ 1650 4650
NoConn ~ 1650 4750
NoConn ~ 1650 4850
NoConn ~ 1650 4950
NoConn ~ 1650 5050
NoConn ~ 1650 5150
NoConn ~ 1650 5250
NoConn ~ 1650 5350
NoConn ~ 1650 5450
NoConn ~ 1650 5550
NoConn ~ 1650 5650
NoConn ~ 1650 5750
NoConn ~ 10250 1650
NoConn ~ 10250 1850
NoConn ~ 10250 1950
NoConn ~ 10250 2250
NoConn ~ 10250 2350
NoConn ~ 10250 2450
NoConn ~ 10250 2550
NoConn ~ 10250 2650
NoConn ~ 10250 2750
NoConn ~ 10250 2850
NoConn ~ 8000 2850
NoConn ~ 8000 2750
NoConn ~ 8000 2650
NoConn ~ 8000 2550
NoConn ~ 8000 2450
NoConn ~ 8000 2350
NoConn ~ 8000 2250
NoConn ~ 8000 1750
NoConn ~ 8000 1650
NoConn ~ 8000 1550
NoConn ~ 8000 1450
NoConn ~ 4150 5000
$Comp
L power:LINE #PWR?
U 1 1 5E94FB8A
P 5500 6800
F 0 "#PWR?" H 5500 6650 50  0001 C CNN
F 1 "LINE" H 5350 6850 50  0000 C CNN
F 2 "" H 5500 6800 50  0001 C CNN
F 3 "" H 5500 6800 50  0001 C CNN
	1    5500 6800
	1    0    0    -1  
$EndComp
Connection ~ 5500 6800
Wire Wire Line
	5500 6800 5600 6800
Wire Wire Line
	8600 1850 8600 2200
Wire Wire Line
	8600 2200 9000 2200
Wire Wire Line
	8000 1850 8600 1850
Wire Wire Line
	8000 1950 8500 1950
Wire Wire Line
	8500 1950 8500 2300
Wire Wire Line
	8500 2300 9000 2300
Wire Wire Line
	8000 2050 8400 2050
Wire Wire Line
	8400 2050 8400 2400
Wire Wire Line
	8400 2400 9000 2400
Wire Wire Line
	8000 2150 8300 2150
Wire Wire Line
	8300 2150 8300 2500
Wire Wire Line
	8300 2500 9000 2500
$EndSCHEMATC

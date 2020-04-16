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
Text Notes 550  600  0    60   ~ 0
Shield for Arduino Nano, PN532, and RTC3231 sockets
Wire Notes Line
	475  650  1675 650 
Wire Notes Line
	3175 650  3175 475 
$Comp
L power:+5V #PWR02
U 1 1 56D747E8
P 6250 850
F 0 "#PWR02" H 6250 700 50  0001 C CNN
F 1 "+5V" V 6250 1050 28  0000 C CNN
F 2 "" H 6250 850 50  0000 C CNN
F 3 "" H 6250 850 50  0000 C CNN
	1    6250 850 
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:G5LE-14_DC5 RLY1
U 1 1 5E903161
P 4650 6000
F 0 "RLY1" V 4185 6000 50  0000 C CNN
F 1 "T95S5D22-5" V 4276 6000 50  0000 C CNN
F 2 "Plug_Pass:RLY-T9AS5D22-5" H 4850 6200 50  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1308242_T9A&DocType=DS&DocLang=English" H 4850 6300 60  0001 L CNN
F 4 "PB1015-ND" H 4850 6400 60  0001 L CNN "Digi-Key_PN"
F 5 "T9AS5D22-5" H 4850 6500 60  0001 L CNN "MPN"
F 6 "Relays" H 4850 6600 60  0001 L CNN "Category"
F 7 "Power Relays, Over 2 Amps" H 4850 6700 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1308242_T9A&DocType=DS&DocLang=English" H 4850 6800 60  0001 L CNN "DK_Datasheet_Link"
F 9 "https://www.digikey.com/product-detail/en/te-connectivity-potter-brumfield-relays/T9AS5D22-5/PB1015-ND/1095336" H 4850 6900 60  0001 L CNN "DK_Detail_Page"
F 10 "RELAY GEN PURPOSE SPDT 20A 5V" H 4850 7000 60  0001 L CNN "Description"
F 11 "TE Connectivity Potter & Brumfield Relays" H 4850 7100 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4850 7200 60  0001 L CNN "Status"
	1    4650 6000
	0    1    1    0   
$EndComp
$Comp
L Plug_Pass:VCC #PWR01
U 1 1 5E8EE3A2
P 5950 850
F 0 "#PWR01" H 5950 700 50  0001 C CNN
F 1 "VCC" H 5967 1023 50  0000 C CNN
F 2 "" H 5950 850 50  0001 C CNN
F 3 "" H 5950 850 50  0001 C CNN
	1    5950 850 
	1    0    0    -1  
$EndComp
Text Notes 500  3850 0    50   ~ 0
Shield for Power Supply and Relay shield
$Comp
L Plug_Pass:Conn_01x06 J1
U 1 1 5E94C5A7
P 8300 1950
F 0 "J1" H 8350 2250 50  0000 C CNN
F 1 "Conn_01x06" V 8400 1900 50  0000 C CNN
F 2 "Plug_Pass:PinSocket_1x06_P2.54mm_Vertical" H 8300 1950 50  0001 C CNN
F 3 "~" H 8300 1950 50  0001 C CNN
	1    8300 1950
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR07
U 1 1 5E9576C1
P 7850 2400
F 0 "#PWR07" H 7850 2150 50  0001 C CNN
F 1 "GNDREF" H 7855 2227 50  0000 C CNN
F 2 "" H 7850 2400 50  0001 C CNN
F 3 "" H 7850 2400 50  0001 C CNN
	1    7850 2400
	-1   0    0    -1  
$EndComp
Text Label 8100 2050 2    50   ~ 0
SDA
Text Label 8100 1950 2    50   ~ 0
SCL
Text Label 8100 1850 2    50   ~ 0
SQW
Text Label 8100 1750 2    50   ~ 0
32K
Text Label 8100 2150 2    50   ~ 0
VCC
Text Label 8100 2250 2    50   ~ 0
GND
$Comp
L Plug_Pass:Conn_01x08 J2
U 1 1 5E971DCA
P 3500 1950
F 0 "J2" H 3500 2350 50  0000 L CNN
F 1 "Conn_01x08" V 3600 1650 50  0000 L CNN
F 2 "Plug_Pass:PinSocket_1x08_P2.54mm_Vertical" H 3500 1950 50  0001 C CNN
F 3 "~" H 3500 1950 50  0001 C CNN
	1    3500 1950
	-1   0    0    -1  
$EndComp
Text Label 3700 1650 0    50   ~ 0
SCK
Text Label 3700 1750 0    50   ~ 0
MISO
Text Label 3700 1850 0    50   ~ 0
MOSI
Text Label 3700 1950 0    50   ~ 0
SS
Text Label 3700 2050 0    50   ~ 0
VCC
Text Label 3700 2150 0    50   ~ 0
GND
Text Label 3700 2250 0    50   ~ 0
IRQ
Text Label 3700 2350 0    50   ~ 0
RSTO
Wire Notes Line
	7000 6550 6950 6550
Wire Wire Line
	4950 5800 5100 5800
Wire Wire Line
	5100 5800 5100 5700
$Comp
L Plug_Pass:GNDREF #PWR014
U 1 1 5EA96339
P 5100 5700
F 0 "#PWR014" H 5100 5450 50  0001 C CNN
F 1 "GNDREF" H 5100 5550 50  0000 C CNN
F 2 "" H 5100 5700 50  0001 C CNN
F 3 "" H 5100 5700 50  0001 C CNN
	1    5100 5700
	-1   0    0    1   
$EndComp
$Comp
L power:NEUT #PWR020
U 1 1 5EABF1A9
P 6450 7150
F 0 "#PWR020" H 6450 7000 50  0001 C CNN
F 1 "NEUT" H 6300 7150 50  0000 C CNN
F 2 "" H 6450 7150 50  0001 C CNN
F 3 "" H 6450 7150 50  0001 C CNN
	1    6450 7150
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:QuickDisconnect J9
U 1 1 5EABFF68
P 4000 6100
F 0 "J9" H 4150 6200 50  0000 C CNN
F 1 "QuickDisconnect" H 3900 6000 50  0000 C CNN
F 2 "" H 4000 6100 50  0001 C CNN
F 3 "" H 4000 6100 50  0001 C CNN
	1    4000 6100
	-1   0    0    1   
$EndComp
Wire Wire Line
	4150 6100 4250 6100
$Comp
L Plug_Pass:QuickDisconnect J8
U 1 1 5EADCBC4
P 5200 6000
F 0 "J8" H 5200 5900 50  0000 C CNN
F 1 "QuickDisconnect" H 5200 6100 50  0000 C CNN
F 2 "" H 5200 6000 50  0001 C CNN
F 3 "" H 5200 6000 50  0001 C CNN
	1    5200 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 6000 4950 6000
$Comp
L Plug_Pass:Conn_WallSocket_Earth J5
U 1 1 5EAEB62E
P 6750 4850
F 0 "J5" H 7004 4861 50  0000 L CNN
F 1 "Conn_WallSocket_Earth" V 7150 4550 50  0000 L CNN
F 2 "" H 6450 4950 50  0001 C CNN
F 3 "~" H 6450 4950 50  0001 C CNN
	1    6750 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR03
U 1 1 5E9D4087
P 6150 850
F 0 "#PWR03" H 6150 700 50  0001 C CNN
F 1 "+3V3" V 6150 1050 39  0000 C CNN
F 2 "" H 6150 850 50  0001 C CNN
F 3 "" H 6150 850 50  0001 C CNN
	1    6150 850 
	1    0    0    -1  
$EndComp
NoConn ~ 4950 6200
$Comp
L power:NEUT #PWR013
U 1 1 5E9B5493
P 6400 4850
F 0 "#PWR013" H 6400 4700 50  0001 C CNN
F 1 "NEUT" H 6550 4950 50  0000 C CNN
F 2 "" H 6400 4850 50  0001 C CNN
F 3 "" H 6400 4850 50  0001 C CNN
	1    6400 4850
	-1   0    0    1   
$EndComp
$Comp
L Plug_Pass:QuickDisconnect J6
U 1 1 5E98B561
P 4000 4950
F 0 "J6" H 4150 5050 50  0000 C CNN
F 1 "QuickDisconnect" H 4000 4800 50  0000 C CNN
F 2 "" H 4000 4950 50  0001 C CNN
F 3 "" H 4000 4950 50  0001 C CNN
	1    4000 4950
	-1   0    0    1   
$EndComp
$Comp
L Plug_Pass:QuickDisconnect J4
U 1 1 5E98BCE6
P 5250 4850
F 0 "J4" H 5250 4750 50  0000 C CNN
F 1 "QuickDisconnect" H 5250 4950 50  0000 C CNN
F 2 "" H 5250 4850 50  0001 C CNN
F 3 "" H 5250 4850 50  0001 C CNN
	1    5250 4850
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR012
U 1 1 5E98CA97
P 5150 4550
F 0 "#PWR012" H 5150 4300 50  0001 C CNN
F 1 "GNDREF" H 5150 4400 50  0000 C CNN
F 2 "" H 5150 4550 50  0001 C CNN
F 3 "" H 5150 4550 50  0001 C CNN
	1    5150 4550
	-1   0    0    1   
$EndComp
$Comp
L Plug_Pass:G5LE-14_DC5 RLY2
U 1 1 5E98DD8A
P 4650 4850
F 0 "RLY2" V 4185 4850 50  0000 C CNN
F 1 "T95S5D22-5" V 4276 4850 50  0000 C CNN
F 2 "Plug_Pass:RLY-T9AS5D22-5" H 4850 5050 50  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1308242_T9A&DocType=DS&DocLang=English" H 4850 5150 60  0001 L CNN
F 4 "PB1015-ND" H 4850 5250 60  0001 L CNN "Digi-Key_PN"
F 5 "T9AS5D22-5" H 4850 5350 60  0001 L CNN "MPN"
F 6 "Relays" H 4850 5450 60  0001 L CNN "Category"
F 7 "Power Relays, Over 2 Amps" H 4850 5550 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1308242_T9A&DocType=DS&DocLang=English" H 4850 5650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "https://www.digikey.com/product-detail/en/te-connectivity-potter-brumfield-relays/T9AS5D22-5/PB1015-ND/1095336" H 4850 5750 60  0001 L CNN "DK_Detail_Page"
F 10 "RELAY GEN PURPOSE SPDT 20A 5V" H 4850 5850 60  0001 L CNN "Description"
F 11 "TE Connectivity Potter & Brumfield Relays" H 4850 5950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4850 6050 60  0001 L CNN "Status"
	1    4650 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	3650 4950 3800 4950
Wire Wire Line
	4150 4950 4350 4950
Connection ~ 6400 4850
Wire Wire Line
	6400 4850 6550 4850
Wire Wire Line
	5400 6000 5850 6000
Wire Wire Line
	5850 6000 5850 4650
Wire Wire Line
	5850 4650 6550 4650
Wire Wire Line
	6450 6750 6450 6050
Wire Wire Line
	6450 6050 7250 6050
Wire Wire Line
	6250 5850 7250 5850
Wire Wire Line
	6250 5850 6250 6650
Wire Wire Line
	6450 7500 5250 7500
Wire Wire Line
	5250 7500 5250 6400
Wire Wire Line
	5250 6400 6050 6400
Wire Wire Line
	6050 6400 6050 4850
Wire Wire Line
	6450 7150 6450 7500
Wire Wire Line
	6050 4850 6400 4850
Wire Wire Line
	4950 4850 5100 4850
Wire Wire Line
	4950 4650 5150 4650
Wire Wire Line
	5150 4650 5150 4550
NoConn ~ 4950 5050
$Comp
L Plug_Pass:Conn_01x06 J7
U 1 1 5EA5F967
P 8750 5750
F 0 "J7" H 8800 6050 50  0000 C CNN
F 1 "Conn_01x06" V 8850 5700 50  0000 C CNN
F 2 "Plug_Pass:PinSocket_1x06_P2.54mm_Vertical" H 8750 5750 50  0001 C CNN
F 3 "~" H 8750 5750 50  0001 C CNN
	1    8750 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 6050 8250 6050
Wire Wire Line
	8050 5850 8550 5850
Wire Wire Line
	3300 4050 3300 4650
Wire Wire Line
	3300 5800 4350 5800
Wire Wire Line
	4350 4650 3300 4650
Connection ~ 3300 4650
Wire Wire Line
	3300 4650 3300 5800
Text Label 8550 5850 2    50   ~ 0
VCC
Text Label 8550 6050 2    50   ~ 0
GND
Text Label 8550 5550 2    50   ~ 0
RelayPin
Wire Wire Line
	8100 5550 8100 4050
Wire Wire Line
	8100 5550 8550 5550
Wire Wire Line
	8100 4050 3300 4050
NoConn ~ 8550 5650
NoConn ~ 8550 5750
NoConn ~ 8550 5950
$Comp
L Plug_Pass:GNDREF #PWR015
U 1 1 5EAB1350
P 8250 6150
F 0 "#PWR015" H 8250 5900 50  0001 C CNN
F 1 "GNDREF" H 8250 6000 50  0000 C CNN
F 2 "" H 8250 6150 50  0001 C CNN
F 3 "" H 8250 6150 50  0001 C CNN
	1    8250 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 6050 8250 6150
Connection ~ 8250 6050
Wire Wire Line
	8250 6050 8550 6050
$Comp
L Plug_Pass:Conn_01x06 J3
U 1 1 5EB180BD
P 3500 2850
F 0 "J3" H 3550 3150 50  0000 C CNN
F 1 "Conn_01x06" V 3600 2800 50  0000 C CNN
F 2 "Plug_Pass:PinHeader_1x06_P2.54mm_Vertical" H 3500 2850 50  0001 C CNN
F 3 "~" H 3500 2850 50  0001 C CNN
	1    3500 2850
	-1   0    0    -1  
$EndComp
Text Label 3700 2650 0    50   ~ 0
RelayPin
$Comp
L Plug_Pass:GNDREF #PWR09
U 1 1 5EB1A6F0
P 6150 3200
F 0 "#PWR09" H 6150 2950 50  0001 C CNN
F 1 "GNDREF" H 6155 3027 50  0000 C CNN
F 2 "" H 6150 3200 50  0001 C CNN
F 3 "" H 6150 3200 50  0001 C CNN
	1    6150 3200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7850 2250 7850 2400
Wire Wire Line
	7850 2250 8100 2250
Wire Wire Line
	7700 2150 7700 2250
Wire Wire Line
	7700 2150 8100 2150
Wire Wire Line
	7100 2050 8100 2050
Wire Wire Line
	3700 2650 5550 2650
Wire Wire Line
	3700 1650 5550 1650
Wire Wire Line
	3700 1750 5550 1750
Wire Wire Line
	3700 1850 5550 1850
Wire Wire Line
	3700 1950 5550 1950
NoConn ~ 3700 2250
NoConn ~ 3700 2350
Wire Wire Line
	4350 2050 4350 2150
Wire Wire Line
	3700 2050 4350 2050
Wire Wire Line
	4200 2150 4200 2250
Wire Wire Line
	3700 2150 4200 2150
$Comp
L Plug_Pass:GNDREF #PWR06
U 1 1 5EB69A11
P 4200 2250
F 0 "#PWR06" H 4200 2000 50  0001 C CNN
F 1 "GNDREF" H 4205 2077 50  0000 C CNN
F 2 "" H 4200 2250 50  0001 C CNN
F 3 "" H 4200 2250 50  0001 C CNN
	1    4200 2250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4350 2950 4350 3050
Wire Wire Line
	3700 2950 4350 2950
Wire Wire Line
	4200 3150 4200 3250
Wire Wire Line
	3700 3150 4200 3150
$Comp
L Plug_Pass:GNDREF #PWR011
U 1 1 5EB6AED9
P 4200 3250
F 0 "#PWR011" H 4200 3000 50  0001 C CNN
F 1 "GNDREF" H 4205 3077 50  0000 C CNN
F 2 "" H 4200 3250 50  0001 C CNN
F 3 "" H 4200 3250 50  0001 C CNN
	1    4200 3250
	-1   0    0    -1  
$EndComp
$Comp
L Plug_Pass:VCC #PWR010
U 1 1 5EB6AEDF
P 4350 3050
F 0 "#PWR010" H 4350 2900 50  0001 C CNN
F 1 "VCC" H 4367 3223 50  0000 C CNN
F 2 "" H 4350 3050 50  0001 C CNN
F 3 "" H 4350 3050 50  0001 C CNN
	1    4350 3050
	-1   0    0    1   
$EndComp
Text Label 3700 2950 0    50   ~ 0
VCC
Text Label 3700 3150 0    50   ~ 0
GND
NoConn ~ 3700 2750
NoConn ~ 3700 2850
NoConn ~ 3700 3050
NoConn ~ 8100 1750
NoConn ~ 8100 1850
Wire Notes Line
	11200 3750 500  3750
Wire Notes Line
	2150 3750 2150 3950
Wire Notes Line
	500  3950 2150 3950
Wire Notes Line
	1700 650  3200 650 
Wire Notes Line
	5200 6400 3950 6400
Wire Notes Line
	3950 6400 3950 4850
Wire Notes Line
	3950 4850 3500 4850
Wire Notes Line
	3500 4850 3500 7650
Wire Notes Line
	3500 7650 6650 7650
Wire Notes Line
	6650 7650 6650 7050
Wire Notes Line
	6650 7050 5400 7050
Wire Notes Line
	5400 7050 5400 6500
Wire Notes Line
	5400 6500 6150 6500
Wire Notes Line
	6150 6500 6150 5300
Wire Notes Line
	6150 5300 7400 5300
Wire Notes Line
	7400 5300 7400 4250
Text Notes 3450 5850 3    50   ~ 0
Primary voltages to relay and outlets are hand\nwired, not printed on circuit board.
Text Notes 8650 2450 1    50   ~ 0
Female socket connector \nfor RTC3231 module
Text Notes 3250 2400 1    50   ~ 0
Female socket connector \nfor PN532 NFC Module
Text Notes 3300 3400 1    50   ~ 0
Male header connector \nfor power supply and\nrelay shield
Text Notes 9100 6150 1    50   ~ 0
Female header connector \nfor arduino shield attachment
Text Notes 5350 5100 0    39   ~ 0
Open connection \nfor expansion \nto 240V outlet
NoConn ~ 5450 4850
Wire Notes Line
	5200 4250 5200 6400
Wire Notes Line
	5200 4250 7400 4250
$Comp
L power:+5V #PWR0101
U 1 1 5E977429
P 7700 2250
F 0 "#PWR0101" H 7700 2100 50  0001 C CNN
F 1 "+5V" V 7700 2450 28  0000 C CNN
F 2 "" H 7700 2250 50  0000 C CNN
F 3 "" H 7700 2250 50  0000 C CNN
	1    7700 2250
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5E9780E8
P 4350 2150
F 0 "#PWR0102" H 4350 2000 50  0001 C CNN
F 1 "+5V" V 4350 2350 28  0000 C CNN
F 2 "" H 4350 2150 50  0000 C CNN
F 3 "" H 4350 2150 50  0000 C CNN
	1    4350 2150
	-1   0    0    1   
$EndComp
$Comp
L Plug_Pass:Arduino_Nano_v3.x A1
U 1 1 5E9A0BA3
P 6050 2050
F 0 "A1" H 5600 3000 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 6600 1050 50  0000 C CNN
F 2 "Plug_Pass:Arduino_Nano_WithMountingHoles" H 6050 2050 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 6050 2050 50  0001 C CNN
	1    6050 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 3050 6150 3100
Wire Wire Line
	6050 3050 6050 3100
Wire Wire Line
	6050 3100 6150 3100
Connection ~ 6150 3100
Wire Wire Line
	6150 3100 6150 3200
Wire Wire Line
	7100 2050 7100 2450
Wire Wire Line
	7100 2450 6550 2450
Wire Wire Line
	8100 1950 7000 1950
Wire Wire Line
	7000 1950 7000 2550
Wire Wire Line
	7000 2550 6550 2550
Wire Wire Line
	5950 850  5950 1050
Wire Wire Line
	6150 850  6150 1050
Wire Wire Line
	6250 850  6250 1050
NoConn ~ 5550 1450
NoConn ~ 5550 1550
NoConn ~ 5550 2050
NoConn ~ 5550 2150
NoConn ~ 5550 2250
NoConn ~ 5550 2350
NoConn ~ 5550 2450
NoConn ~ 5550 2550
NoConn ~ 5550 2750
NoConn ~ 6550 2750
NoConn ~ 6550 2650
NoConn ~ 6550 2350
NoConn ~ 6550 2250
NoConn ~ 6550 2150
NoConn ~ 6550 2050
NoConn ~ 6550 1850
NoConn ~ 6550 1550
NoConn ~ 6550 1450
NoConn ~ 27000 8650
NoConn ~ 12850 5050
$Comp
L power:VAC #PWR04
U 1 1 5E9E4A45
P 3650 4950
F 0 "#PWR04" H 3650 4850 50  0001 C CNN
F 1 "VAC" H 3650 5225 50  0000 C CNN
F 2 "" H 3650 4950 50  0001 C CNN
F 3 "" H 3650 4950 50  0001 C CNN
	1    3650 4950
	-1   0    0    1   
$EndComp
$Comp
L power:VAC #PWR05
U 1 1 5E9E4DD8
P 3700 6100
F 0 "#PWR05" H 3700 6000 50  0001 C CNN
F 1 "VAC" H 3700 6375 50  0000 C CNN
F 2 "" H 3700 6100 50  0001 C CNN
F 3 "" H 3700 6100 50  0001 C CNN
	1    3700 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 6100 3800 6100
Wire Wire Line
	4250 6100 4250 6650
Wire Wire Line
	4250 6650 6250 6650
Connection ~ 4250 6100
Wire Wire Line
	4250 6100 4350 6100
NoConn ~ 6550 6750
$Comp
L Plug_Pass:TDPT-1017503 J10
U 1 1 5E984D8C
P 6450 6850
F 0 "J10" H 6300 6850 50  0000 L CNN
F 1 "TDPT-1017503" H 5800 6750 50  0000 L CNN
F 2 "Plug_Pass:TDPT_2P_5.08MM" H 6650 7050 60  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Phoenix%20Contact%20PDFs/1017503_Ds.pdf" H 6650 7150 60  0001 L CNN
F 4 "277-17514-ND" H 6650 7250 60  0001 L CNN "Digi-Key_PN"
F 5 "1017503" H 6650 7350 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 6650 7450 60  0001 L CNN "Category"
F 7 "Terminal Blocks - Wire to Board" H 6650 7550 60  0001 L CNN "Family"
F 8 "https://media.digikey.com/pdf/Data%20Sheets/Phoenix%20Contact%20PDFs/1017503_Ds.pdf" H 6650 7650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "https://www.digikey.com/product-detail/en/phoenix-contact/1017503/277-17514-ND/9346604" H 6650 7750 60  0001 L CNN "DK_Detail_Page"
F 10 "TERM BLK 2P SIDE ENT 5.08MM PCB" H 6650 7850 60  0001 L CNN "Description"
F 11 "On Shore Technology Inc." H 6650 7950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6650 8050 60  0001 L CNN "Status"
	1    6450 6850
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:IRM-05-5 PS1
U 1 1 5E98A7A4
P 7650 5950
F 0 "PS1" H 7650 6317 50  0000 C CNN
F 1 "IRM-05-5" H 7650 6226 50  0000 C CNN
F 2 "Plug_Pass:Converter_ACDC_MeanWell_IRM-05-xx_THT" H 7650 5600 50  0001 C CNN
F 3 "https://www.meanwell.com/Upload/PDF/IRM-05/IRM-05-SPEC.PDF" H 7650 5550 50  0001 C CNN
	1    7650 5950
	1    0    0    -1  
$EndComp
$EndSCHEMATC

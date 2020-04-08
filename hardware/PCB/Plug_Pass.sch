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
Text Label 4350 1500 0    60   ~ 0
1(Tx)
Text Label 4350 1600 0    60   ~ 0
0(Rx)
Text Label 4350 1700 0    60   ~ 0
Reset
Text Label 4350 1900 0    60   ~ 0
2
Text Label 4350 2000 0    60   ~ 0
3(**)
Text Label 4350 2100 0    60   ~ 0
4
Text Label 4350 2200 0    60   ~ 0
5(**)
Text Label 4350 2300 0    60   ~ 0
6(**)
Text Label 4350 2400 0    60   ~ 0
7
Text Label 4350 2500 0    60   ~ 0
8
Text Label 4350 2600 0    60   ~ 0
9(**)
Text Label 4350 2700 0    60   ~ 0
10(**/SS)
Text Label 4350 2800 0    60   ~ 0
11(**/MOSI)
Text Label 4350 2900 0    60   ~ 0
12(MISO)
Text Label 6200 2900 0    60   ~ 0
13(SCK)
Text Label 6200 2600 0    60   ~ 0
A0
Text Label 6200 2500 0    60   ~ 0
A1
Text Label 6200 2400 0    60   ~ 0
A2
Text Label 6200 2300 0    60   ~ 0
A3
Text Label 6200 2200 0    60   ~ 0
A4
Text Label 6200 2100 0    60   ~ 0
A5
Text Label 6200 2000 0    60   ~ 0
A6
Text Label 6200 1900 0    60   ~ 0
A7
Text Label 6200 2700 0    60   ~ 0
AREF
Text Label 6200 1700 0    60   ~ 0
Reset
Text Notes 6450 1400 0    60   ~ 0
Holes
Text Notes 4150 1000 0    60   ~ 0
Shield for Arduino Nano
Text Label 5900 1350 1    60   ~ 0
Vin
Wire Notes Line
	4125 1050 5325 1050
Wire Notes Line
	5325 1050 5325 875 
$Comp
L Connector_Generic:Conn_01x01 P3
U 1 1 56D73ADD
P 6450 1050
F 0 "P3" V 6550 1050 50  0000 C CNN
F 1 "CONN_01X01" V 6550 1050 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 6450 1050 50  0001 C CNN
F 3 "" H 6450 1050 50  0000 C CNN
	1    6450 1050
	0    -1   -1   0   
$EndComp
NoConn ~ 6450 1250
$Comp
L Connector_Generic:Conn_01x01 P4
U 1 1 56D73D86
P 6550 1050
F 0 "P4" V 6650 1050 50  0000 C CNN
F 1 "CONN_01X01" V 6650 1050 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 6550 1050 50  0001 C CNN
F 3 "" H 6550 1050 50  0000 C CNN
	1    6550 1050
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P5
U 1 1 56D73DAE
P 6650 1050
F 0 "P5" V 6750 1050 50  0000 C CNN
F 1 "CONN_01X01" V 6750 1050 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 6650 1050 50  0001 C CNN
F 3 "" H 6650 1050 50  0000 C CNN
	1    6650 1050
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P6
U 1 1 56D73DD9
P 6750 1050
F 0 "P6" V 6850 1050 50  0000 C CNN
F 1 "CONN_01X01" V 6850 1050 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 6750 1050 50  0001 C CNN
F 3 "" H 6750 1050 50  0000 C CNN
	1    6750 1050
	0    -1   -1   0   
$EndComp
NoConn ~ 6550 1250
NoConn ~ 6650 1250
NoConn ~ 6750 1250
$Comp
L Connector_Generic:Conn_01x15 P1
U 1 1 56D73FAC
P 5200 2200
F 0 "P1" H 5200 3000 50  0000 C CNN
F 1 "Digital" V 5300 2200 50  0000 C CNN
F 2 "Socket_Arduino_Nano:Socket_Strip_Arduino_1x15" H 5200 2200 50  0001 C CNN
F 3 "" H 5200 2200 50  0000 C CNN
	1    5200 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x15 P2
U 1 1 56D740C7
P 5600 2200
F 0 "P2" H 5600 3000 50  0000 C CNN
F 1 "Analog" V 5700 2200 50  0000 C CNN
F 2 "Socket_Arduino_Nano:Socket_Strip_Arduino_1x15" H 5600 2200 50  0001 C CNN
F 3 "" H 5600 2200 50  0000 C CNN
	1    5600 2200
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 56D7422C
P 4900 3000
F 0 "#PWR01" H 4900 2750 50  0001 C CNN
F 1 "GND" H 4900 2850 50  0000 C CNN
F 2 "" H 4900 3000 50  0000 C CNN
F 3 "" H 4900 3000 50  0000 C CNN
	1    4900 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1800 4900 1800
Wire Wire Line
	4900 1800 4900 3000
Wire Wire Line
	5000 1500 4350 1500
Wire Wire Line
	4350 1600 5000 1600
Wire Wire Line
	5000 1700 4350 1700
Wire Wire Line
	4350 2300 5000 2300
Wire Wire Line
	5000 2400 4350 2400
Wire Wire Line
	4350 2500 5000 2500
Wire Wire Line
	5000 2600 4350 2600
Wire Wire Line
	4350 2700 5000 2700
Wire Wire Line
	5000 2800 4350 2800
Wire Wire Line
	4350 2900 5000 2900
$Comp
L power:GND #PWR02
U 1 1 56D746ED
P 5900 3000
F 0 "#PWR02" H 5900 2750 50  0001 C CNN
F 1 "GND" H 5900 2850 50  0000 C CNN
F 2 "" H 5900 3000 50  0000 C CNN
F 3 "" H 5900 3000 50  0000 C CNN
	1    5900 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3000 5900 1600
Wire Wire Line
	5900 1600 5800 1600
Wire Wire Line
	5800 1500 5900 1500
$Comp
L power:+5V #PWR03
U 1 1 56D747E8
P 6000 1350
F 0 "#PWR03" H 6000 1200 50  0001 C CNN
F 1 "+5V" V 6000 1550 28  0000 C CNN
F 2 "" H 6000 1350 50  0000 C CNN
F 3 "" H 6000 1350 50  0000 C CNN
	1    6000 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 1350 6000 1800
Wire Wire Line
	6000 1800 5800 1800
$Comp
L power:+3V3 #PWR04
U 1 1 56D74854
P 6100 1350
F 0 "#PWR04" H 6100 1200 50  0001 C CNN
F 1 "+3.3V" V 6100 1550 28  0000 C CNN
F 2 "" H 6100 1350 50  0000 C CNN
F 3 "" H 6100 1350 50  0000 C CNN
	1    6100 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 1350 6100 2800
Wire Wire Line
	6100 2800 5800 2800
Wire Wire Line
	6200 1700 5800 1700
Wire Wire Line
	5800 1900 6200 1900
Wire Wire Line
	6200 2000 5800 2000
Wire Wire Line
	6200 2300 5800 2300
Wire Wire Line
	6200 2400 5800 2400
Wire Wire Line
	5800 2500 6200 2500
Wire Wire Line
	6200 2600 5800 2600
Wire Wire Line
	6200 2700 5800 2700
Wire Wire Line
	5800 2900 6200 2900
Wire Notes Line
	6850 1450 6300 1450
Wire Notes Line
	6300 1450 6300 900 
Wire Notes Line
	6850 3250 4100 3250
Wire Notes Line
	4100 3250 4100 900 
Text Notes 5300 1500 0    60   ~ 0
1
$Comp
L Plug_Pass:DS3231M U?
U 1 1 5E8F612C
P 8550 1900
F 0 "U?" H 8200 2250 50  0000 C CNN
F 1 "DS3231M" H 8850 1500 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_7.5x10.3mm_P1.27mm" H 8550 1300 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/DS3231.pdf" H 8820 1950 50  0001 C CNN
	1    8550 1900
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:Conn_WallPlug_Earth P?
U 1 1 5E901186
P 4200 5500
F 0 "P?" H 4100 5750 50  0000 C CNN
F 1 "Conn_WallPlug_Earth" H 3800 5250 50  0000 C CNN
F 2 "" H 4600 5500 50  0001 C CNN
F 3 "~" H 4600 5500 50  0001 C CNN
	1    4200 5500
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:IRM-10-5 PS?
U 1 1 5E90266B
P 5450 5500
F 0 "PS?" H 5250 5750 50  0000 C CNN
F 1 "IRM-10-5" H 5650 5200 50  0000 C CNN
F 2 "Converter_ACDC:Converter_ACDC_MeanWell_IRM-10-xx_THT" H 5450 5150 50  0001 C CNN
F 3 "https://www.meanwell.com/Upload/PDF/IRM-10/IRM-10-SPEC.PDF" H 5450 5100 50  0001 C CNN
	1    5450 5500
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:G5LE-14_DC5 RLY?
U 1 1 5E903161
P 5450 4600
F 0 "RLY?" V 4985 4600 50  0000 C CNN
F 1 "G5LE-14_DC5" V 5076 4600 50  0000 C CNN
F 2 "digikey-footprints:Relay_THT_G5LE-14" H 5650 4800 50  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 5650 4900 60  0001 L CNN
F 4 "Z1011-ND" H 5650 5000 60  0001 L CNN "Digi-Key_PN"
F 5 "G5LE-14 DC5" H 5650 5100 60  0001 L CNN "MPN"
F 6 "Relays" H 5650 5200 60  0001 L CNN "Category"
F 7 "Power Relays, Over 2 Amps" H 5650 5300 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 5650 5400 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/G5LE-14-DC5/Z1011-ND/280371" H 5650 5500 60  0001 L CNN "DK_Detail_Page"
F 10 "RELAY GEN PURPOSE SPDT 10A 5V" H 5650 5600 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 5650 5700 60  0001 L CNN "Manufacturer"
F 12 "Active" H 5650 5800 60  0001 L CNN "Status"
	1    5450 4600
	0    1    1    0   
$EndComp
$Comp
L Plug_Pass:RF_PN532_Breakout U?
U 1 1 5E8E6712
P 2600 1850
F 0 "U?" H 2979 1804 50  0000 L CNN
F 1 "RF_PN532_Breakout" H 2979 1895 50  0000 L CNN
F 2 "RF_Module:nRF24L01_Breakout" H 2750 2450 50  0001 L CIN
F 3 "http://www.nordicsemi.com/eng/content/download/2730/34105/file/nRF24L01_Product_Specification_v2_0.pdf" H 2600 1750 50  0001 C CNN
	1    2600 1850
	-1   0    0    1   
$EndComp
$Comp
L Plug_Pass:VCC #PWR?
U 1 1 5E8ED344
P 2600 2600
F 0 "#PWR?" H 2600 2450 50  0001 C CNN
F 1 "VCC" H 2618 2773 50  0000 C CNN
F 2 "" H 2600 2600 50  0001 C CNN
F 3 "" H 2600 2600 50  0001 C CNN
	1    2600 2600
	-1   0    0    1   
$EndComp
$Comp
L Plug_Pass:VCC #PWR?
U 1 1 5E8ED62D
P 8450 1400
F 0 "#PWR?" H 8450 1250 50  0001 C CNN
F 1 "VCC" H 8467 1573 50  0000 C CNN
F 2 "" H 8450 1400 50  0001 C CNN
F 3 "" H 8450 1400 50  0001 C CNN
	1    8450 1400
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:VCC #PWR?
U 1 1 5E8EE3A2
P 5900 800
F 0 "#PWR?" H 5900 650 50  0001 C CNN
F 1 "VCC" H 5917 973 50  0000 C CNN
F 2 "" H 5900 800 50  0001 C CNN
F 3 "" H 5900 800 50  0001 C CNN
	1    5900 800 
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR?
U 1 1 5E8EF2E9
P 6000 5750
F 0 "#PWR?" H 6000 5500 50  0001 C CNN
F 1 "GNDREF" H 6005 5577 50  0000 C CNN
F 2 "" H 6000 5750 50  0001 C CNN
F 3 "" H 6000 5750 50  0001 C CNN
	1    6000 5750
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR?
U 1 1 5E8EFBFD
P 2600 1150
F 0 "#PWR?" H 2600 900 50  0001 C CNN
F 1 "GNDREF" H 2605 977 50  0000 C CNN
F 2 "" H 2600 1150 50  0001 C CNN
F 3 "" H 2600 1150 50  0001 C CNN
	1    2600 1150
	-1   0    0    1   
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR?
U 1 1 5E8EFF11
P 8550 2400
F 0 "#PWR?" H 8550 2150 50  0001 C CNN
F 1 "GNDREF" H 8555 2227 50  0000 C CNN
F 2 "" H 8550 2400 50  0001 C CNN
F 3 "" H 8550 2400 50  0001 C CNN
	1    8550 2400
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR?
U 1 1 5E8F0F42
P 5900 4300
F 0 "#PWR?" H 5900 4050 50  0001 C CNN
F 1 "GNDREF" H 5905 4127 50  0000 C CNN
F 2 "" H 5900 4300 50  0001 C CNN
F 3 "" H 5900 4300 50  0001 C CNN
	1    5900 4300
	-1   0    0    1   
$EndComp
$Comp
L Plug_Pass:VCC #PWR?
U 1 1 5E8F159A
P 6000 5350
F 0 "#PWR?" H 6000 5200 50  0001 C CNN
F 1 "VCC" H 6017 5523 50  0000 C CNN
F 2 "" H 6000 5350 50  0001 C CNN
F 3 "" H 6000 5350 50  0001 C CNN
	1    6000 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 5400 4750 5400
Wire Wire Line
	4500 5600 4750 5600
Wire Wire Line
	5850 5400 6000 5400
Wire Wire Line
	6000 5400 6000 5350
Wire Wire Line
	5850 5600 6000 5600
Wire Wire Line
	6000 5600 6000 5750
Wire Wire Line
	4750 5600 4750 6100
Wire Wire Line
	5750 4600 6750 4600
Wire Wire Line
	5750 4400 5900 4400
Wire Wire Line
	5900 4400 5900 4300
Wire Notes Line
	4100 900  6850 900 
Wire Notes Line
	6850 900  6850 3250
Wire Wire Line
	5900 800  5900 1500
Wire Wire Line
	2600 2450 2600 2600
Wire Wire Line
	2600 1250 2600 1150
Wire Wire Line
	8550 2300 8550 2400
Wire Wire Line
	8450 1500 8450 1400
Wire Wire Line
	7500 2100 7500 1700
Wire Wire Line
	7500 1700 8050 1700
Wire Wire Line
	5800 2100 7500 2100
Wire Wire Line
	7600 2200 7600 1800
Wire Wire Line
	7600 1800 8050 1800
Wire Wire Line
	5800 2200 7600 2200
Wire Wire Line
	3100 1900 5000 1900
Wire Wire Line
	3600 2000 3600 2100
Wire Wire Line
	3600 2100 3100 2100
Wire Wire Line
	3600 2000 5000 2000
Wire Wire Line
	3700 2100 3700 2200
Wire Wire Line
	3700 2200 3100 2200
Wire Wire Line
	3700 2100 5000 2100
Wire Wire Line
	3950 2200 3950 2300
Wire Wire Line
	3950 2300 3400 2300
Wire Wire Line
	3400 2300 3400 2000
Wire Wire Line
	3400 2000 3100 2000
Wire Wire Line
	3950 2200 5000 2200
$Comp
L Plug_Pass:Conn_WallSocket_Earth J?
U 1 1 5E900145
P 7250 5600
F 0 "J?" H 7500 5950 50  0000 L CNN
F 1 "Conn_WallSocket_Earth" H 7504 5520 50  0000 L CNN
F 2 "" H 6950 5700 50  0001 C CNN
F 3 "~" H 6950 5700 50  0001 C CNN
	1    7250 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 5600 7050 5600
Wire Wire Line
	6750 5400 7050 5400
Wire Wire Line
	6750 4600 6750 5400
Wire Wire Line
	6750 6100 4750 6100
Wire Wire Line
	6750 5600 6750 6100
Wire Wire Line
	4750 4700 5150 4700
Wire Wire Line
	4750 4700 4750 5400
Wire Wire Line
	4350 4400 5150 4400
Wire Wire Line
	4350 2900 4350 4400
Wire Wire Line
	4750 5400 5050 5400
Connection ~ 4750 5400
Wire Wire Line
	4750 5600 5050 5600
Connection ~ 4750 5600
$EndSCHEMATC

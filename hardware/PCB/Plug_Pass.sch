EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Plug-Pass 120V Switch"
Date "2021-09-26"
Rev "v4.0"
Comp "Clatskanie People's Utility District"
Comment1 "designed by: Paul Dockery, Power Manager"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Plug_Pass:GNDREF #PWR07
U 1 1 5E9576C1
P 9450 2450
F 0 "#PWR07" H 9450 2200 50  0001 C CNN
F 1 "GNDREF" H 9455 2277 50  0000 C CNN
F 2 "" H 9450 2450 50  0001 C CNN
F 3 "" H 9450 2450 50  0001 C CNN
	1    9450 2450
	-1   0    0    -1  
$EndComp
Text Label 8950 1800 2    50   ~ 0
SDA
Text Label 8950 1700 2    50   ~ 0
SCL
Text Label 9950 2000 0    50   ~ 0
SQW
Text Label 9950 1700 0    50   ~ 0
32K
Text Label 9450 2300 3    50   ~ 0
GND
Wire Notes Line
	7000 6550 6950 6550
NoConn ~ 9950 1700
NoConn ~ 9950 2000
NoConn ~ 27000 8650
$Comp
L Plug_Pass:DS3231M IC1
U 1 1 5F6351F7
P 9450 1900
F 0 "IC1" H 9750 2250 50  0000 C CNN
F 1 "DS3231M" H 9700 1550 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_7.5x10.3mm_P1.27mm" H 9450 1300 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/DS3231.pdf" H 9720 1950 50  0001 C CNN
F 4 "Real Time Clock +/-5ppm, I C Real-Time Clock" H 9450 1900 50  0001 C CNN "Description"
F 5 "DS3231M+" H 9450 1900 50  0001 C CNN "MPN"
F 6 "Maxim Integrated" H 9450 1900 50  0001 C CNN "Manufacturer"
	1    9450 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 2300 9450 2450
$Comp
L Plug_Pass:+3V3 #PWR0101
U 1 1 5F63A8D4
P 9350 1400
F 0 "#PWR0101" H 9350 1250 50  0001 C CNN
F 1 "+3V3" H 9365 1573 50  0000 C CNN
F 2 "" H 9350 1400 50  0001 C CNN
F 3 "" H 9350 1400 50  0001 C CNN
	1    9350 1400
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:+3V3 #PWR0102
U 1 1 5F63B66C
P 8650 1400
F 0 "#PWR0102" H 8650 1250 50  0001 C CNN
F 1 "+3V3" H 8665 1573 50  0000 C CNN
F 2 "" H 8650 1400 50  0001 C CNN
F 3 "" H 8650 1400 50  0001 C CNN
	1    8650 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0106
U 1 1 5F63BB9C
P 8650 2100
F 0 "#PWR0106" H 8650 1950 50  0001 C CNN
F 1 "+3.3V" H 8665 2273 50  0000 C CNN
F 2 "" H 8650 2100 50  0001 C CNN
F 3 "" H 8650 2100 50  0001 C CNN
	1    8650 2100
	-1   0    0    1   
$EndComp
$Comp
L Plug_Pass:BATTERYCR1220_SMT B1
U 1 1 5F64212B
P 9850 1350
F 0 "B1" H 9850 1109 42  0000 C CNN
F 1 "CR1220" H 9850 1200 42  0000 C CNN
F 2 "Plug_Pass:CR1220" H 9850 1350 50  0001 C CNN
F 3 "" H 9850 1350 50  0001 C CNN
F 4 "CR1220 COIN CELL SM RETAINER" H 9850 1350 50  0001 C CNN "Description"
F 5 "	2894" H 9850 1350 50  0001 C CNN "MPN"
F 6 "Keystone Electronics" H 9850 1350 50  0001 C CNN "Manufacturer"
	1    9850 1350
	-1   0    0    1   
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR0108
U 1 1 5F64A58A
P 10200 1350
F 0 "#PWR0108" H 10200 1100 50  0001 C CNN
F 1 "GNDREF" V 10200 1100 50  0000 C CNN
F 2 "" H 10200 1350 50  0001 C CNN
F 3 "" H 10200 1350 50  0001 C CNN
	1    10200 1350
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5F64ED14
P 8650 1950
F 0 "R1" H 8709 1996 50  0000 L CNN
F 1 "10k" H 8709 1905 50  0000 L CNN
F 2 "Plug_Pass:0402-1005X55N" H 8650 1950 50  0001 C CNN
F 3 "~" H 8650 1950 50  0001 C CNN
F 4 "Thick Film Resistors - SMD 10K OHM 1%" H 8650 1950 50  0001 C CNN "Description"
F 5 "RC0402FR-0710KL" H 8650 1950 50  0001 C CNN "MPN"
F 6 "Yageo" H 8650 1950 50  0001 C CNN "Manufacturer"
	1    8650 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 1800 8950 1800
$Comp
L Device:R_Small R2
U 1 1 5F64F381
P 8650 1550
F 0 "R2" H 8709 1596 50  0000 L CNN
F 1 "10k" H 8709 1505 50  0000 L CNN
F 2 "Plug_Pass:0402-1005X55N" H 8650 1550 50  0001 C CNN
F 3 "~" H 8650 1550 50  0001 C CNN
F 4 "Thick Film Resistors - SMD 10K OHM 1%" H 8650 1550 50  0001 C CNN "Description"
F 5 "RC0402FR-0710KL" H 8650 1550 50  0001 C CNN "MPN"
F 6 "Yageo" H 8650 1550 50  0001 C CNN "Manufacturer"
	1    8650 1550
	-1   0    0    1   
$EndComp
Wire Wire Line
	8650 1800 8650 1850
Wire Wire Line
	8650 2050 8650 2100
Wire Wire Line
	8650 1400 8650 1450
Wire Wire Line
	8650 1650 8650 1700
Wire Wire Line
	8650 1700 8950 1700
Wire Wire Line
	9450 1350 9750 1350
Wire Wire Line
	9450 1350 9450 1500
Wire Wire Line
	9950 1350 10200 1350
Wire Wire Line
	9350 1500 9350 1400
NoConn ~ 1900 1900
Text Label 2650 6700 0    50   ~ 0
GND
Text Label 2650 6500 0    50   ~ 0
VCC
Text Label 1300 2000 2    50   ~ 0
AC-L
Text Label 1850 6700 2    50   ~ 0
NEUT
Wire Wire Line
	1300 2000 1150 2000
$Comp
L Plug_Pass:GNDREF #PWR0104
U 1 1 5ED6AF82
P 2750 7100
F 0 "#PWR0104" H 2750 6850 50  0001 C CNN
F 1 "GNDREF" H 2750 6950 50  0000 C CNN
F 2 "" H 2750 7100 50  0001 C CNN
F 3 "" H 2750 7100 50  0001 C CNN
	1    2750 7100
	-1   0    0    -1  
$EndComp
$Comp
L Plug_Pass:T9AS1D22-5 RLY1
U 1 1 5E903161
P 1600 1900
F 0 "RLY1" V 1250 2050 50  0000 C CNN
F 1 "T95S5D22-5" V 1950 1900 50  0000 C CNN
F 2 "Plug_Pass:RLY-T9AS1D22-5" H 1800 2100 50  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1308242_T9A&DocType=DS&DocLang=English" H 1800 2200 60  0001 L CNN
F 4 "PB1015-ND" H 1800 2300 60  0001 L CNN "Digi-Key_PN"
F 5 "T9AS5D22-5" H 1800 2400 60  0001 L CNN "MPN"
F 6 "Relays" H 1800 2500 60  0001 L CNN "Category"
F 7 "Power Relays, Over 2 Amps" H 1800 2600 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1308242_T9A&DocType=DS&DocLang=English" H 1800 2700 60  0001 L CNN "DK_Datasheet_Link"
F 9 "https://www.digikey.com/product-detail/en/te-connectivity-potter-brumfield-relays/T9AS5D22-5/PB1015-ND/1095336" H 1800 2800 60  0001 L CNN "DK_Detail_Page"
F 10 "RELAY GEN PURPOSE SPDT 20A 5V" H 1800 2900 60  0001 L CNN "Description"
F 11 "TE Connectivity Potter & Brumfield Relays" H 1800 3000 60  0001 L CNN "Manufacturer"
F 12 "Active" H 1800 3100 60  0001 L CNN "Status"
	1    1600 1900
	0    1    1    0   
$EndComp
$Comp
L Plug_Pass:ATMEGA328P-AUR IC3
U 1 1 5F6CDAC1
P 3150 4350
F 0 "IC3" H 2800 5300 50  0000 C CNN
F 1 "ATMEGA328P-AUR" H 3600 3800 50  0000 C CNN
F 2 "Plug_Pass:TQFP-32_7x7mm" H 3350 4550 60  0001 L CNN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en608326" H 3350 4650 60  0001 L CNN
F 4 "ATMEGA328P-AURCT-ND" H 3350 4750 60  0001 L CNN "Digi-Key_PN"
F 5 "ATMEGA328P-AUR" H 3350 4850 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 3350 4950 60  0001 L CNN "Category"
F 7 "Embedded - Microcontrollers" H 3350 5050 60  0001 L CNN "Family"
F 8 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en608326" H 3350 5150 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/microchip-technology/ATMEGA328P-AUR/ATMEGA328P-AURCT-ND/3789455" H 3350 5250 60  0001 L CNN "DK_Detail_Page"
F 10 "IC MCU 8BIT 32KB FLASH 32TQFP" H 3350 5350 60  0001 L CNN "Description"
F 11 "Microchip Technology" H 3350 5450 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3350 5550 60  0001 L CNN "Status"
	1    3150 4350
	1    0    0    -1  
$EndComp
Text Label 3650 4550 0    50   ~ 0
SDA(A4)
Text Label 3650 4450 0    50   ~ 0
SCL(A5)
Text Label 2650 4150 2    50   ~ 0
MOSI(D11)
Text Label 2650 4250 2    50   ~ 0
MISO(D12)
Text Label 2650 4350 2    50   ~ 0
SCK(D13)
Text Label 2650 4050 2    50   ~ 0
SS(D10)
Text Label 3650 3750 0    50   ~ 0
RLY2-Pin(D2)
$Comp
L Plug_Pass:FT232RL-REEL IC2
U 1 1 5F63855F
P 6200 4550
F 0 "IC2" H 5700 3400 60  0000 C CNN
F 1 "FT232RL" H 6500 5050 60  0000 C CNN
F 2 "Plug_Pass:SSOP-28_W5.30mm" H 6400 4750 60  0001 L CNN
F 3 "https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT232R.pdf" H 6400 4850 60  0001 L CNN
F 4 "768-1007-1-ND" H 6400 4950 60  0001 L CNN "Digi-Key_PN"
F 5 "FT232RL-REEL" H 6400 5050 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 6400 5150 60  0001 L CNN "Category"
F 7 "Interface - Controllers" H 6400 5250 60  0001 L CNN "Family"
F 8 "https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT232R.pdf" H 6400 5350 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/ftdi-future-technology-devices-international-ltd/FT232RL-REEL/768-1007-1-ND/1836402" H 6400 5450 60  0001 L CNN "DK_Detail_Page"
F 10 "IC USB FS SERIAL UART 28-SSOP" H 6400 5550 60  0001 L CNN "Description"
F 11 "FTDI, Future Technology Devices International Ltd" H 6400 5650 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6400 5750 60  0001 L CNN "Status"
	1    6200 4550
	-1   0    0    1   
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR0109
U 1 1 5F63E7CE
P 8200 4450
F 0 "#PWR0109" H 8200 4200 50  0001 C CNN
F 1 "GNDREF" H 8200 4300 50  0000 C CNN
F 2 "" H 8200 4450 50  0001 C CNN
F 3 "" H 8200 4450 50  0001 C CNN
	1    8200 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 4450 7800 4400
Wire Wire Line
	7800 4400 7900 4400
Wire Wire Line
	8200 4400 8200 4450
Wire Wire Line
	7900 4450 7900 4400
Connection ~ 7900 4400
Connection ~ 2950 6500
NoConn ~ 7500 4650
$Comp
L Plug_Pass:GNDREF #PWR0111
U 1 1 5F638700
P 5600 3450
F 0 "#PWR0111" H 5600 3200 50  0001 C CNN
F 1 "GNDREF" H 5600 3300 50  0000 C CNN
F 2 "" H 5600 3450 50  0001 C CNN
F 3 "" H 5600 3450 50  0001 C CNN
	1    5600 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3350 6400 3200
Wire Wire Line
	6400 3200 6300 3200
Wire Wire Line
	6000 3350 6000 3200
Connection ~ 6000 3200
Wire Wire Line
	6100 3350 6100 3200
Connection ~ 6100 3200
Wire Wire Line
	6100 3200 6000 3200
Wire Wire Line
	6200 3350 6200 3200
Connection ~ 6200 3200
Wire Wire Line
	6200 3200 6100 3200
Wire Wire Line
	6300 3350 6300 3200
Connection ~ 6300 3200
Wire Wire Line
	6300 3200 6200 3200
Text Label 4500 3350 2    50   ~ 0
RX
Text Label 4500 3550 2    50   ~ 0
TX
Text GLabel 5550 4450 0    50   Input ~ 0
RX
Text GLabel 7100 4450 2    50   Input ~ 0
TX
Text GLabel 4500 3350 2    50   Input ~ 0
RX
Text GLabel 4500 3550 2    50   Input ~ 0
TX
Text Label 1350 6700 0    50   ~ 0
NEUT
Wire Wire Line
	1350 6700 1850 6700
Text GLabel 1150 2200 3    50   Input ~ 0
AC-L
Wire Wire Line
	1850 6500 1350 6500
Text GLabel 1350 6500 0    50   Input ~ 0
AC-L
Text Label 1850 6500 2    50   ~ 0
AC-L
Wire Wire Line
	1150 2000 1150 2200
Wire Wire Line
	2650 6700 2750 6700
$Comp
L Plug_Pass:+5V #PWR0113
U 1 1 5F63BB46
P 2950 6400
F 0 "#PWR0113" H 2950 6250 50  0001 C CNN
F 1 "+5V" H 2965 6573 50  0000 C CNN
F 2 "" H 2950 6400 50  0001 C CNN
F 3 "" H 2950 6400 50  0001 C CNN
	1    2950 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 6400 2950 6500
Wire Wire Line
	2950 6500 3200 6500
Wire Wire Line
	3200 6500 3200 6550
$Comp
L Plug_Pass:C_Small C11
U 1 1 5F664F9C
P 3200 6650
F 0 "C11" H 3292 6696 50  0000 L CNN
F 1 "1uF" H 3292 6605 50  0000 L CNN
F 2 "Plug_Pass:0402-1005X55N" H 3200 6650 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/281/murata_03052018_GRM_Series_1-1310166.pdf" H 3200 6650 50  0001 C CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0402 25VDC 1uF 10%" H 3200 6650 50  0001 C CNN "Description"
F 5 "GRM155R61E105KA12D" H 3200 6650 50  0001 C CNN "MPN"
F 6 "Murata Electronics" H 3200 6650 50  0001 C CNN "Manufacturer"
	1    3200 6650
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:LED_Small PWR1
U 1 1 5F6659FE
P 3750 6650
F 0 "PWR1" V 3796 6582 50  0000 R CNN
F 1 "Green" V 3705 6582 50  0000 R CNN
F 2 "Plug_Pass:LEDC1608X80N-AK" H 3750 6650 50  0001 C CNN
F 3 "~" H 3750 6650 50  0001 C CNN
F 4 "Standard LEDs - SMD Green Diffused 572nm 5mcd" H 3750 6650 50  0001 C CNN "Description"
F 5 "HSMG-C190" H 3750 6650 50  0001 C CNN "MPN"
F 6 "Broadcom" H 3750 6650 50  0001 C CNN "Manufacturer"
	1    3750 6650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3750 6500 3750 6550
$Comp
L Plug_Pass:GNDREF #PWR0114
U 1 1 5F67F5F9
P 3200 7100
F 0 "#PWR0114" H 3200 6850 50  0001 C CNN
F 1 "GNDREF" H 3200 6950 50  0000 C CNN
F 2 "" H 3200 7100 50  0001 C CNN
F 3 "" H 3200 7100 50  0001 C CNN
	1    3200 7100
	-1   0    0    -1  
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR0115
U 1 1 5F680728
P 3750 7100
F 0 "#PWR0115" H 3750 6850 50  0001 C CNN
F 1 "GNDREF" H 3750 6950 50  0000 C CNN
F 2 "" H 3750 7100 50  0001 C CNN
F 3 "" H 3750 7100 50  0001 C CNN
	1    3750 7100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3650 4450 4050 4450
Wire Wire Line
	3650 4550 4050 4550
Wire Wire Line
	2650 4050 2150 4050
Wire Wire Line
	2650 4150 2150 4150
Wire Wire Line
	2650 4250 2150 4250
Wire Wire Line
	2650 4350 2150 4350
Text GLabel 2150 4050 0    50   Input ~ 0
SS
Text GLabel 2150 4150 0    50   Input ~ 0
MOSI
Text GLabel 2150 4250 0    50   Input ~ 0
MISO
Text GLabel 2150 4350 0    50   Input ~ 0
SCK
Text GLabel 4050 4450 2    50   Input ~ 0
SCL
Text GLabel 4050 4550 2    50   Input ~ 0
SDA
Wire Wire Line
	8650 1700 8450 1700
Connection ~ 8650 1700
Wire Wire Line
	8650 1800 8450 1800
Connection ~ 8650 1800
Text GLabel 8450 1700 0    50   Input ~ 0
SCL
Text GLabel 8450 1800 0    50   Input ~ 0
SDA
Wire Wire Line
	7500 5050 7300 5050
Wire Wire Line
	7300 5450 7300 5500
$Comp
L Plug_Pass:VUSB #PWR0116
U 1 1 5F6A8B28
P 7300 5700
F 0 "#PWR0116" H 7300 5550 50  0001 C CNN
F 1 "VUSB" H 7315 5873 50  0000 C CNN
F 2 "" H 7300 5700 50  0001 C CNN
F 3 "" H 7300 5700 50  0001 C CNN
	1    7300 5700
	-1   0    0    1   
$EndComp
Text GLabel 4450 3750 2    50   Input ~ 0
RLY
Wire Wire Line
	3050 4950 3050 5050
Wire Wire Line
	3050 5050 3150 5050
Wire Wire Line
	3250 5050 3250 4950
Wire Wire Line
	3150 4950 3150 5050
Connection ~ 3150 5050
Wire Wire Line
	3150 5050 3250 5050
Wire Wire Line
	3250 5050 3350 5050
Connection ~ 3250 5050
$Comp
L Plug_Pass:GNDREF #PWR0117
U 1 1 5F6B5721
P 3350 5250
F 0 "#PWR0117" H 3350 5000 50  0001 C CNN
F 1 "GNDREF" H 3350 5100 50  0000 C CNN
F 2 "" H 3350 5250 50  0001 C CNN
F 3 "" H 3350 5250 50  0001 C CNN
	1    3350 5250
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:+5V #PWR0118
U 1 1 5F6BA8E8
P 2950 3200
F 0 "#PWR0118" H 2950 3050 50  0001 C CNN
F 1 "+5V" H 2965 3373 50  0000 C CNN
F 2 "" H 2950 3200 50  0001 C CNN
F 3 "" H 2950 3200 50  0001 C CNN
	1    2950 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 3350 3250 3250
Wire Wire Line
	3250 3250 3150 3250
Wire Wire Line
	2950 3250 2950 3200
Wire Wire Line
	3050 3350 3050 3250
Connection ~ 3050 3250
Wire Wire Line
	3050 3250 2950 3250
Wire Wire Line
	3150 3350 3150 3250
Connection ~ 3150 3250
Wire Wire Line
	3150 3250 3050 3250
Wire Wire Line
	2950 3250 2700 3250
Wire Wire Line
	2700 3250 2700 3100
Connection ~ 2950 3250
Wire Wire Line
	2700 2950 2550 2950
Connection ~ 2700 3100
Wire Wire Line
	2700 3100 2700 2950
Wire Wire Line
	2700 3250 2550 3250
Connection ~ 2700 3250
$Comp
L Plug_Pass:C_Small C4
U 1 1 5F6D0E0D
P 2450 2950
F 0 "C4" V 2550 2900 50  0000 L CNN
F 1 "1µF" V 2350 2850 50  0000 L CNN
F 2 "Plug_Pass:0402-1005X55N" H 2450 2950 50  0001 C CNN
F 3 "~" H 2450 2950 50  0001 C CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0402 25VDC 1uF 10%" H 2450 2950 50  0001 C CNN "Description"
F 5 "GRM155R61E105KA12D" H 2450 2950 50  0001 C CNN "MPN"
F 6 "Murata Electronics" H 2450 2950 50  0001 C CNN "Manufacturer"
	1    2450 2950
	0    1    1    0   
$EndComp
$Comp
L Plug_Pass:C_Small C5
U 1 1 5F6D1B43
P 2450 3250
F 0 "C5" V 2350 3200 50  0000 L CNN
F 1 "1µF" V 2550 3200 50  0000 L CNN
F 2 "Plug_Pass:0402-1005X55N" H 2450 3250 50  0001 C CNN
F 3 "~" H 2450 3250 50  0001 C CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 0402 25VDC 1uF 10%" H 2450 3250 50  0001 C CNN "Description"
F 5 "GRM155R61E105KA12D" H 2450 3250 50  0001 C CNN "MPN"
F 6 "Murata Electronics" H 2450 3250 50  0001 C CNN "Manufacturer"
	1    2450 3250
	0    1    1    0   
$EndComp
$Comp
L Plug_Pass-rescue:CP_Small-Plug_Pass C6
U 1 1 5F6D9AF1
P 2100 3100
F 0 "C6" V 2000 3100 50  0000 C CNN
F 1 "4.7uF" V 2200 3100 50  0000 C CNN
F 2 "Plug_Pass:CAPAE430X550N" H 2100 3100 50  0001 C CNN
F 3 "~" H 2100 3100 50  0001 C CNN
F 4 "Aluminum Electrolytic Capacitors - SMD WCAP-ASNP 4.7uF 16V 20% SMD/SMT" H 2100 3100 50  0001 C CNN "Description"
F 5 "865250340002" H 2100 3100 50  0001 C CNN "MPN"
F 6 "Wurth Elektronik" H 2100 3100 50  0001 C CNN "Manufacturer"
	1    2100 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 2950 1800 2950
Wire Wire Line
	1800 2950 1800 3100
Wire Wire Line
	1800 3250 2350 3250
Wire Wire Line
	2000 3100 1800 3100
Connection ~ 1800 3100
Wire Wire Line
	1800 3100 1800 3250
Wire Wire Line
	2200 3100 2700 3100
Wire Wire Line
	1800 3100 1650 3100
Wire Wire Line
	1650 3100 1650 3150
$Comp
L Plug_Pass:GNDREF #PWR0119
U 1 1 5F6E9076
P 1650 3150
F 0 "#PWR0119" H 1650 2900 50  0001 C CNN
F 1 "GNDREF" H 1650 3000 50  0000 C CNN
F 2 "" H 1650 3150 50  0001 C CNN
F 3 "" H 1650 3150 50  0001 C CNN
	1    1650 3150
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:C_Small C3
U 1 1 5F6E99AD
P 2300 3550
F 0 "C3" V 2200 3500 50  0000 L CNN
F 1 "100nF" V 2400 3450 50  0000 L CNN
F 2 "Plug_Pass:0402-1005X55N" H 2300 3550 50  0001 C CNN
F 3 "~" H 2300 3550 50  0001 C CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT .1UF 50V 5% 0402" H 2300 3550 50  0001 C CNN "Description"
F 5 "GRM155R61H104JE14D" H 2300 3550 50  0001 C CNN "MPN"
F 6 "Murata Electronics" H 2300 3550 50  0001 C CNN "Manufacturer"
	1    2300 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	2650 3550 2400 3550
Wire Wire Line
	2200 3550 1950 3550
Wire Wire Line
	1950 3550 1950 3600
$Comp
L Plug_Pass:GNDREF #PWR0120
U 1 1 5F6F1B90
P 1950 3600
F 0 "#PWR0120" H 1950 3350 50  0001 C CNN
F 1 "GNDREF" H 1950 3450 50  0000 C CNN
F 2 "" H 1950 3600 50  0001 C CNN
F 3 "" H 1950 3600 50  0001 C CNN
	1    1950 3600
	1    0    0    -1  
$EndComp
NoConn ~ 2650 3650
NoConn ~ 2650 3750
NoConn ~ 2650 3850
NoConn ~ 2650 3950
NoConn ~ 2650 4650
NoConn ~ 2650 4750
NoConn ~ 3650 4750
NoConn ~ 3650 4650
NoConn ~ 3650 4250
NoConn ~ 3650 4150
NoConn ~ 3650 4050
NoConn ~ 3650 3950
NoConn ~ 3650 3850
NoConn ~ 5800 4550
NoConn ~ 5800 4250
Wire Wire Line
	5800 4350 5650 4350
Wire Wire Line
	5650 4350 5650 4150
Wire Wire Line
	5650 4150 5550 4150
$Comp
L Plug_Pass:C_Small C9
U 1 1 5F779295
P 5450 4150
F 0 "C9" V 5550 4100 50  0000 L CNN
F 1 "100nF" V 5350 4000 50  0000 L CNN
F 2 "Plug_Pass:0402-1005X55N" H 5450 4150 50  0001 C CNN
F 3 "~" H 5450 4150 50  0001 C CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT .1UF 50V 5% 0402" H 5450 4150 50  0001 C CNN "Description"
F 5 "GRM155R61H104JE14D" H 5450 4150 50  0001 C CNN "MPN"
F 6 "Murata Electronics" H 5450 4150 50  0001 C CNN "Manufacturer"
	1    5450 4150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5200 4150 5350 4150
Wire Wire Line
	3650 4350 4050 4350
Text GLabel 4050 4350 2    50   Input ~ 0
RESET
NoConn ~ 6900 4650
NoConn ~ 6900 4550
NoConn ~ 6900 4350
NoConn ~ 6900 4250
NoConn ~ 6900 4150
NoConn ~ 6900 4050
NoConn ~ 6900 3950
NoConn ~ 6900 3850
NoConn ~ 6900 3750
$Comp
L Plug_Pass:+5V #PWR0121
U 1 1 5F7B27E9
P 6450 5400
F 0 "#PWR0121" H 6450 5250 50  0001 C CNN
F 1 "+5V" H 6465 5573 50  0000 C CNN
F 2 "" H 6450 5400 50  0001 C CNN
F 3 "" H 6450 5400 50  0001 C CNN
	1    6450 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 5050 6300 5150
Wire Wire Line
	6300 5150 6400 5150
Wire Wire Line
	6400 5150 6400 5050
Wire Wire Line
	6450 5500 6450 5400
$Comp
L Plug_Pass:LED_Small RX1
U 1 1 5F7C5DC1
P 7850 3350
F 0 "RX1" V 7896 3282 50  0000 R CNN
F 1 "Red" V 7805 3282 50  0000 R CNN
F 2 "Plug_Pass:LEDC1608X80N-AK" H 7850 3350 50  0001 C CNN
F 3 "~" H 7850 3350 50  0001 C CNN
F 4 "Standard LEDs - SMD Red Diffused 639nm 17mcd" H 7850 3350 50  0001 C CNN "Description"
F 5 "HSMH-C190" H 7850 3350 50  0001 C CNN "MPN"
F 6 "Broadcom" H 7850 3350 50  0001 C CNN "Manufacturer"
	1    7850 3350
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:+5V #PWR0122
U 1 1 5F7C7888
P 8050 3350
F 0 "#PWR0122" H 8050 3200 50  0001 C CNN
F 1 "+5V" H 8065 3523 50  0000 C CNN
F 2 "" H 8050 3350 50  0001 C CNN
F 3 "" H 8050 3350 50  0001 C CNN
	1    8050 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	7950 3350 8050 3350
$Comp
L Plug_Pass:LED_Small TX1
U 1 1 5F7DA95E
P 7850 3650
F 0 "TX1" V 7896 3582 50  0000 R CNN
F 1 "Green" V 7805 3582 50  0000 R CNN
F 2 "Plug_Pass:LEDC1608X80N-AK" H 7850 3650 50  0001 C CNN
F 3 "~" H 7850 3650 50  0001 C CNN
F 4 "Standard LEDs - SMD Green Diffused 572nm 5mcd" H 7850 3650 50  0001 C CNN "Description"
F 5 "HSMG-C190" H 7850 3650 50  0001 C CNN "MPN"
F 6 "Broadcom" H 7850 3650 50  0001 C CNN "Manufacturer"
	1    7850 3650
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:+5V #PWR0123
U 1 1 5F7DA968
P 8050 3650
F 0 "#PWR0123" H 8050 3500 50  0001 C CNN
F 1 "+5V" H 8065 3823 50  0000 C CNN
F 2 "" H 8050 3650 50  0001 C CNN
F 3 "" H 8050 3650 50  0001 C CNN
	1    8050 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	7950 3650 8050 3650
Wire Wire Line
	7650 5850 7700 5850
Connection ~ 7300 5500
$Comp
L Plug_Pass-rescue:CP_Small-Plug_Pass C7
U 1 1 5F7F5027
P 7800 5500
F 0 "C7" V 7700 5500 50  0000 C CNN
F 1 "4.7uF" V 7900 5500 50  0000 C CNN
F 2 "Plug_Pass:CAPAE430X550N" H 7800 5500 50  0001 C CNN
F 3 "~" H 7800 5500 50  0001 C CNN
F 4 "Aluminum Electrolytic Capacitors - SMD WCAP-ASNP 4.7uF 16V 20% SMD/SMT" H 7800 5500 50  0001 C CNN "Description"
F 5 "865250340002" H 7800 5500 50  0001 C CNN "MPN"
F 6 "Wurth Elektronik" H 7800 5500 50  0001 C CNN "Manufacturer"
	1    7800 5500
	0    -1   -1   0   
$EndComp
$Comp
L Plug_Pass:C_Small C8
U 1 1 5F7F6245
P 7800 5850
F 0 "C8" V 7700 5800 50  0000 L CNN
F 1 "100nF" V 7900 5750 50  0000 L CNN
F 2 "Plug_Pass:0402-1005X55N" H 7800 5850 50  0001 C CNN
F 3 "~" H 7800 5850 50  0001 C CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT .1UF 50V 5% 0402" H 7800 5850 50  0001 C CNN "Description"
F 5 "GRM155R61H104JE14D" H 7800 5850 50  0001 C CNN "MPN"
F 6 "Murata Electronics" H 7800 5850 50  0001 C CNN "Manufacturer"
	1    7800 5850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8000 5850 7900 5850
$Comp
L Plug_Pass:GNDREF #PWR0124
U 1 1 5F804264
P 8250 5700
F 0 "#PWR0124" H 8250 5450 50  0001 C CNN
F 1 "GNDREF" H 8250 5550 50  0000 C CNN
F 2 "" H 8250 5700 50  0001 C CNN
F 3 "" H 8250 5700 50  0001 C CNN
	1    8250 5700
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:SW_Push SW1
U 1 1 5F810C3E
P 5200 6500
F 0 "SW1" H 5200 6850 50  0000 C CNN
F 1 "RESET" H 5200 6750 50  0000 C CNN
F 2 "Plug_Pass:C&K_PTS820_NO_HOLES" H 5200 6700 50  0001 C CNN
F 3 "~" H 5200 6700 50  0001 C CNN
F 4 "Tactile Switches Microminiature SMT Top Actuated" H 5200 6500 50  0001 C CNN "Description"
F 5 "PTS820J25KSMTRLFS" H 5200 6500 50  0001 C CNN "MPN"
F 6 "C&K" H 5200 6500 50  0001 C CNN "Manufacturer"
	1    5200 6500
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR0125
U 1 1 5F818CB3
P 4750 7100
F 0 "#PWR0125" H 4750 6850 50  0001 C CNN
F 1 "GNDREF" H 4750 6950 50  0000 C CNN
F 2 "" H 4750 7100 50  0001 C CNN
F 3 "" H 4750 7100 50  0001 C CNN
	1    4750 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 6500 5500 6500
$Comp
L Plug_Pass:+5V #PWR0126
U 1 1 5F82092C
P 6200 6400
F 0 "#PWR0126" H 6200 6250 50  0001 C CNN
F 1 "+5V" H 6215 6573 50  0000 C CNN
F 2 "" H 6200 6400 50  0001 C CNN
F 3 "" H 6200 6400 50  0001 C CNN
	1    6200 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 6500 5500 6600
Connection ~ 5500 6500
Wire Wire Line
	7300 5500 7300 5700
$Comp
L Plug_Pass:+5V #PWR0127
U 1 1 5F85FD1D
P 6650 5400
F 0 "#PWR0127" H 6650 5250 50  0001 C CNN
F 1 "+5V" H 6665 5573 50  0000 C CNN
F 2 "" H 6650 5400 50  0001 C CNN
F 3 "" H 6650 5400 50  0001 C CNN
	1    6650 5400
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR0140
U 1 1 5F66D102
P 7100 2450
F 0 "#PWR0140" H 7100 2200 50  0001 C CNN
F 1 "GNDREF" H 7105 2277 50  0000 C CNN
F 2 "" H 7100 2450 50  0001 C CNN
F 3 "" H 7100 2450 50  0001 C CNN
	1    7100 2450
	-1   0    0    -1  
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR0141
U 1 1 5F66D84B
P 5500 2400
F 0 "#PWR0141" H 5500 2150 50  0001 C CNN
F 1 "GNDREF" H 5505 2227 50  0000 C CNN
F 2 "" H 5500 2400 50  0001 C CNN
F 3 "" H 5500 2400 50  0001 C CNN
	1    5500 2400
	-1   0    0    -1  
$EndComp
NoConn ~ 5800 4650
$Comp
L Plug_Pass:+3V3 #PWR0142
U 1 1 5F6CD259
P 5500 1550
F 0 "#PWR0142" H 5500 1400 50  0001 C CNN
F 1 "+3V3" H 5515 1723 50  0000 C CNN
F 2 "" H 5500 1550 50  0001 C CNN
F 3 "" H 5500 1550 50  0001 C CNN
	1    5500 1550
	1    0    0    -1  
$EndComp
Connection ~ 3200 6500
$Comp
L Plug_Pass:Thermistor F1
U 1 1 5F69B519
P 7300 5250
F 0 "F1" H 7405 5296 50  0000 L CNN
F 1 "MFFSMF050" H 7405 5205 50  0000 L CNN
F 2 "Plug_Pass:0603-1608X90N" H 7300 5250 50  0001 C CNN
F 3 "~" H 7300 5250 50  0001 C CNN
F 4 "Resettable Fuses - PPTC 6volts 40amps" H 7300 5250 50  0001 C CNN "Description"
F 5 "MF-FSMF050X-2" H 7300 5250 50  0001 C CNN "MPN"
F 6 "Bourns" H 7300 5250 50  0001 C CNN "Manufacturer"
	1    7300 5250
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:IRM-03-5 PS1
U 1 1 5F6D3CE8
P 2250 6600
F 0 "PS1" H 2250 6967 50  0000 C CNN
F 1 "IRM-03-5" H 2250 6876 50  0000 C CNN
F 2 "Converter_ACDC:Converter_ACDC_MeanWell_IRM-03-xx_SMD" H 2250 6250 50  0001 C CNN
F 3 "https://www.meanwell.com/Upload/PDF/IRM-03/IRM-03-SPEC.PDF" H 2250 6200 50  0001 C CNN
F 4 "AC/DC CONVERTER 5V 3W" H 2250 6600 50  0001 C CNN "Description"
F 5 "IRM-03-5S" H 2250 6600 50  0001 C CNN "MPN"
F 6 "MEAN WELL USA Inc." H 2250 6600 50  0001 C CNN "Manufacturer"
	1    2250 6600
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:MountingHole_Pad NEUT1
U 1 1 5F7F347B
P 1250 6700
F 0 "NEUT1" V 1250 6950 50  0000 C CNN
F 1 "NEUT" V 1150 6900 50  0000 C CNN
F 2 "Plug_Pass:Ground_Pad" H 1250 6700 50  0001 C CNN
F 3 "~" H 1250 6700 50  0001 C CNN
	1    1250 6700
	0    -1   -1   0   
$EndComp
$Comp
L Plug_Pass:MountingHole_Pad GND1
U 1 1 5F7F48F7
P 2650 7000
F 0 "GND1" V 2650 7250 50  0000 C CNN
F 1 "GND" V 2550 7150 50  0000 C CNN
F 2 "Plug_Pass:Ground_Pad" H 2650 7000 50  0001 C CNN
F 3 "~" H 2650 7000 50  0001 C CNN
	1    2650 7000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2650 6500 2950 6500
Wire Wire Line
	2750 7100 2750 7000
Connection ~ 2750 7000
$Comp
L Plug_Pass:+5V #PWR0105
U 1 1 5F93FE0D
P 5150 1550
F 0 "#PWR0105" H 5150 1400 50  0001 C CNN
F 1 "+5V" H 5165 1723 50  0000 C CNN
F 2 "" H 5150 1550 50  0001 C CNN
F 3 "" H 5150 1550 50  0001 C CNN
	1    5150 1550
	1    0    0    -1  
$EndComp
Text Label 3650 4350 0    50   ~ 0
RESET
Text Label 9750 1350 2    50   ~ 0
BAT+
Text Label 9950 1350 0    50   ~ 0
BAT-
Text Label 6900 3550 0    50   ~ 0
RX_RED
Text Label 6900 3650 0    50   ~ 0
TX_GREEN
Text Label 6900 4450 0    50   ~ 0
TX
Text Label 5800 4450 2    50   ~ 0
RX
Text Label 6900 4750 0    50   ~ 0
D-
Text Label 6900 4850 0    50   ~ 0
D+
Text Label 7500 4850 2    50   ~ 0
D+
Text Label 7500 4750 2    50   ~ 0
D-
Wire Wire Line
	7300 5500 7150 5500
$Comp
L Plug_Pass:R_Small R5
U 1 1 5F7462FB
P 3500 6500
F 0 "R5" H 3559 6546 50  0000 L CNN
F 1 "330" H 3559 6455 50  0000 L CNN
F 2 "Plug_Pass:0402-1005X55N" H 3500 6500 50  0001 C CNN
F 3 "~" H 3500 6500 50  0001 C CNN
F 4 "Thick Film Resistors - SMD 330 OHM 1%" H 3500 6500 50  0001 C CNN "Description"
F 5 "RC0402FR-07330RL" H 3500 6500 50  0001 C CNN "MPN"
F 6 "Yageo" H 3500 6500 50  0001 C CNN "Manufacturer"
	1    3500 6500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3200 6500 3400 6500
Wire Wire Line
	3600 6500 3750 6500
$Comp
L Plug_Pass:R_Small R4
U 1 1 5F793736
P 7500 3650
F 0 "R4" H 7559 3696 50  0000 L CNN
F 1 "330" H 7559 3605 50  0000 L CNN
F 2 "Plug_Pass:0402-1005X55N" H 7500 3650 50  0001 C CNN
F 3 "~" H 7500 3650 50  0001 C CNN
F 4 "Thick Film Resistors - SMD 330 OHM 1%" H 7500 3650 50  0001 C CNN "Description"
F 5 "RC0402FR-07330RL" H 7500 3650 50  0001 C CNN "MPN"
F 6 "Yageo" H 7500 3650 50  0001 C CNN "Manufacturer"
	1    7500 3650
	0    -1   -1   0   
$EndComp
$Comp
L Plug_Pass:R_Small R3
U 1 1 5F794D52
P 7500 3350
F 0 "R3" H 7559 3396 50  0000 L CNN
F 1 "330" H 7559 3305 50  0000 L CNN
F 2 "Plug_Pass:0402-1005X55N" H 7500 3350 50  0001 C CNN
F 3 "~" H 7500 3350 50  0001 C CNN
F 4 "Thick Film Resistors - SMD 330 OHM 1%" H 7500 3350 50  0001 C CNN "Description"
F 5 "RC0402FR-07330RL" H 7500 3350 50  0001 C CNN "MPN"
F 6 "Yageo" H 7500 3350 50  0001 C CNN "Manufacturer"
	1    7500 3350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7600 3350 7750 3350
Wire Wire Line
	7600 3650 7750 3650
Wire Wire Line
	5300 6750 5300 6800
Wire Wire Line
	5300 6800 5250 6800
Wire Wire Line
	5100 6800 5100 6750
Wire Wire Line
	5150 6750 5150 6800
Connection ~ 5150 6800
Wire Wire Line
	5150 6800 5100 6800
Wire Wire Line
	5250 6750 5250 6800
Connection ~ 5250 6800
Wire Wire Line
	5250 6800 5150 6800
$Comp
L Plug_Pass:GNDREF #PWR0112
U 1 1 5F812E92
P 5100 7100
F 0 "#PWR0112" H 5100 6850 50  0001 C CNN
F 1 "GNDREF" H 5100 6950 50  0000 C CNN
F 2 "" H 5100 7100 50  0001 C CNN
F 3 "" H 5100 7100 50  0001 C CNN
	1    5100 7100
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:USB_B_Micro J1
U 1 1 5F633736
P 7800 4850
F 0 "J1" H 7550 4950 50  0000 R CNN
F 1 "USB_B_Micro" H 7550 5050 50  0000 R CNN
F 2 "Plug_Pass:MOLEX_1051330001" H 7950 4800 50  0001 C CNN
F 3 "~" H 7950 4800 50  0001 C CNN
F 4 "CONN RCPT USB2.0 MICRO B SMD" H 7800 4850 50  0001 C CNN "Description"
F 5 "1051330001" H 7800 4850 50  0001 C CNN "MPN"
F 6 "Molex" H 7800 4850 50  0001 C CNN "Manufacturer"
	1    7800 4850
	-1   0    0    1   
$EndComp
Wire Wire Line
	7900 4400 8200 4400
$Comp
L Plug_Pass:MountingHole_Pad GND3
U 1 1 5F8E882E
P 9600 3650
F 0 "GND3" V 9600 3900 50  0000 C CNN
F 1 "GND" V 9500 3800 50  0000 C CNN
F 2 "Plug_Pass:Ground_Pad" H 9600 3650 50  0001 C CNN
F 3 "~" H 9600 3650 50  0001 C CNN
	1    9600 3650
	0    -1   -1   0   
$EndComp
$Comp
L Plug_Pass:MountingHole_Pad GND2
U 1 1 5F8E8C20
P 9600 3450
F 0 "GND2" V 9600 3700 50  0000 C CNN
F 1 "GND" V 9500 3600 50  0000 C CNN
F 2 "Plug_Pass:Ground_Pad" H 9600 3450 50  0001 C CNN
F 3 "~" H 9600 3450 50  0001 C CNN
	1    9600 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2750 6700 2750 7000
$Comp
L Plug_Pass:MountingHole_Pad GND4
U 1 1 5F90FFA1
P 9600 3850
F 0 "GND4" V 9600 4100 50  0000 C CNN
F 1 "GND" V 9500 4000 50  0000 C CNN
F 2 "Plug_Pass:Ground_Pad" H 9600 3850 50  0001 C CNN
F 3 "~" H 9600 3850 50  0001 C CNN
	1    9600 3850
	0    -1   -1   0   
$EndComp
$Comp
L Plug_Pass:MountingHole_Pad GND5
U 1 1 5F91025D
P 9600 4050
F 0 "GND5" V 9600 4300 50  0000 C CNN
F 1 "GND" V 9500 4200 50  0000 C CNN
F 2 "Plug_Pass:Ground_Pad" H 9600 4050 50  0001 C CNN
F 3 "~" H 9600 4050 50  0001 C CNN
	1    9600 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9700 3450 9750 3450
Wire Wire Line
	9750 3450 9750 3650
Wire Wire Line
	9750 4050 9700 4050
Wire Wire Line
	9700 3650 9750 3650
Connection ~ 9750 3650
Wire Wire Line
	9750 3650 9750 3850
Wire Wire Line
	9700 3850 9750 3850
Connection ~ 9750 3850
Wire Wire Line
	9750 3850 9750 4050
$Comp
L Plug_Pass:GNDREF #PWR02
U 1 1 5F980924
P 9850 4100
F 0 "#PWR02" H 9850 3850 50  0001 C CNN
F 1 "GNDREF" H 9850 3950 50  0000 C CNN
F 2 "" H 9850 4100 50  0001 C CNN
F 3 "" H 9850 4100 50  0001 C CNN
	1    9850 4100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9750 4050 9850 4050
Wire Wire Line
	9850 4050 9850 4100
Connection ~ 9750 4050
$Comp
L Plug_Pass:GNDREF #PWR04
U 1 1 5FECF80A
P 10100 5550
F 0 "#PWR04" H 10100 5300 50  0001 C CNN
F 1 "GNDREF" H 10100 5400 50  0000 C CNN
F 2 "" H 10100 5550 50  0001 C CNN
F 3 "" H 10100 5550 50  0001 C CNN
	1    10100 5550
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:+5V #PWR03
U 1 1 5FEA5E98
P 9700 5100
F 0 "#PWR03" H 9700 4950 50  0001 C CNN
F 1 "+5V" V 9700 5300 50  0000 C CNN
F 2 "" H 9700 5100 50  0001 C CNN
F 3 "" H 9700 5100 50  0001 C CNN
	1    9700 5100
	0    1    1    0   
$EndComp
Text GLabel 5200 4150 0    50   Input ~ 0
RESET
Text GLabel 5500 6600 3    50   Input ~ 0
RESET
$Comp
L Plug_Pass:C_Small C2
U 1 1 60BEF970
P 1850 5100
F 0 "C2" H 1650 5050 50  0000 L CNN
F 1 "22pF" H 1600 5150 50  0000 L CNN
F 2 "Plug_Pass:0603-1608X90N" H 1850 5100 50  0001 C CNN
F 3 "~" H 1850 5100 50  0001 C CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 50V 33pF 0603 X8R 10% AEC-Q200" H 1850 5100 50  0001 C CNN "Description"
F 5 "CC0603JRNPO9BN220" H 1850 5100 50  0001 C CNN "MPN"
F 6 "Yageo" H 1850 5100 50  0001 C CNN "Manufacturer"
	1    1850 5100
	-1   0    0    1   
$EndComp
$Comp
L Plug_Pass:C_Small C1
U 1 1 60C461D5
P 1850 4600
F 0 "C1" H 1650 4550 50  0000 L CNN
F 1 "22pF" H 1600 4650 50  0000 L CNN
F 2 "Plug_Pass:0603-1608X90N" H 1850 4600 50  0001 C CNN
F 3 "~" H 1850 4600 50  0001 C CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 50V 33pF 0603 X8R 10% AEC-Q200" H 1850 4600 50  0001 C CNN "Description"
F 5 "CC0603JRNPO9BN220" H 1850 4600 50  0001 C CNN "MPN"
F 6 "Yageo" H 1850 4600 50  0001 C CNN "Manufacturer"
	1    1850 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	2200 4550 2200 4950
Wire Wire Line
	1850 4500 1850 4450
Connection ~ 1850 4450
Wire Wire Line
	1850 4750 1850 4700
$Comp
L Plug_Pass:GNDREF #PWR0156
U 1 1 5F9CC316
P 1850 4750
F 0 "#PWR0156" H 1850 4500 50  0001 C CNN
F 1 "GNDREF" H 1850 4600 50  0000 C CNN
F 2 "" H 1850 4750 50  0001 C CNN
F 3 "" H 1850 4750 50  0001 C CNN
	1    1850 4750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1850 5250 1850 5200
Wire Wire Line
	1850 5000 1850 4950
Connection ~ 1850 4950
Wire Wire Line
	1850 4950 2200 4950
Wire Wire Line
	1400 4950 1400 4900
Wire Wire Line
	1400 4950 1850 4950
Wire Wire Line
	1400 4450 1400 4500
Wire Wire Line
	1400 4450 1850 4450
$Comp
L Plug_Pass:Conn_01x08 J2
U 1 1 613A3EBA
P 9400 5100
F 0 "J2" H 9318 4475 50  0000 C CNN
F 1 "Conn_01x08" H 9318 4566 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical_SMD_Pin1Right" H 9400 5100 50  0001 C CNN
F 3 "~" H 9400 5100 50  0001 C CNN
	1    9400 5100
	-1   0    0    1   
$EndComp
Text GLabel 9700 4700 2    50   Input ~ 0
SCK
Text GLabel 9700 4800 2    50   Input ~ 0
MISO
Text GLabel 9700 4900 2    50   Input ~ 0
MOSI
Text GLabel 9700 5000 2    50   Input ~ 0
SS
Wire Wire Line
	9600 4700 9700 4700
Wire Wire Line
	9600 4800 9700 4800
Wire Wire Line
	9600 4900 9700 4900
Wire Wire Line
	9600 5000 9700 5000
Wire Wire Line
	9600 5100 9700 5100
Wire Wire Line
	9600 5200 10100 5200
Wire Wire Line
	10100 5200 10100 5300
Wire Wire Line
	9600 5300 10100 5300
Connection ~ 10100 5300
$Comp
L 1N4148WS:1N4148WS D2
U 1 1 61653BE9
P 1600 1350
F 0 "D2" H 1600 1450 50  0000 C CNN
F 1 "1N4148WS" H 1600 1250 50  0000 C CNN
F 2 "SODFL2512X100N" H 1600 1350 50  0001 L BNN
F 3 "" H 1600 1350 50  0001 L BNN
F 4 "Fairchild Semiconductor" H 1600 1350 50  0001 L BNN "MANUFACTURER"
	1    1600 1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	1300 1350 1150 1350
Wire Wire Line
	1150 1350 1150 1700
Wire Wire Line
	1150 1700 1300 1700
Connection ~ 1150 1350
Wire Wire Line
	1150 1250 1150 1350
$Comp
L Plug_Pass:+5V #PWR0103
U 1 1 61797C2C
P 1150 1250
F 0 "#PWR0103" H 1150 1100 50  0001 C CNN
F 1 "+5V" H 1165 1423 50  0000 C CNN
F 2 "" H 1150 1250 50  0001 C CNN
F 3 "" H 1150 1250 50  0001 C CNN
	1    1150 1250
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR014
U 1 1 5EA96339
P 3250 2450
F 0 "#PWR014" H 3250 2200 50  0001 C CNN
F 1 "GNDREF" H 3250 2300 50  0000 C CNN
F 2 "" H 3250 2450 50  0001 C CNN
F 3 "" H 3250 2450 50  0001 C CNN
	1    3250 2450
	1    0    0    -1  
$EndComp
NoConn ~ 3150 2100
$Comp
L Plug_Pass:G5V-1-DC5 RLY2
U 1 1 5ED010EF
P 2850 1900
F 0 "RLY2" V 2500 2150 50  0000 R CNN
F 1 "G5V-1-DC5" V 3200 2150 50  0000 R CNN
F 2 "Plug_Pass:Relay_THT_G5V-1" H 3050 2100 50  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5v_1.pdf" H 3050 2200 60  0001 L CNN
F 4 "Z773-ND" H 3050 2300 60  0001 L CNN "Digi-Key_PN"
F 5 "G5V-1-DC5" H 3050 2400 60  0001 L CNN "MPN"
F 6 "Relays" H 3050 2500 60  0001 L CNN "Category"
F 7 "Signal Relays, Up to 2 Amps" H 3050 2600 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5v_1.pdf" H 3050 2700 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/G5V-1-DC5/Z773-ND/87831" H 3050 2800 60  0001 L CNN "DK_Detail_Page"
F 10 "RELAY GEN PURPOSE SPDT 1A 5VDC" H 3050 2900 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 3050 3000 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3050 3100 60  0001 L CNN "Status"
	1    2850 1900
	0    1    1    0   
$EndComp
$Comp
L Plug_Pass:+5V #PWR0107
U 1 1 619BF8BC
P 2400 1250
F 0 "#PWR0107" H 2400 1100 50  0001 C CNN
F 1 "+5V" H 2415 1423 50  0000 C CNN
F 2 "" H 2400 1250 50  0001 C CNN
F 3 "" H 2400 1250 50  0001 C CNN
	1    2400 1250
	1    0    0    -1  
$EndComp
$Comp
L Plug_Pass:GNDREF #PWR0144
U 1 1 611BEAA0
P 1850 5250
F 0 "#PWR0144" H 1850 5000 50  0001 C CNN
F 1 "GNDREF" H 1850 5100 50  0000 C CNN
F 2 "" H 1850 5250 50  0001 C CNN
F 3 "" H 1850 5250 50  0001 C CNN
	1    1850 5250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3250 1900 3150 1900
$Comp
L Plug_Pass:GNDREF #PWR0149
U 1 1 61C78EE4
P 3900 2450
F 0 "#PWR0149" H 3900 2200 50  0001 C CNN
F 1 "GNDREF" H 3900 2300 50  0000 C CNN
F 2 "" H 3900 2450 50  0001 C CNN
F 3 "" H 3900 2450 50  0001 C CNN
	1    3900 2450
	1    0    0    -1  
$EndComp
Text GLabel 3600 1350 1    50   Input ~ 0
RLY
Wire Wire Line
	3600 2050 3700 2050
Wire Wire Line
	1850 4450 2650 4450
Wire Wire Line
	2200 4550 2650 4550
Wire Wire Line
	2550 2100 2450 2100
Wire Wire Line
	2450 2100 2450 1900
Wire Wire Line
	2450 1900 2550 1900
Wire Wire Line
	1900 1350 2000 1350
Wire Wire Line
	2000 1350 2000 1700
Wire Wire Line
	2000 1700 1900 1700
Wire Wire Line
	2000 1700 2000 1900
Wire Wire Line
	2000 1900 2450 1900
Connection ~ 2000 1700
Wire Wire Line
	2400 1700 2550 1700
Wire Wire Line
	2400 1250 2400 1700
Wire Wire Line
	3600 1950 3600 2050
Wire Wire Line
	3900 1700 3900 1850
$Comp
L 2N3904:2N3904 Q1
U 1 1 61651C6F
P 3800 2050
F 0 "Q1" H 3944 2096 50  0000 L CNN
F 1 "2N3904" H 3944 2005 50  0000 L CNN
F 2 "TO92127P495H495-3" H 3800 2050 50  0001 L BNN
F 3 "" H 3800 2050 50  0001 L BNN
F 4 "STMicroelectronics" H 3800 2050 50  0001 L BNN "MANUFACTURER"
F 5 "February 2003" H 3800 2050 50  0001 L BNN "PARTREV"
F 6 "IPC 7351B" H 3800 2050 50  0001 L BNN "STANDARD"
F 7 "4.95 mm" H 3800 2050 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
	1    3800 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1700 3900 1700
$Comp
L ECS-51-20-4:ECS-51-20-4 Y1
U 1 1 6119166A
P 1400 4700
F 0 "Y1" V 1450 4900 50  0000 R CNN
F 1 "ECS-51-20-4" V 1300 5100 50  0000 R CNN
F 2 "ECS-51-20-4:XTAL_ECS-51-20-4" H 1400 4700 50  0001 L BNN
F 3 "" H 1400 4700 50  0001 L BNN
	1    1400 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6900 4850 7500 4850
Wire Wire Line
	6900 4750 7500 4750
Connection ~ 2450 1900
Wire Wire Line
	3650 3650 3900 3650
Wire Wire Line
	3900 3650 3900 3550
Wire Wire Line
	3650 3550 3800 3550
Wire Wire Line
	3800 3550 3800 3350
Wire Wire Line
	3650 3750 4450 3750
Wire Wire Line
	5600 3200 5600 3450
Wire Wire Line
	5600 3200 6000 3200
Wire Wire Line
	6900 3650 7400 3650
Wire Wire Line
	7300 3550 7300 3350
Wire Wire Line
	7300 3350 7400 3350
Wire Wire Line
	6900 3550 7300 3550
Wire Wire Line
	8250 5500 8250 5700
$Comp
L Plug_Pass:0025_SS1P3L-M3_84A D1
U 1 1 5F72D525
P 6950 5500
F 0 "D1" H 6950 5400 42  0000 C CNN
F 1 "0025_SS1P3L-M3_84A" H 7000 5600 42  0000 C CNN
F 2 "Plug_Pass:DO220AAL" H 6950 5500 50  0001 C CNN
F 3 "" H 6950 5500 50  0001 C CNN
F 4 "Schottky Diodes & Rectifiers 30volt 1.0amp" H 6950 5500 50  0001 C CNN "Description"
F 5 "SS1P3L-M3/84A" H 6950 5500 50  0001 C CNN "MPN"
F 6 "Vishay Semiconductors" H 6950 5500 50  0001 C CNN "Manufacturer"
	1    6950 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	6650 5500 6650 5400
Wire Wire Line
	6300 5150 6300 5500
Wire Wire Line
	6300 5500 6450 5500
Connection ~ 6300 5150
Wire Wire Line
	5800 4450 5550 4450
Wire Wire Line
	6900 4450 7100 4450
Wire Wire Line
	4750 6500 5000 6500
Wire Wire Line
	3750 6750 3750 7100
Wire Wire Line
	3200 6750 3200 7100
Wire Wire Line
	6200 6500 6200 6400
Wire Wire Line
	5100 6800 5100 7100
Connection ~ 5100 6800
Wire Wire Line
	4750 6500 4750 7100
Wire Wire Line
	3900 2250 3900 2450
Wire Wire Line
	3250 1900 3250 2450
$Comp
L Plug_Pass:MountingHole_Pad GND6
U 1 1 61EB61A0
P 9600 3250
F 0 "GND6" V 9600 3500 50  0000 C CNN
F 1 "GND" V 9500 3400 50  0000 C CNN
F 2 "Plug_Pass:Ground_Pad" H 9600 3250 50  0001 C CNN
F 3 "~" H 9600 3250 50  0001 C CNN
	1    9600 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9700 3250 9750 3250
Wire Wire Line
	9750 3250 9750 3450
Connection ~ 9750 3450
Wire Wire Line
	3350 5050 3350 5250
Wire Wire Line
	3600 1350 3600 1750
Wire Wire Line
	7300 5500 7650 5500
Wire Wire Line
	7900 5500 8000 5500
Wire Wire Line
	8000 5500 8000 5850
Connection ~ 8000 5500
Wire Wire Line
	8000 5500 8250 5500
Wire Wire Line
	7650 5500 7650 5850
Connection ~ 7650 5500
Wire Wire Line
	7650 5500 7700 5500
$Comp
L Plug_Pass:R_Small R6
U 1 1 61D5E5DA
P 3600 1850
F 0 "R6" H 3659 1896 50  0000 L CNN
F 1 "4.7k" H 3659 1805 50  0000 L CNN
F 2 "Plug_Pass:0402-1005X55N" H 3600 1850 50  0001 C CNN
F 3 "~" H 3600 1850 50  0001 C CNN
F 4 "Thick Film Resistors - SMD 4.7k OHM 1%" H 3600 1850 50  0001 C CNN "Description"
F 5 "RC0402FR-074K7L" H 3600 1850 50  0001 C CNN "MPN"
F 6 "Yageo" H 3600 1850 50  0001 C CNN "Manufacturer"
	1    3600 1850
	-1   0    0    1   
$EndComp
$Comp
L Plug_Pass:R_Small R8
U 1 1 6203ECCF
P 4100 3350
F 0 "R8" V 4200 3400 50  0000 L CNN
F 1 "1k" V 4200 3250 50  0000 L CNN
F 2 "Plug_Pass:0402-1005X55N" H 4100 3350 50  0001 C CNN
F 3 "~" H 4100 3350 50  0001 C CNN
F 4 "Thick Film Resistors - SMD 4.7k OHM 1%" H 4100 3350 50  0001 C CNN "Description"
F 5 "RC0402FR-074K7L" H 4100 3350 50  0001 C CNN "MPN"
F 6 "Yageo" H 4100 3350 50  0001 C CNN "Manufacturer"
	1    4100 3350
	0    -1   -1   0   
$EndComp
$Comp
L Plug_Pass:R_Small R9
U 1 1 6204AD14
P 4100 3550
F 0 "R9" V 4200 3600 50  0000 L CNN
F 1 "1k" V 4200 3450 50  0000 L CNN
F 2 "Plug_Pass:0402-1005X55N" H 4100 3550 50  0001 C CNN
F 3 "~" H 4100 3550 50  0001 C CNN
F 4 "Thick Film Resistors - SMD 4.7k OHM 1%" H 4100 3550 50  0001 C CNN "Description"
F 5 "RC0402FR-074K7L" H 4100 3550 50  0001 C CNN "MPN"
F 6 "Yageo" H 4100 3550 50  0001 C CNN "Manufacturer"
	1    4100 3550
	0    -1   -1   0   
$EndComp
$Comp
L Plug_Pass:R_Small R7
U 1 1 62056CE1
P 5800 6500
F 0 "R7" V 5900 6550 50  0000 L CNN
F 1 "1k" V 5900 6400 50  0000 L CNN
F 2 "Plug_Pass:0402-1005X55N" H 5800 6500 50  0001 C CNN
F 3 "~" H 5800 6500 50  0001 C CNN
F 4 "Thick Film Resistors - SMD 4.7k OHM 1%" H 5800 6500 50  0001 C CNN "Description"
F 5 "RC0402FR-074K7L" H 5800 6500 50  0001 C CNN "MPN"
F 6 "Yageo" H 5800 6500 50  0001 C CNN "Manufacturer"
	1    5800 6500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3800 3350 4000 3350
Wire Wire Line
	4200 3350 4500 3350
Wire Wire Line
	4200 3550 4500 3550
Wire Wire Line
	3900 3550 4000 3550
Wire Wire Line
	5500 6500 5700 6500
Wire Wire Line
	5900 6500 6200 6500
Wire Wire Line
	7000 1700 7100 1700
$Comp
L Plug_Pass:C_Small C10
U 1 1 5F66C6B2
P 5500 2100
F 0 "C10" V 5400 2050 50  0000 L CNN
F 1 "1µF" V 5600 1950 50  0000 L CNN
F 2 "Plug_Pass:0603-1608X90N" H 5500 2100 50  0001 C CNN
F 3 "~" H 5500 2100 50  0001 C CNN
F 4 "Multilayer Ceramic Capacitors MLCC - SMD/SMT 10UF 25V 10% 0603" H 5500 2100 50  0001 C CNN "Description"
F 5 "GRM188R61E106KA73D" H 5500 2100 50  0001 C CNN "MPN"
F 6 "Murata Electronics" H 5500 2100 50  0001 C CNN "Manufacturer"
	1    5500 2100
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:TC1108-3.3VDBTR U1
U 1 1 6233DA45
P 5800 1700
F 0 "U1" H 6400 1965 50  0000 C CNN
F 1 "TC1108-3.3VDBTR" H 6400 1874 50  0000 C CNN
F 2 "SOT230P700X180-4N" H 6850 1800 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21357C.pdf" H 6850 1700 50  0001 L CNN
F 4 "Microchip TC1108-3.3VDBTR, LDO Voltage Regulator, 300mA, 3.3 V +/-0.5%, 2.7  6 Vin, 3-Pin SOT-223" H 6850 1600 50  0001 L CNN "Description"
F 5 "1.8" H 6850 1500 50  0001 L CNN "Height"
F 6 "579-TC1108-3.3VDBTR" H 6850 1400 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Microchip-Technology/TC1108-33VDBTR?qs=AIv3GLl6KMNgHSi6BcHPMA%3D%3D" H 6850 1300 50  0001 L CNN "Mouser Price/Stock"
F 8 "Microchip" H 6850 1200 50  0001 L CNN "Manufacturer_Name"
F 9 "TC1108-3.3VDBTR" H 6850 1100 50  0001 L CNN "Manufacturer_Part_Number"
	1    5800 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 1550 5500 1900
Wire Wire Line
	5150 1550 5150 1700
Wire Wire Line
	5500 2200 5500 2400
Wire Wire Line
	5500 1900 5800 1900
Connection ~ 5500 1900
Wire Wire Line
	5500 1900 5500 2000
Wire Wire Line
	5150 1700 5800 1700
Wire Wire Line
	7100 1700 7100 2450
$Comp
L Plug_Pass:GNDREF #PWR0110
U 1 1 623CD4D4
P 5750 2400
F 0 "#PWR0110" H 5750 2150 50  0001 C CNN
F 1 "GNDREF" H 5755 2227 50  0000 C CNN
F 2 "" H 5750 2400 50  0001 C CNN
F 3 "" H 5750 2400 50  0001 C CNN
	1    5750 2400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5750 1800 5800 1800
Wire Wire Line
	5750 1800 5750 2400
Wire Wire Line
	10100 5300 10100 5550
Text GLabel 9700 5400 2    50   Input ~ 0
RESET
Wire Wire Line
	9700 5400 9600 5400
$EndSCHEMATC

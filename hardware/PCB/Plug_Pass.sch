EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Timer_RTC:DS3231M U?
U 1 1 5E8B9162
P 3500 3450
F 0 "U?" H 3500 2961 50  0000 C CNN
F 1 "DS3231M" H 3500 2870 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_7.5x10.3mm_P1.27mm" H 3500 2850 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/DS3231.pdf" H 3770 3500 50  0001 C CNN
	1    3500 3450
	1    0    0    -1  
$EndComp
$Comp
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 5E8BB668
P 5600 3450
F 0 "A?" H 5600 2361 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 5600 2270 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5600 3450 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 5600 3450 50  0001 C CNN
	1    5600 3450
	1    0    0    -1  
$EndComp
$Comp
L Converter_ACDC:IRM-05-15 PS?
U 1 1 5E8C05FF
P 8450 2500
F 0 "PS?" H 8450 2867 50  0000 C CNN
F 1 "IRM-15-05" H 8450 2776 50  0000 C CNN
F 2 "Converter_ACDC:Converter_ACDC_MeanWell_IRM-05-xx_THT" H 8450 2150 50  0001 C CNN
F 3 "https://www.meanwell.com/Upload/PDF/IRM-05/IRM-05-SPEC.PDF" H 8450 2100 50  0001 C CNN
	1    8450 2500
	1    0    0    -1  
$EndComp
$Comp
L dk_Power-Relays-Over-2-Amps:G5LE-14_DC5 RLY?
U 1 1 5E8C2DE4
P 2050 2000
F 0 "RLY?" H 2378 2046 50  0000 L CNN
F 1 "G5LE-14_DC5" H 2378 1955 50  0000 L CNN
F 2 "digikey-footprints:Relay_THT_G5LE-14" H 2250 2200 50  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 2250 2300 60  0001 L CNN
F 4 "Z1011-ND" H 2250 2400 60  0001 L CNN "Digi-Key_PN"
F 5 "G5LE-14 DC5" H 2250 2500 60  0001 L CNN "MPN"
F 6 "Relays" H 2250 2600 60  0001 L CNN "Category"
F 7 "Power Relays, Over 2 Amps" H 2250 2700 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 2250 2800 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/G5LE-14-DC5/Z1011-ND/280371" H 2250 2900 60  0001 L CNN "DK_Detail_Page"
F 10 "RELAY GEN PURPOSE SPDT 10A 5V" H 2250 3000 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 2250 3100 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2250 3200 60  0001 L CNN "Status"
	1    2050 2000
	1    0    0    -1  
$EndComp
$EndSCHEMATC

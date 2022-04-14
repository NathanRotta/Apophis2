EESchema Schematic File Version 4
LIBS:InvertedPend-cache
EELAYER 26 0
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
L PendSymb:power_supply J7
U 1 1 61E3C95B
P 7900 750
F 0 "J7" V 7866 462 50  0000 R CNN
F 1 "power_supply" V 7775 462 50  0000 R CNN
F 2 "Connector_JST:JST_EH_B05B-EH-A_1x05_P2.50mm_Vertical" H 7900 750 50  0001 C CNN
F 3 "~" H 7900 750 50  0001 C CNN
	1    7900 750 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7900 950  7900 1200
Wire Wire Line
	7900 1200 7800 1200
Wire Wire Line
	7800 1200 7800 950 
Text GLabel 7800 1200 0    50   Input ~ 0
GND
$Comp
L PendSymb:Motor J5
U 1 1 61E3CD03
P 6950 900
F 0 "J5" V 7035 520 50  0000 R CNN
F 1 "Motor" V 6944 520 50  0000 R CNN
F 2 "Connector_JST:JST_EH_B06B-EH-A_1x06_P2.50mm_Vertical" H 6950 900 50  0001 C CNN
F 3 "~" H 6950 900 50  0001 C CNN
	1    6950 900 
	0    -1   -1   0   
$EndComp
$Comp
L PendSymb:DE10_LITE J4
U 1 1 61E7C0E7
P 5250 2800
F 0 "J4" H 5300 3917 50  0000 C CNN
F 1 "DE10_LITE" H 5300 3826 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x20_P2.54mm_Horizontal" H 5250 2800 50  0001 C CNN
F 3 "~" H 5250 2800 50  0001 C CNN
	1    5250 2800
	1    0    0    -1  
$EndComp
Text GLabel 5800 2400 2    50   Input ~ 0
GND
Wire Wire Line
	5550 2400 5800 2400
$Comp
L PendSymb:motor_controller J3
U 1 1 61E86F28
P 4050 3650
F 0 "J3" H 4100 4075 50  0000 C CNN
F 1 "motor_controller" H 4100 3984 50  0000 C CNN
F 2 "Connector_JST:JST_EH_B05B-EH-A_1x05_P2.50mm_Vertical" H 4050 3650 50  0001 C CNN
F 3 "~" H 4050 3650 50  0001 C CNN
	1    4050 3650
	1    0    0    -1  
$EndComp
Text GLabel 8100 1050 3    50   Input ~ 0
5V
Text GLabel 3750 3450 0    50   Input ~ 0
5V
Wire Wire Line
	3850 3450 3750 3450
Wire Wire Line
	8100 950  8100 1050
Wire Wire Line
	5050 3800 5050 4350
Wire Wire Line
	5050 4350 3600 4350
Wire Wire Line
	3600 4350 3600 3650
Wire Wire Line
	3600 3650 3850 3650
Wire Wire Line
	5050 3700 4900 3700
Wire Wire Line
	4900 3700 4900 4200
Wire Wire Line
	4900 4200 3700 4200
Wire Wire Line
	3700 4200 3700 3750
Wire Wire Line
	3700 3750 3850 3750
Text GLabel 3850 3850 3    50   Input ~ 0
GND
Wire Wire Line
	5050 3600 4550 3600
Wire Wire Line
	4550 3600 4550 3100
Wire Wire Line
	4550 3100 3250 3100
Wire Wire Line
	3250 3100 3250 3550
Wire Wire Line
	3250 3550 3850 3550
$Comp
L PendSymb:Encoder J2
U 1 1 61E87581
P 1700 1650
F 0 "J2" H 2100 1550 50  0000 C CNN
F 1 "Encoder" H 2150 1650 50  0000 C CNN
F 2 "Connector_JST:JST_EH_B05B-EH-A_1x05_P2.50mm_Vertical" H 1700 1650 50  0001 C CNN
F 3 "~" H 1700 1650 50  0001 C CNN
	1    1700 1650
	-1   0    0    1   
$EndComp
$Comp
L PendSymb:Encoder J1
U 1 1 61E8761A
P 1650 2500
F 0 "J1" H 1689 2083 50  0000 C CNN
F 1 "Encoder" H 1689 2174 50  0000 C CNN
F 2 "Connector_JST:JST_EH_B05B-EH-A_1x05_P2.50mm_Vertical" H 1650 2500 50  0001 C CNN
F 3 "~" H 1650 2500 50  0001 C CNN
	1    1650 2500
	-1   0    0    1   
$EndComp
Text GLabel 1900 1850 3    50   Input ~ 0
5V
Text GLabel 1850 2700 2    50   Input ~ 0
5V
Text GLabel 1850 2600 2    50   Input ~ 0
GND
Text GLabel 1900 1750 2    50   Input ~ 0
GND
Wire Wire Line
	4950 2000 5050 2000
Text GLabel 2950 650  1    50   Input ~ 0
5V
$Comp
L Device:R R5
U 1 1 620588F7
P 2950 900
F 0 "R5" H 3020 946 50  0000 L CNN
F 1 "R1kΩ" H 3020 855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 2880 900 50  0001 C CNN
F 3 "~" H 2950 900 50  0001 C CNN
	1    2950 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 650  2950 750 
Text GLabel 4200 650  1    50   Input ~ 0
5V
$Comp
L Device:R R6
U 1 1 6205C079
P 4200 900
F 0 "R6" H 4270 946 50  0000 L CNN
F 1 "R1kΩ" H 4270 855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 4130 900 50  0001 C CNN
F 3 "~" H 4200 900 50  0001 C CNN
	1    4200 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 650  4200 750 
Text GLabel 1500 4400 3    50   Input ~ 0
5V
$Comp
L Device:R R2
U 1 1 6205D638
P 1500 4150
F 0 "R2" H 1570 4196 50  0000 L CNN
F 1 "R1kΩ" H 1570 4105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 1430 4150 50  0001 C CNN
F 3 "~" H 1500 4150 50  0001 C CNN
	1    1500 4150
	-1   0    0    1   
$EndComp
Wire Wire Line
	1500 4400 1500 4300
Text GLabel 2750 4400 3    50   Input ~ 0
5V
$Comp
L Device:R R4
U 1 1 6205E3FD
P 2750 4150
F 0 "R4" H 2820 4196 50  0000 L CNN
F 1 "R1kΩ" H 2820 4105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 2680 4150 50  0001 C CNN
F 3 "~" H 2750 4150 50  0001 C CNN
	1    2750 4150
	-1   0    0    1   
$EndComp
Wire Wire Line
	2750 4400 2750 4300
Wire Wire Line
	2750 4000 2750 3850
Wire Wire Line
	2750 3850 2700 3850
Connection ~ 2750 3850
Wire Wire Line
	2750 2400 1850 2400
Wire Wire Line
	2750 2400 2750 3850
Wire Wire Line
	1500 3450 2300 3450
Wire Wire Line
	2300 3450 2300 2500
Wire Wire Line
	1850 3250 1850 2800
Wire Wire Line
	1850 2800 3750 2800
Text GLabel 1950 5850 3    50   Input ~ 0
5V
$Comp
L Device:R R3
U 1 1 620667FA
P 1950 5600
F 0 "R3" H 2020 5646 50  0000 L CNN
F 1 "R1kΩ" H 2020 5555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 1880 5600 50  0001 C CNN
F 3 "~" H 1950 5600 50  0001 C CNN
	1    1950 5600
	1    0    0    1   
$EndComp
Wire Wire Line
	1950 5850 1950 5750
Wire Wire Line
	1950 5450 1950 5300
Wire Wire Line
	1850 2300 1850 2000
Wire Wire Line
	1850 2000 650  2000
Wire Wire Line
	650  2000 650  5300
Wire Wire Line
	650  5300 1950 5300
Connection ~ 1950 5300
Wire Wire Line
	3100 3000 4100 3000
Wire Wire Line
	3750 2200 5050 2200
Wire Wire Line
	3750 2200 3750 2800
Wire Wire Line
	3900 2300 5050 2300
Wire Wire Line
	3900 2300 3900 2900
Wire Wire Line
	4100 2400 5050 2400
Wire Wire Line
	4100 2400 4100 3000
Text GLabel 700  650  1    50   Input ~ 0
5V
$Comp
L Device:R R1
U 1 1 62078535
P 700 900
F 0 "R1" H 770 946 50  0000 L CNN
F 1 "R1kΩ" H 770 855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 630 900 50  0001 C CNN
F 3 "~" H 700 900 50  0001 C CNN
	1    700  900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  650  700  750 
Wire Wire Line
	700  1050 700  1100
Wire Wire Line
	1900 1450 2100 1450
Wire Wire Line
	2100 1450 2100 1100
Wire Wire Line
	2100 1100 700  1100
Connection ~ 700  1100
Wire Wire Line
	700  1100 700  1200
Wire Wire Line
	2450 2100 5050 2100
Wire Wire Line
	2950 1500 1900 1500
Wire Wire Line
	1900 1500 1900 1550
Wire Wire Line
	4950 1950 4950 2000
Wire Wire Line
	4600 1900 5050 1900
Wire Wire Line
	1900 1600 1900 1650
Wire Wire Line
	1900 1600 4200 1600
Wire Wire Line
	3100 3000 3100 5000
Text GLabel 2700 5300 2    50   Input ~ 0
GND
Text GLabel 1100 3450 0    50   Input ~ 0
GND
Text GLabel 2400 3850 0    50   Input ~ 0
GND
Text GLabel 3400 1150 2    50   Input ~ 0
GND
Text GLabel 4950 1200 2    50   Input ~ 0
GND
Wire Wire Line
	2450 2100 2450 700 
Wire Wire Line
	2450 700  1100 700 
Text GLabel 1450 1200 2    50   Input ~ 0
GND
NoConn ~ 7700 950 
Wire Wire Line
	6850 1100 6850 1600
Text GLabel 7550 1900 2    50   Input ~ 0
GND
Text GLabel 6300 1900 3    50   Input ~ 0
5V
$Comp
L Device:R R7
U 1 1 620C66E4
P 6300 1550
F 0 "R7" H 6370 1596 50  0000 L CNN
F 1 "R1kΩ" H 6370 1505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 6230 1550 50  0001 C CNN
F 3 "~" H 6300 1550 50  0001 C CNN
	1    6300 1550
	-1   0    0    1   
$EndComp
Text GLabel 6300 1000 1    50   Input ~ 0
GND
Text GLabel 7600 2050 2    50   Input ~ 0
5V
Wire Wire Line
	7600 2050 7500 2050
Wire Wire Line
	7200 2050 7150 2050
Wire Wire Line
	7050 2050 7050 2100
Text GLabel 7050 2400 3    50   Input ~ 0
GND
Wire Wire Line
	7150 1100 7150 2050
Connection ~ 7150 2050
Wire Wire Line
	7150 2050 7050 2050
Wire Wire Line
	7250 1100 7250 1400
Wire Wire Line
	7250 1400 6300 1400
Text GLabel 6950 1100 3    50   Input ~ 0
GND
Text GLabel 7050 1100 3    50   Input ~ 0
5V
Text GLabel 6250 1400 0    50   Input ~ 0
moterencoderA
Text GLabel 7050 2050 0    50   Input ~ 0
motorencoderB
Text GLabel 5050 2500 0    50   Input ~ 0
moterencoderA
Text GLabel 5050 2600 0    50   Input ~ 0
motorencoderB
Wire Wire Line
	4200 1050 4200 1200
$Comp
L Device:D_Zener D6
U 1 1 622B24BA
P 4600 1200
F 0 "D6" H 4600 1416 50  0000 C CNN
F 1 "D_Zener(1N746)" H 4600 1325 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" H 4600 1200 50  0001 C CNN
F 3 "~" H 4600 1200 50  0001 C CNN
	1    4600 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1200 4950 1200
Wire Wire Line
	4450 1200 4200 1200
Connection ~ 4200 1200
Wire Wire Line
	4200 1200 4200 1350
Wire Wire Line
	2950 1050 2950 1150
$Comp
L Device:D_Zener D5
U 1 1 622B9295
P 3250 1150
F 0 "D5" H 3250 1366 50  0000 C CNN
F 1 "D_Zener(1N746)" H 3250 1275 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" H 3250 1150 50  0001 C CNN
F 3 "~" H 3250 1150 50  0001 C CNN
	1    3250 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1950 3100 1150
Wire Wire Line
	3100 1950 4950 1950
Wire Wire Line
	2950 1150 3100 1150
Connection ~ 2950 1150
Wire Wire Line
	2950 1150 2950 1500
Connection ~ 3100 1150
$Comp
L Device:D_Zener D1
U 1 1 622BFC2F
P 1300 1200
F 0 "D1" H 1300 1416 50  0000 C CNN
F 1 "D_Zener(1N746)" H 1300 1325 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" H 1300 1200 50  0001 C CNN
F 3 "~" H 1300 1200 50  0001 C CNN
	1    1300 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 700  1100 1200
Wire Wire Line
	1100 1200 1150 1200
Wire Wire Line
	700  1200 1100 1200
Connection ~ 1100 1200
Wire Wire Line
	1850 2500 2300 2500
Wire Wire Line
	1850 3250 1500 3250
Wire Wire Line
	1500 3250 1500 3450
Connection ~ 1500 3450
$Comp
L Device:D_Zener D2
U 1 1 622CD55B
P 1300 3450
F 0 "D2" H 1300 3234 50  0000 C CNN
F 1 "D_Zener(1N746)" H 1300 3325 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" H 1300 3450 50  0001 C CNN
F 3 "~" H 1300 3450 50  0001 C CNN
	1    1300 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	1100 3450 1150 3450
Wire Wire Line
	1500 3450 1500 4000
Wire Wire Line
	1450 3450 1500 3450
$Comp
L Device:D_Zener D4
U 1 1 622DAB62
P 2550 3850
F 0 "D4" H 2550 3634 50  0000 C CNN
F 1 "D_Zener(1N746)" H 2550 3725 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" H 2550 3850 50  0001 C CNN
F 3 "~" H 2550 3850 50  0001 C CNN
	1    2550 3850
	-1   0    0    1   
$EndComp
Wire Wire Line
	3900 2900 2950 2900
Wire Wire Line
	2950 2900 2950 3850
Wire Wire Line
	2950 3850 2750 3850
$Comp
L Device:D_Zener D3
U 1 1 622DE222
P 2400 5300
F 0 "D3" H 2400 5516 50  0000 C CNN
F 1 "D_Zener(1N746)" H 2400 5425 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" H 2400 5300 50  0001 C CNN
F 3 "~" H 2400 5300 50  0001 C CNN
	1    2400 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 5300 2700 5300
Wire Wire Line
	1950 5000 1950 5300
Wire Wire Line
	1950 5000 3100 5000
Wire Wire Line
	1950 5300 2250 5300
Connection ~ 6300 1400
Wire Wire Line
	6300 1400 6250 1400
Wire Wire Line
	6300 1700 6300 1900
$Comp
L Device:D_Zener D7
U 1 1 622EAFD3
P 6300 1150
F 0 "D7" V 6346 1071 50  0000 R CNN
F 1 "D_Zener(1N746)" V 6350 1850 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" H 6300 1150 50  0001 C CNN
F 3 "~" H 6300 1150 50  0001 C CNN
	1    6300 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6300 1300 6300 1400
$Comp
L Device:R R8
U 1 1 620D0A91
P 7350 2050
F 0 "R8" H 7420 2096 50  0000 L CNN
F 1 "R1kΩ" H 7420 2005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 7280 2050 50  0001 C CNN
F 3 "~" H 7350 2050 50  0001 C CNN
	1    7350 2050
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D8
U 1 1 622EE44D
P 7050 2250
F 0 "D8" V 7096 2171 50  0000 R CNN
F 1 "D_Zener(1N746)" V 7250 3050 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" H 7050 2250 50  0001 C CNN
F 3 "~" H 7050 2250 50  0001 C CNN
	1    7050 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	4600 1900 4600 1350
Wire Wire Line
	4600 1350 4200 1350
Connection ~ 4200 1350
Wire Wire Line
	4200 1350 4200 1600
$Comp
L Connector_Generic:Conn_02x01 J6
U 1 1 622F5218
P 6750 1850
F 0 "J6" H 6800 2067 50  0000 C CNN
F 1 "Motor Port 2" H 6800 1976 50  0000 C CNN
F 2 "Connector_JST:JST_EH_B02B-EH-A_1x02_P2.50mm_Vertical" H 6750 1850 50  0001 C CNN
F 3 "~" H 6750 1850 50  0001 C CNN
	1    6750 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 1100 6750 1550
Wire Wire Line
	6750 1550 6550 1550
Wire Wire Line
	6550 1550 6550 1850
Wire Wire Line
	6850 1600 7050 1600
Wire Wire Line
	7050 1600 7050 1850
$Comp
L Connector_Generic:Conn_02x01 J8
U 1 1 622FB7AF
P 7550 1600
F 0 "J8" V 7554 1680 50  0000 L CNN
F 1 "Motor Port 3" V 7645 1680 50  0000 L CNN
F 2 "Connector_JST:JST_EH_B02B-EH-A_1x02_P2.50mm_Vertical" H 7550 1600 50  0001 C CNN
F 3 "~" H 7550 1600 50  0001 C CNN
	1    7550 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	8000 950  8000 1400
Wire Wire Line
	8000 1400 7550 1400
$EndSCHEMATC

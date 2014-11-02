# MPLAB IDE generated this makefile for use with GNU make.
# Project: USB Host - HID - Mouse - C32.mcp
# Date: Sun Nov 02 12:08:23 2014

AS = pic32-as.exe
CC = pic32-gcc.exe
LD = pic32-ld.exe
AR = pic32-ar.exe
HX = pic32-bin2hex.exe
RM = rm

USB\ Host\ -\ HID\ -\ Mouse\ -\ C32.hex : USB\ Host\ -\ HID\ -\ Mouse\ -\ C32.elf
	$(HX) "USB Host - HID - Mouse - C32.elf"

USB\ Host\ -\ HID\ -\ Mouse\ -\ C32.elf : Objects/C32/usb_config.o Objects/C32/usb_host.o Objects/C32/usb_host_hid_parser.o Objects/C32/usb_host_hid.o Objects/C32/Mouse_demo.o
	$(CC) -mprocessor=32MX675F512H "Objects\C32\usb_config.o" "Objects\C32\usb_host.o" "Objects\C32\usb_host_hid_parser.o" "Objects\C32\usb_host_hid.o" "Objects\C32\Mouse_demo.o" -o"USB Host - HID - Mouse - C32.elf" -Wl,-L"C:\Program Files\Microchip\MPLAB C32 Suite\lib",-L"C:\Program Files\Microchip\MPLAB C32 Suite\pic32mx\lib",--defsym=__MPLAB_BUILD=1,--defsym=_min_heap_size=1000,-Map="USB Host - HID - Mouse - C32.map"

Objects/C32/usb_config.o : usb_config.c Include/GenericTypeDefs.h HardwareProfile.h Include/uart2.h Include/USB/usb.h Include/Compiler.h usb_config.h Include/usb/usb_common.h Include/usb/usb_ch9.h Include/usb/usb_host.h Include/usb/usb_hal.h Include/USB/usb_hal_pic32.h Include/USB/usb_host_hid.h Include/USB/usb_host_hid_parser.h
	$(CC) -mprocessor=32MX675F512H -x c -c "usb_config.c" -o"Objects\C32\usb_config.o" -MMD -MF"Objects\C32\usb_config.d" -I"." -I"Include" -g

Objects/C32/usb_host.o : USB/usb_host.c Include/GenericTypeDefs.h Include/USB/usb.h Include/Compiler.h usb_config.h Include/usb/usb_common.h Include/usb/usb_ch9.h Include/usb/usb_host.h Include/usb/usb_hal.h Include/USB/usb_hal_pic32.h USB/usb_host_local.h USB/usb_hal_local.h Include/usb/usb.h USB/usb_pic32.h USB/usb_hal_local.h HardwareProfile.h Include/uart2.h
	$(CC) -mprocessor=32MX675F512H -x c -c "USB\usb_host.c" -o"Objects\C32\usb_host.o" -MMD -MF"Objects\C32\usb_host.d" -I"." -I"Include" -g

Objects/C32/usb_host_hid_parser.o : USB/HID\ Host\ Driver/usb_host_hid_parser.c Include/GenericTypeDefs.h HardwareProfile.h Include/uart2.h usb_config.h Include/USB/usb.h Include/Compiler.h Include/usb/usb_common.h Include/usb/usb_ch9.h Include/usb/usb_host.h Include/usb/usb_hal.h Include/USB/usb_hal_pic32.h Include/USB/usb_host_hid.h Include/USB/usb_host_hid_parser.h Include/USB/usb_host_hid_parser.h
	$(CC) -mprocessor=32MX675F512H -x c -c "USB\HID Host Driver\usb_host_hid_parser.c" -o"Objects\C32\usb_host_hid_parser.o" -MMD -MF"Objects\C32\usb_host_hid_parser.d" -I"." -I"Include" -g

Objects/C32/usb_host_hid.o : USB/HID\ Host\ Driver/usb_host_hid.c Include/GenericTypeDefs.h HardwareProfile.h Include/uart2.h usb_config.h Include/USB/usb.h Include/Compiler.h Include/usb/usb_common.h Include/usb/usb_ch9.h Include/usb/usb_host.h Include/usb/usb_hal.h Include/USB/usb_hal_pic32.h Include/USB/usb_host_hid.h Include/USB/usb_host_hid_parser.h Include/USB/usb_host_hid_parser.h
	$(CC) -mprocessor=32MX675F512H -x c -c "USB\HID Host Driver\usb_host_hid.c" -o"Objects\C32\usb_host_hid.o" -MMD -MF"Objects\C32\usb_host_hid.d" -I"." -I"Include" -g

Objects/C32/Mouse_demo.o : Mouse_demo.c Include/GenericTypeDefs.h HardwareProfile.h Include/uart2.h usb_config.h Include/USB/usb.h Include/Compiler.h usb_config.h Include/usb/usb_common.h Include/usb/usb_ch9.h Include/usb/usb_host.h Include/usb/usb_hal.h Include/USB/usb_hal_pic32.h Include/USB/usb_host_hid_parser.h Include/USB/usb_host_hid.h Include/USB/usb_host_hid_parser.h
	$(CC) -mprocessor=32MX675F512H -x c -c "Mouse_demo.c" -o"Objects\C32\Mouse_demo.o" -MMD -MF"Objects\C32\Mouse_demo.d" -I"." -I"Include" -g

clean : 
	$(RM) "Objects\C32\usb_config.o" "Objects\C32\usb_host.o" "Objects\C32\usb_host_hid_parser.o" "Objects\C32\usb_host_hid.o" "Objects\C32\Mouse_demo.o" "USB Host - HID - Mouse - C32.elf" "USB Host - HID - Mouse - C32.hex"


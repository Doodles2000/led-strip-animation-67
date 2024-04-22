PROGRAM = led-strip-animation-67

# add the following two lines to EXTRA_COMPONENTS when using LCM
#extras/dhcpserver \
#$(abspath components/esp8266-open-rtos/wifi_config) \

EXTRA_COMPONENTS = \
	extras/http-parser \
	extras/i2s_dma \
	extras/ws2812_i2s \
	extras/dhcpserver \
    $(abspath components/esp8266-open-rtos/wifi_config) \
	$(abspath components/esp8266-open-rtos/cJSON) \
	$(abspath components/common/wolfssl) \
	$(abspath components/common/homekit) \
	$(abspath components/esp8266-open-rtos/WS2812FX)


# define the two lines below in local.mk
#FLASH_SIZE ?= 8
#HOMEKIT_SPI_FLASH_BASE_ADDR ?= 0x7A000

EXTRA_CFLAGS += -I../.. -DHOMEKIT_SHORT_APPLE_UUIDS

include $(SDK_PATH)/common.mk
#include $(abspath ../../wifi.h) //not required as we are using LCM that has wifi details in sysparam

LIBS += m

monitor:
	$(FILTEROUTPUT) --port $(ESPPORT) --baud 115200 --elf $(PROGRAM_OUT)


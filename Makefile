NAME = edge-impulse-standalone

CC ?= g++
CFLAGS ?= -Wall

MACROS +=
CFLAGS += -std=c++11
CFLAGS += -I.
CFLAGS += -Isource
CFLAGS += -Iedge-impulse-sdk/
CFLAGS += -Iedge-impulse-sdk/utensor
CFLAGS += -Iedge-impulse-sdk/utensor/src
CFLAGS += -Iedge-impulse-sdk/utensor/src/uTensor
CFLAGS += -Iedge-impulse-sdk/utensor/src/uTensor/core
CFLAGS += -Iedge-impulse-sdk/utensor/src/uTensor/loaders
CFLAGS += -Iedge-impulse-sdk/utensor/src/uTensor/ops
CFLAGS += -Iedge-impulse-sdk/utensor/src/uTensor/util
CFLAGS += edge-impulse-sdk/utensor/libutensor.a
CFLAGS += -Imodel-parameters
CFLAGS += -Iutensor-model
CFLAGS += -Iedge-impulse-sdk/anomaly
CFLAGS += -Iedge-impulse-sdk/classifier
CFLAGS += -Iedge-impulse-sdk/dsp
CFLAGS += -Iedge-impulse-sdk/dsp/kissfft
CFLAGS += -Iedge-impulse-sdk/porting
CFLAGS += -lc++
CFLAGS += -fprofile-arcs -ftest-coverage

LFLAGS += --coverage

all: build

.PHONY: build clean

build:
	mkdir -p build
	rm -rf *.gcda
	rm -rf *.gcno
	$(CC) $(MACROS) $(CFLAGS) $(LFLAGS) source/*.cpp edge-impulse-sdk/dsp/kissfft/*.cpp edge-impulse-sdk/dsp/dct/*.cpp edge-impulse-sdk/porting/posix/*.cpp utensor-model/*.cpp -o build/$(NAME)
	rm -rf *.gcda
	rm -rf *.gcno

clean:
	rm $(NAME)

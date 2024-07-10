# Makefile for Assignment 1
CC=gcc
CFLAGS=-O2 -Wall -Werror -Wno-unused-result -std=c99
LDFLAGS=-lm
SEARCHER_SOURCE=smallest_triangle.c
SEARCHER_BINARY=smallest_triangle

# non dependency commands for this Makefile
.PHONY: build
.PHONY: generator
.PHONY: searcher
.PHONY: sample
.PHONY: test
.PHONY: clean

# default rule
build: searcher
	${CC} ${CFLAGS} ${SEARCHER_SOURCE} -o ${SEARCHER_BINARY} ${LDFLAGS}

# execute a sample Generator program and pipe result to Searcher program
sample:
	python3 gen_points.py -N=20 -mindist=2 -rseed=3 | ./smallest_triangle

# run tests
test:
	chmod u+x test.sh
	./test.sh

# removes compiled binary/object files
clean:
	rm -f $(SEARCHER_BINARY) *.o

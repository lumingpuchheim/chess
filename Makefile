SHELL := /bin/bash

# Find all directories recursively containing main.tex
TEX_DIRS := $(shell find . -type f -name "main.tex" -exec dirname {} \; | sort -u)

all:
	@for dir in $(TEX_DIRS); do \
		echo "Compiling in $$dir"; \
		( cd "$$dir" && pdflatex -interaction nonstopmode main.tex > /dev/null 2>&1 || true ); \
	done

clean:
	@find . -name "*.aux" -o -name "*.log" -o -name "*.out" -o -name "*.pdf" | xargs rm -f

.PHONY: all clean
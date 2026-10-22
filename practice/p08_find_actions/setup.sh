#!/usr/bin/env bash
# Practice p08 · find: acting on what you find
# Stimulus: creates the input files in the current directory.

mkdir -p project/src project/docs project/build
echo "int main() { return 0; }" > project/src/main.c
echo "void helper() {}" > project/src/util.c
touch project/src/config.h
echo "Build notes" > project/docs/notes.txt
touch project/build/main.o project/build/util.o

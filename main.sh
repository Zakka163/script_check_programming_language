#!/bin/bash

echo "🔎 Scanning ALL programming languages on macOS"
echo "================================================"
echo

LANGS=(
# ---- Popular ----
python python3 pypy
node npm deno bun
ruby irb
php
perl
lua luajit
go
rustc cargo
swift
javac java kotlin kotlinc scala groovy
dotnet fsi csc
gcc g++ clang clang++
make cmake meson ninja

# ---- Functional ----
elixir iex
erl
ghc runghc
ocaml opam
fsharp
clojure lein bb
racket
scheme guile chez

# ---- Systems / Low level ----
zig
nim
crystal
dmd ldc2 gdc   # D language
v
odin
jai
red
vala
fortran gfortran
pascal fpc

# ---- Data / Scientific ----
R julia octave matlab
sage

# ---- Shell / Scripting ----
bash zsh fish dash ksh
awk sed

# ---- Web / Misc ----
wasm wat2wasm
haxe
reason
rescript
dart
flutter

# ---- Esoteric / Rare ----
cobc     # COBOL
clisp sbcl
io
pony
factor
idris
agda

# ---- Mobile / Apple ----
xcodebuild
metal
)

FOUND=0

for cmd in "${LANGS[@]}"; do
  if command -v "$cmd" >/dev/null 2>&1; then
    FOUND=1
    echo "✅ $cmd"
    "$cmd" --version 2>&1 | head -n 2
    echo "----------------------------------------"
  fi
done

if [ $FOUND -eq 0 ]; then
  echo "❌ No programming languages detected"
fi

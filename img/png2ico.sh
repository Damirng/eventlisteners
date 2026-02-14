#!/bin/bash
# Запуск: ./png2ico.sh logo.png logo.ico
magick "$1" -write mpr:original +delete \
  \( mpr:original -resize 16x16 -write mpr:16 +delete \) \
  \( mpr:original -resize 24x24 -write mpr:24 +delete \) \
  \( mpr:original -resize 32x32 -write mpr:32 +delete \) \
  \( mpr:original -resize 48x48 -write mpr:48 +delete \) \
  \( mpr:original -resize 64x64 -write mpr:64 +delete \) \
  \( mpr:original -resize 128x128 -write mpr:128 +delete \) \
  \( mpr:original -resize 256x256 -write mpr:256 +delete \) \
  mpr:16 mpr:24 mpr:32 mpr:48 mpr:64 mpr:128 mpr:256 "$2"

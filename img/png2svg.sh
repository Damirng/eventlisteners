#!/bin/bash
# Использование: ./png2svg.sh logo.png

# Проверяем, передан ли аргумент
if [ -z "$1" ]; then
  echo "Ошибка: укажите входной PNG-файл."
  echo "Пример: ./png2svg.sh logo.png"
  exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="${INPUT_FILE%.png}.svg"

# Проверяем существование файла
if [ ! -f "$INPUT_FILE" ]; then
  echo "Ошибка: файл $INPUT_FILE не найден."
  exit 1
fi

# Конвертируем через Inkscape
/Applications/Inkscape.app/Contents/MacOS/inkscape \
  --export-type=svg \
  --export-filename="$OUTPUT_FILE" \
  "$INPUT_FILE"

echo "Готово: $OUTPUT_FILE создан."

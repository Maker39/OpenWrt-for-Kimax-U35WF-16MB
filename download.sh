#!/bin/bash
set -e

VERSION="25.12.5"
TARGET="ramips"
SUBTARGET="mt7620"

IB_NAME="openwrt-imagebuilder-${VERSION}-${TARGET}-${SUBTARGET}.Linux-x86_64"
DOWNLOAD_URL="https://downloads.openwrt.org/releases/${VERSION}/targets/${TARGET}/${SUBTARGET}/${IB_NAME}.tar.zst"

echo "=== НАЧАЛО СКАЧИВАНИЯ ==="
echo "Ссылка: ${DOWNLOAD_URL}"

# Скачиваем файл с повторными попытками при сбое
wget --tries=3 --retry-connrefused -q "$DOWNLOAD_URL"

echo "Файл успешно скачан. Проверка наличия архива:"
ls -lh *.tar.zst

echo "Распаковка..."
tar --zstd -xf "${IB_NAME}.tar.zst"

echo "Переименование..."
mv "${IB_NAME}" openwrt-ib
echo "=== РАСПАКОВКА ЗАВЕРШЕНА ==="

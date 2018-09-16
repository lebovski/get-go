#!/bin/bash
set -e

VERSION=$1

DFILE=go${VERSION}.linux-amd64.tar.gz
INSTALL_DIR=/usr/local

echo "Check for go exists..."
if [ -d "/usr/local/go" ]; then
  CUR_VER="$(/usr/local/go/bin/go version)"
  echo "Remove existing version: ${CUR_VER}"
  rm -rf ${INSTALL_DIR}/go
fi

echo "Downloading $DFILE ..."
wget https://storage.googleapis.com/golang/${DFILE} -O /tmp/${DFILE}

if [ $? -ne 0 ]; then
    echo "Download failed! Exiting."
    exit 1
fi

echo "Extracting File..."
tar -C ${INSTALL_DIR} -xzf /tmp/${DFILE}

echo -e "\nGo $VERSION was installed."
rm -f /tmp/${DFILE}

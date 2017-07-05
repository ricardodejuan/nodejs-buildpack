#!/bin/bash
install_java() {
  local dir="$1"

  local download_url="http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz"
  echo "Downloading JAVA [$download_url]"
  curl  --silent --fail --retry 5 --retry-max-time 15 -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" "$download_url" -o /tmp/java.tar.gz || (echo "Unable to download java; does it exist?" && false)
  echo "Download complete!"

  echo "Installing JAVA"
  mkdir /tmp/jdk
  mkdir $dir
  tar xzf /tmp/java.tar.gz -C /tmp/jdk
  rm -rf $dir/*
  mv /tmp/jdk/jdk1.8.0_131/* $dir
  chmod +x $dir/bin
  ls $dir
  echo "Installation complete!"
}

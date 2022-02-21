#!/bin/bash
  
echo "update your vm"
apt-get -y update

echo "Installing java version 8"
apt install -y openjdk-8-jdk

echo "check java version"
java -version

echo "export java varaibales"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
echo "check JAVA_HOME path"
echo $JAVA_HOME

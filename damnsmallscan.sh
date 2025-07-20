#!/bin/bash
# Menesay
# 20.07.2025

if [ -z "$1" ]; then
    echo "useage: sudo $0 <ip>"
    exit 1
fi

TARGET_IP=$1

echo "[*] tüm portlar taranıyor."
sudo nmap --min-rate 10000 -p- $TARGET_IP | grep open > openservices.txt

echo "[*] open portlar extract ediliyor."
cat openservices.txt | sed 's/\// /g' | awk '{print $1}' | tr "\n" "," | sed 's/,$//' > openports.txt

echo "[*] open portlara agresif tarama yapılıyor."
sudo nmap -v -sVC -p $(cat openports.txt) $TARGET_IP | tee nmap.txt

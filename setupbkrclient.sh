#!/bin/bash
# scripts for fedora
sudo dnf install beaker-client  krb5-workstation -y

cert_url=https://password.corp.redhat.com/RH-IT-Root-CA.crt
sudo wget $cert_url --no-check-certificate -O /etc/beaker/RedHatInternalCA.pem

mkdir -p ~/.beaker_client
cat > ~/.beaker_client/config << EOF
HUB_URL = "https://beaker.engineering.redhat.com"
AUTH_METHOD = "krbv"
KRB_REALM = "REDHAT.COM"
CA_CERT = "/etc/beaker/RedHatInternalCA.pem"
EOF

kinit $i

CHECK_CONFIG=`bkr whoami`
echo $CHECK_CONFIG

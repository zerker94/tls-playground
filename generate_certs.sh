# Generate CA certificate

pki --gen --type ecdsa --size 256 --outform pem > caKey.pem

pki --self --ca --lifetime 3652 --in caKey.pem \
           --dn "C=DE, O=H-BRS, CN=Root CA" \
           --outform pem > caCert.pem

# Generate Moon certificate


pki --gen --type ecdsa  --size 256 --outform pem > moonKey.pem


pki --req --type priv --in moonKey.pem \
          --dn "C=DE, O=H-BRS, CN=moon" \
          --san moon --outform pem > moonReq.pem

pki --issue --cacert caCert.pem --cakey caKey.pem \
            --type pkcs10 --in moonReq.pem --serial 01 --lifetime 1826 \
            --outform pem > moonCert.pem

# Generate Sun certificate


pki --gen --type ecdsa  --size 256 --outform pem > sunKey.pem


pki --req --type priv --in sunKey.pem \
          --dn "C=DE, O=H-BRS, CN=sun" \
          --san sun --outform pem > sunReq.pem

pki --issue --cacert caCert.pem --cakey caKey.pem \
            --type pkcs10 --in sunReq.pem --serial 01 --lifetime 1826 \
            --outform pem > sunCert.pem

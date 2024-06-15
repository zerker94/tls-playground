cd ~

wget https://download.strongswan.org/strongswan-6.0.0beta6.tar.bz2

tar xjf strongswan-6.0.0beta6.tar.bz2

cd strongswan-6.0.0beta6/

./configure --prefix=/usr --sysconfdir=/etc --enable-cmd --enable-conftest --enable-cert-enroll --enable-ccm --enable-chapoly --enable-dhcp --enable-eap-peap --enable-eap-mschapv2 --enable-eap-md5 --enable-eap-identity --enable-eap-radius --enable-eap-tls --enable-eap-ttls --enable-monolithic --enable-save-keys

make

sudo make install

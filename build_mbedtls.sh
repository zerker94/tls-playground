cd ~

# Fork my repo at https://github.com/hannestschofenig/mbedtls.git
# Add the URL of the forked repo here
git clone <YOUR URL GOES IN HERE>

cd mbedtls

make generated_files

mkdir build

cd build

cmake ..


#!/bin/bash
set -x
tar jxvf gmp-5.0.5.tar.bz2
cd gmp-5.0.5
./configure --prefix=/usr/local/gmp && make && make install && cd ..
echo "/usr/local/gmp/lib" >> /etc/ld.so.conf

tar jxvf mpfr-3.1.3.tar.bz2
cd mpfr-3.1.3
./configure --prefix=/usr/local/mpfr --with-gmp=/usr/local/gmp && make && make install && cd ..
echo "/usr/local/mpfr/lib" >> /etc/ld.so.conf

tar xzvf mpc-1.0.tar.gz
cd mpc-1.0
./configure --prefix=/usr/local/mpc --with-gmp=/usr/local/gmp/ --with-mpfr=/usr/local/mpfr/
make && make install && cd ..
echo "/usr/local/mpc/lib" >> /etc/ld.so.conf

ldconfig

yum -y install glibc-devel.i686  libgcc.i686 
tar jxf gcc-4.9.3.tar.bz2
cd gcc-4.9.3
./configure --prefix=/usr/local/gcc --with-mpc=/usr/local/mpc/ --with-gmp=/usr/local/gmp/ --with-mpfr=/usr/local/mpfr/
make && make install && cd -
echo 'export PATH=/usr/local/gcc/bin:$PATH' > /etc/profile.d/gcc.sh
ln -s /usr/local/gcc/bin/{gcc,cc}
echo -e '/usr/local/gcc/lib\n/usr/local/gcc/lib64' > /etc/ld.so.conf.d/gcc4.9.conf && ldconfig


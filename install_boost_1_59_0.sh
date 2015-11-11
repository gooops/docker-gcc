if [ ! -d boost_1_59_0 ];then
 tar zxf boost_1_59_0.tar.gz
fi
cd boost_1_59_0
./bootstrap.sh
./b2
./b2 install

# 1. KEEP UBUNTU OR DEBIAN 's apt-cache UP TO DATE
sudo apt-get update

export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/$(curl http://ip-api.com/line?fields=timezone) /etc/localtime
sudo apt-get install -y tzdata

# 2. INSTALL THE DEPENDENCIES
sudo apt-get install -y build-essential git cmake 

# CMAKE3
sudo apt-get install -y cmake3

# GUI
sudo apt-get install -y qttools5-dev qttools5-dev-tools libqt5svg5-dev qtmultimedia5-dev
sudo apt-get install -y qt6-base-dev qt6-multimedia-dev qt6-tools-dev qt6-tools-dev-tools qt6-l10n-tools libqt6core5compat6-dev

# PCAP
sudo apt-get install -y libpcap-dev

# Dev file (On Ubuntu 20.04)
sudo apt-get install -y libc-ares-dev

# CRYPT
sudo apt-get install -y libgcrypt20-dev

# GLIB2
sudo apt-get install -y libglib2.0-dev

# LEX & YACC
sudo apt-get install -y flex bison

# PCRE2 (On Ubuntu 18.04)
sudo apt-get install -y libpcre2-dev

# HTTP/2 protocol (Ubuntu >= 16.04)
sudo apt-get install -y libnghttp2-dev

# SpeexDSP
sudo apt-get install -y libspeexdsp-dev

# 3. CLONE THE WIRESHARK
git clone https://github.com/wireshark/wireshark


# 4. Copy files from source to destination
copy_and_print() {
    source_file="$1"
    destination_file="$2"
    cp -r "$source_file" "$destination_file"
    echo "$destination_file is rewritten successfully"
}

copy_and_print "./tshark.c" "./wireshark/tshark.c"
copy_and_print "./json_dumper.c" "./wireshark/wsutil/json_dumper.c"
copy_and_print "./wtap.h" "./wireshark/wiretap/wtap.h"
copy_and_print "./shared_data.h" "./wireshark/shared_data.h"
copy_and_print "./CMakeLists.txt" "./wireshark/CMakeLists.txt"

# 5. Build
cd ./wireshark
mkdir build
cd build
cmake ../
make -j`nproc` && {
  echo "\nBuild Success!"
  echo "You can find libtshark.so"
  echo "at \"`pwd`/run\""
  echo "Use the char* tb_main(int argc, char *argv[]) function to have the tshark functionalities"
  echo "Use void freememory(char* str) function to free the allocated memory"
}




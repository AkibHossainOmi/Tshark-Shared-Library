# Wireshark Build Instruction

* [For Windows](./BUILD.md)

* [For Ubuntu](https://gist.github.com/syneart/2d30c075c140624b1e150c8ea318a978)

# Tshark Shared Library for Windows

* Change the source code of wireshark by following command
```
copy /Y CMakeLists.txt wireshark\CMakeLists.txt
copy /Y tshark.c wireshark\tshark.c
copy /Y tshark.h wireshark\wsutil\tshark.h
copy /Y json_dumper.c wireshark\wsutil\json_dumper.c
copy /Y json_dumper.h wireshark\wsutil\json_dumper.h
```

* Clean and Build wireshark solution again
```
msbuild /m /p:Configuration=RelWithDebInfo Wireshark.sln /t:Clean
msbuild /m /p:Configuration=RelWithDebInfo Wireshark.sln
```
# Tshark Shared Library for Ubuntu

* Change the source code of wireshark by following command
```
cp -r CMakeLists.txt wireshark/CMakeLists.txt
cp -r tshark.c wireshark/tshark.c
cp -r tshark.h wireshark/wsutil/tshark.h
cp -r json_dumper.c wireshark/wsutil/json_dumper.c
cp -r json_dumper.h wireshark/wsutil/json_dumper.h
```

* Build wireshark solution again from Build directory
```
cmake ../
make -j`nproc` && {
  echo "\nBuild Success!"
  echo "You can find libtshark.so"
  echo "at \"`pwd`/run\""
  echo "Use the char* Tb_Main(int argc, char *argv[]) function to have the tshark functionalities"
  echo "Use void freememory(char* str) function to free the allocated memory"
}
```
# Wireshark: Modifications 

#### 1. Make changes in `json_dumper.c`

* Declare string, Lens and flag variable.
<br><br>
<img src="images\variable.PNG">

* Comment the line `fputc(c, dumper->output_file);` in `jd_putc(const json_dumper* dumper, char c)` and add lines to dynamically allocate the string single time and store the characters.
<br><br>
<img src="images\jd_putc.PNG">

* Comment the line`fputs(s, dumper->output_file);` in `jd_puts(const json_dumper* dumper, const char* s)` and add lines to store the characters.
<br><br>
<img src="images\jd_puts.PNG"> 

* Make a shared function `char* Tb_Return(int f)` to return the string. Here the parameter will be always `1` to return the string.
<br><br>
<img src="images\Tb_Return.PNG">

#### 2. Make changes in `json_dumper.h` 

* Define the shared function `char* Tb_Return(int f)` to be called in `tshark.c`
<br><br>
<img src="images\Tb_Return_Shared.PNG">

#### 3. Make changes in `tshark.c`

* Rename the function `int main(int argc, char* argv[])` as `char *Tb_Main(int argc, char* argv[])`
<br><br>
<img src="images\Tb_Main.PNG">

* Comment out the line `return exit_status;` in `char *Tb_Main(int argc, char* argv[])`
<br><br>
<img src="images\returnold.PNG">

* In the next line add `return Tb_Return(1);` to return the string.
<br><br>
<img src="images\return.PNG">

* Create a main function `int main(int argc, char* argv[])` again and call the `char *Tb_Main(int argc, char* argv[])` inside the main function and don't forget to release the memory.
<br><br>
<img src="images\main.PNG">

#### 4. Add a header file called `tshark.h` inside `wsutil` folder

* Declare the `char *Tb_Main(int argc, char* argv[])` function as shared function to be in the shared library.
<br><br>
<img src="images\tsharkh.PNG">

#### Note: I have added a function as shared function to free the allocated memory too and define it in `tshark.c`

<img src="images\freememory.PNG">

#### 5. Make changes in CMakeLists.txt

* Go to BUILD_tshark section and add the lines to create a shared library of tshark.
<br><br>
<img src="images\build_tshark.PNG">

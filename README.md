# Binding-C-API

### Table of Contents
1. [Installation](#installation)
2. [Running](#running)
3. [Project Motivation](#motivation)
4. [File Descriptions](#files)
5. [Results](#result)

## Installation <a name="installation"></a>
Each project uses CMake to generate a Makefile
```
  cd http_request/http_request_library
  cmake .
  make 
```
The ```make``` command creates a ```libhttprequest.dylib``` (macOS), ```libhttprequest.dll``` (Windows) or ```libhttprequest.so``` (Linux) library file.

http_request requires ```curl``` installed
```clang``` can also be used to create dynamic library using ```clang -dynamiclib httprequest.c -o libhttprequest.dylib``` 

## Running <a name="running ></a>

  Once the native library is built, run ```dart <filename>.dart```
  
## Project Motivation<a name="motivation"></a>
This project was done as a part of proof of concept for GSoC 2020 that has recently come up with Dart organisation.

## File Descriptions <a name="files"></a>
- [http_request](https://github.com/Dhanush1014/Binding-C-API/tree/master/http_request): make an HTTP request with libcurl
- [Brotli](https://github.com/Dhanush1014/Binding-C-API/tree/master/Brotli): compress unit8_t input array with brotli
- [Clang-dart](https://github.com/Dhanush1014/Binding-C-API/tree/master/Clang-dart): FFI to bind to clang
- [Math Function](https://github.com/Dhanush1014/Binding-C-API/tree/master/Math_Functions): FFI bindings to trignometric functions, power functions, gamma functions and hyperbolic functions
- [simpleUser](https://github.com/Dhanush1014/Binding-C-API/tree/master/simpleUser): Struct by value. Error has struct cannot be passed by value. So need to write an C wrapper to access the obejct

## Results<a name="results"></a>
The functions illustrated in C can now be called from dart using dart:ffi library


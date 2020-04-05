import 'dart:ffi';
import 'package:ffi/ffi.dart';

class HttpData extends Struct{
  Pointer<Utf8> data;
  @Int32()
  int size;

  factory HttpData.alllocate(Pointer<Utf8> data,int size)=>
    allocate<HttpData>().ref
      ..data=data
      ..size=size;
}

typedef http_request_func = Pointer<Utf8> Function(Pointer<Utf8> url);

typedef HTTP = Pointer<Utf8> Function(Pointer<Utf8> url);

main(){
  var path = './http_request_library/libhttp.dylib';
  final dylib = DynamicLibrary.open(path);
  final httpRequestPointer = dylib.lookup<NativeFunction<http_request_func>>('http_request');
  final httpRequest = httpRequestPointer.asFunction<HTTP>();
  final data=Utf8.fromUtf8(httpRequest(Utf8.toUtf8("https://en.wikipedia.org/wiki/The_Da_Vinci_Code_(film)")));
  print('${data}');
}
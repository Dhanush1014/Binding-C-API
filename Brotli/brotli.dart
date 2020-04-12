import 'dart:ffi';
import 'package:ffi/ffi.dart';

class Compressed extends Struct{
  Pointer<Uint8> output_data;
  @Int32()
  int length;
  factory Compressed.alllocate(Pointer<Uint8> output_data,int size)=>
    allocate<Compressed>().ref
      ..output_data=output_data
      ..length=size;
}
typedef brotli_enc_func = Pointer<Compressed> Function(Pointer<Uint8> input);

typedef BrotliEnc = Pointer<Compressed> Function(Pointer<Uint8> input);

Pointer<Uint8> input_data=allocate();

main(){
  var path = './brotli_library/brotli.dylib';
  final dylib = DynamicLibrary.open(path);
  final BrotliEncPointer = dylib.lookup<NativeFunction<brotli_enc_func>>('Encode');
  final brotliEnc = BrotliEncPointer.asFunction<BrotliEnc>();
  final input = [1,2,3,4,5,6,7,8,9,10,11,12,13,15];
  final inputPtr = intListToArray(input);
  final data=brotliEnc(inputPtr);
  final length = data.ref.length;
  final output = data.ref.output_data.asTypedList(length);
  output.forEach((elem)=>print("array: ${elem}"));
}

Pointer<Uint8> intListToArray(List<int> list) {
  final ptr = allocate<Uint8>(count: list.length);
  for (var i = 0; i < list.length; i++) {
    ptr.elementAt(i).value = list[i];
  }
  return ptr;
}
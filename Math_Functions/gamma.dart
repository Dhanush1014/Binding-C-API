import "dart:ffi" ;
import 'package:ffi/ffi.dart';

typedef lgamma_func = Double Function(Double);
typedef Lgamma= double Function(double);

typedef tgamma_func = Double Function(Double);
typedef Tgamma= double Function(double);



main(){
  var path='/usr/lib/libm.dylib';
  final dylib = DynamicLibrary.open(path);
  
  final Lgamma lgamma_c = dylib.lookup<NativeFunction<lgamma_func>>('lgamma').asFunction();
  final Tgamma tgamma_c = dylib.lookup<NativeFunction<tgamma_func>>('tgamma').asFunction();
}
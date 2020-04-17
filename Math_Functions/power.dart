import "dart:ffi" ;
import 'package:ffi/ffi.dart';

typedef power_func = Double Function(Double,Double);
typedef Power= double Function(double,double);

typedef sqrt_func = Double Function(Double);
typedef Sqrt= double Function(double);

typedef cbrt_func = Double Function(Double);
typedef Cbrt= double Function(double);

typedef hypot_func = Double Function(Double,Double);
typedef Hypot= double Function(double,double);


main(){
  var path='/usr/lib/libm.dylib';
  final dylib = DynamicLibrary.open(path);
  
  final Power pow_c = dylib.lookup<NativeFunction<power_func>>('pow').asFunction();
  final Sqrt sqrt_c = dylib.lookup<NativeFunction<sqrt_func>>('sqrt').asFunction();
  final Cbrt cbrt_c = dylib.lookup<NativeFunction<cbrt_func>>('cbrt').asFunction();
  final Hypot hypot_c = dylib.lookup<NativeFunction<hypot_func>>('hypot').asFunction();
}
import "dart:ffi" ;
import 'package:ffi/ffi.dart';

typedef acosh_func = Double Function(Double);
typedef ACosh= double Function(double);

typedef asinh_func = Double Function(Double);
typedef ASinh= double Function(double);

typedef atanh_func = Double Function(Double);
typedef ATanh= double Function(double);


typedef cosh_func = Double Function(Double);
typedef Cosh= double Function(double);

typedef sinh_func = Double Function(Double);
typedef Sinh= double Function(double);

typedef tanh_func = Double Function(Double);
typedef Tanh= double Function(double);


main(){
  var path='/usr/lib/libm.dylib';
  final dylib = DynamicLibrary.open(path);
  
  final ACosh acosh_c = dylib.lookup<NativeFunction<acosh_func>>('acosh').asFunction();
  final ASinh asinh_c = dylib.lookup<NativeFunction<asinh_func>>('asinh').asFunction();
  final ATanh atanh_c = dylib.lookup<NativeFunction<atanh_func>>('atanh').asFunction();
  final Cosh cosh_c = dylib.lookup<NativeFunction<cosh_func>>('cosh').asFunction();
  final Sinh sinh_c = dylib.lookup<NativeFunction<sinh_func>>('sinh').asFunction();
  final Tanh tanh_c = dylib.lookup<NativeFunction<tanh_func>>('tanh').asFunction();

}
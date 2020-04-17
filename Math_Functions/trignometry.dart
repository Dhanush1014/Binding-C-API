import "dart:ffi" ;
import 'package:ffi/ffi.dart';

typedef acos_func = Double Function(Double);
typedef ACos= double Function(double);

typedef asin_func = Double Function(Double);
typedef ASin= double Function(double);

typedef atan_func = Double Function(Double);
typedef ATan= double Function(double);

typedef atan2_func = Double Function(Double,Double);
typedef ATan2= double Function(double,double);

typedef cos_func = Double Function(Double);
typedef Cos= double Function(double);

typedef sin_func = Double Function(Double);
typedef Sin= double Function(double);

typedef tan_func = Double Function(Double);
typedef Tan= double Function(double);


main(){
  var path='/usr/lib/libm.dylib';
  final dylib = DynamicLibrary.open(path);
  
  final ACos acos_c = dylib.lookup<NativeFunction<acos_func>>('acos').asFunction();
  final ASin asin_c = dylib.lookup<NativeFunction<asin_func>>('asin').asFunction();
  final ATan atan_c = dylib.lookup<NativeFunction<atan_func>>('atan').asFunction();
  final ATan2 atan2_c = dylib.lookup<NativeFunction<atan2_func>>('atan2').asFunction();
  final Cos cos_c = dylib.lookup<NativeFunction<cos_func>>('cos').asFunction();
  final Sin sin_c = dylib.lookup<NativeFunction<sin_func>>('sin').asFunction();
  final Tan tan_c = dylib.lookup<NativeFunction<tan_func>>('tan').asFunction();

}
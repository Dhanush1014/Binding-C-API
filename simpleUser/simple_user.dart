import "dart:ffi";
import 'package:ffi/ffi.dart';

class User extends Struct{
  Pointer<Utf8> name;
}

typedef create_user_func = Pointer<User> Function(Pointer<Utf8>);
typedef CreateUser = Pointer<User> Function(Pointer<Utf8>);

typedef print_user_func = Void Function(Pointer<User>); 
typedef PrintUser = void Function(Pointer<User>); 

main(){
  var path='/Users/dhanush/Desktop/simpleUser/lib/libsimpleuser.dylib';
  final dylib = DynamicLibrary.open(path);

  final createUserPointer = dylib.lookup<NativeFunction<create_user_func>>('createUser');
  final createUser = createUserPointer.asFunction<CreateUser>();

  final PrintUser printUser = dylib.lookup<NativeFunction<print_user_func>>('printUser').asFunction();

  final  jarvis = createUser(Utf8.toUtf8("Just A Very Rather Intelligent Machine"));
  printUser(jarvis);
}
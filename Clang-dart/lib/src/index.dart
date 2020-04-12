import "dart:ffi";
import 'package:ffi/ffi.dart';

typedef clang_create_index_func = Pointer<Void> Function(Int32, Int32);

typedef ClangCreateIndex = Pointer<void> Function(int, int);

typedef index_dispose_func = Void Function(Pointer<Void>);

typedef IndexDispose = void Function(Pointer<Void>);

class Index{
  final Pointer<Void> CXIndex;
  static final path = '/usr/local/Cellar/llvm/10.0.0/lib/libclang.dylib';
  static final dylib = DynamicLibrary.open(path);
  static final ClangCreateIndex _createIndex = dylib
      .lookup<NativeFunction<clang_create_index_func>>('clang_createIndex').asFunction();

  Index(int excludeDeclarationsFromPCH, int displayDiagnostics)
      : CXIndex = _createIndex(excludeDeclarationsFromPCH, displayDiagnostics);
  
  static final IndexDispose _disposeIndex= dylib.lookup<NativeFunction<index_dispose_func>>("clang_disposeIndex").asFunction();

  void dispose()=>_disposeIndex(CXIndex);
}
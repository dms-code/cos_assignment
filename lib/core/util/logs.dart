
import 'package:flutter/foundation.dart';
import 'package:logger/web.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logs.g.dart';

/// The `Log` is a state class that provides access to the logging state.
///
/// It provides the following functionality:
///
/// - **Debug**: Logs a debug message using the [d] method.
/// - **Error**: Logs an error message using the [e] method.
/// 
@riverpod
class Log extends _$Log{

  final logger = Logger();

  Log();

  factory Log.init() => Log();

  @override
  Log build() {
    return Log.init();
  }

  d(String message, StackTrace? trace){
    if(!kReleaseMode) {
      logger.d(message, stackTrace: trace);
    }
  }

  e(String message, StackTrace? trace){
    if(!kReleaseMode) {
      logger.e(message, stackTrace: trace);
    }
  }

}
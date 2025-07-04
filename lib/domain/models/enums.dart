enum UserError{
  notFound,
  notImplemented,
  insertError
}

extension UserErrorExtension on UserError {
  String get message {
    switch (this) {
      case UserError.notFound:
        return 'User not found';
      case UserError.insertError:
        return 'Error to insert the user';
      case UserError.notImplemented:
        return 'Not implemented';
    }
  }
}

enum VehicleErrorType {
  notFound,
  notImplemented,
  insertError,
  timeout,
  delay,
  insertDb
}

class VehicleError {
  String? message;
  VehicleErrorType type;
  int? delay;

  VehicleError(this.type, {this.message, this.delay});

  factory VehicleError.notImplemented(){
    return VehicleError(VehicleErrorType.notImplemented);
  }

  factory VehicleError.timeout(){
    return VehicleError(VehicleErrorType.timeout);
  }

  factory VehicleError.delay(String message, int delay){
    return VehicleError(VehicleErrorType.delay, delay: delay);
  }

  factory VehicleError.notFound(){
    return VehicleError(VehicleErrorType.notFound);
  }

  factory VehicleError.insertDb(){
    return VehicleError(VehicleErrorType.insertDb);
  }

  String getUserCTA() {
    switch (type) {
      case VehicleErrorType.timeout:
        return 'Please check your internet connection and try again.';
      case VehicleErrorType.delay:
        return 'Please wait $delay seconds and try again.';
      default:
        return 'Something went wrong';  
    }
  }

}
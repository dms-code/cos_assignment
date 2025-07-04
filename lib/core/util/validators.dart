import 'package:cos_assignment/data/apis/cos_api/snippet.dart';
import 'package:dartz/dartz.dart';

/// The `Validators` is a class that provides access to the validation methods.
///
/// It provides the following functionality:
///
/// - **Validate Email**: Validates an email address using the [validateEmail] method.
/// - **Validate VIN**: Validates a VIN (Vehicle Identification Number) using the [validateVIN] method.
/// 
enum EmailError {
  empty,
  invalid,
  tooLong,
}

enum VINError {
  empty,
  invalidLength,
  invalidCharacters,
  invalidCheckDigit,
}

class Validators {
  /// Validates email address
  /// Returns Right(true) if valid, Left(EmailError) if invalid
  static Either<bool, EmailError> validateEmail(String email) {
    // Check if email is empty
    if (email.trim().isEmpty) {
      return const Right(EmailError.empty);
    }

    // Check if email is too long (RFC 5321 limit)
    if (email.length > 254) {
      return const Right(EmailError.tooLong);
    }

    // Basic email regex pattern
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    );

    if (!emailRegex.hasMatch(email)) {
      return const Right(EmailError.invalid);
    }

    return const Left(true);
  }

  /// Validates VIN (Vehicle Identification Number)
  /// Returns Right(true) if valid, Left(VINError) if invalid
  static Either<bool, VINError> validateVIN(String vin) {
    // Check if VIN is empty
    if (vin.trim().isEmpty) {
      return const Right(VINError.empty);
    }


    // Remove whitespace and convert to uppercase
    final cleanVin = vin.replaceAll(' ', '').toUpperCase();

    // Check length (VIN must be exactly 17 characters)
    if (cleanVin.length != CosChallenge.vinLength) {
      return const Right(VINError.invalidLength);
    }

    // Check for invalid characters (VIN cannot contain I, O, or Q)
    final validChars = RegExp(r'^[ABCDEFGHJKLMNPRSTUVWXYZ0123456789]+$');
    if (!validChars.hasMatch(cleanVin)) {
      return const Right(VINError.invalidCharacters);
    }

    // Validate check digit (9th position)
    if (!_isValidVINCheckDigit(cleanVin)) {
      return const Right(VINError.invalidCheckDigit);
    }

    return const Left(true);
  }

  /// Internal method to validate VIN check digit
  static bool _isValidVINCheckDigit(String vin) {
    const weights = [8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2];
    const values = {
      'A': 1, 'B': 2, 'C': 3, 'D': 4, 'E': 5, 'F': 6, 'G': 7, 'H': 8,
      'J': 1, 'K': 2, 'L': 3, 'M': 4, 'N': 5, 'P': 7, 'R': 9,
      'S': 2, 'T': 3, 'U': 4, 'V': 5, 'W': 6, 'X': 7, 'Y': 8, 'Z': 9,
      '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9
    };

    int sum = 0;
    for (int i = 0; i < 17; i++) {
      if (i == 8) continue; // Skip check digit position
      final char = vin[i];
      final value = values[char] ?? 0;
      sum += value * weights[i];
    }

    final remainder = sum % 11;
    final checkDigit = remainder == 10 ? 'X' : remainder.toString();
    
    return vin[8] == checkDigit;
  }
}

// Extension methods for easier error handling
extension EmailErrorExtension on EmailError {
  String get message {
    switch (this) {
      case EmailError.empty:
        return 'Email cannot be empty';
      case EmailError.invalid:
        return 'Invalid email format';
      case EmailError.tooLong:
        return 'Email is too long';
    }
  }
}

extension VINErrorExtension on VINError {
  String get message {
    switch (this) {
      case VINError.empty:
        return 'VIN cannot be empty';
      case VINError.invalidLength:
        return 'VIN must be exactly 17 characters';
      case VINError.invalidCharacters:
        return 'VIN contains invalid characters';
      case VINError.invalidCheckDigit:
        return 'VIN has invalid check digit';
    }
  }
}
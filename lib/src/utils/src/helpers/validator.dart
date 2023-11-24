import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:incident_reporting/src/utils/src/helpers/validation_constants.dart';

import '../../utils.dart';

@immutable
class FormValidator {
  const FormValidator._();

  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return ValidationConstants.emptyEmailInputError;
    } else if (!email.isValidEmail) {
      return ValidationConstants.invalidEmailError;
    }
    return null;
  }

  static String? licenseValidator(String? license) {
    if (license == null || license.isEmpty) {
      return "Please Enter License Number";
    }
    //  else if (!license.isValidLicense) {
    //   return ValidationConstants.invalidLicense;
    // }
    return null;
  }

  static String? mobileNumberValidator(String? mobileNumber, int length) {
    if (mobileNumber!.isEmpty) {
      return ValidationConstants.emptyMobileNumberError;
    } else if (!mobileNumber.isValidContact) {
      return ValidationConstants.invalidContactError;
    } else if (mobileNumber.length != length) {
      return ValidationConstants.invalidContactError;
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return ValidationConstants.emptyPasswordInputError;
    }
    return null;
  }

  static String? commentsValidator(String? value) {
    if (value!.isEmpty) return ValidationConstants.emptyComments;
    return null;
  }

  static String? emptyValidator(String? value) {
    if (value!.isEmpty) return ValidationConstants.emptyInputError;
    return null;
  }

  static String? vinValidator(String value) {
    if (value.isEmpty) {
      return ValidationConstants.vinComments;
    } else if (!value.isValidVinNumber) {
      return 'Please Enter a Valid VIN Number';
    }
    return null;
  }

  static String? changePasswordValidator(String? password) {
    if (password!.isEmpty) {
      return ValidationConstants.emptyPasswordInputError;
    } else if (!password.isValidPassword) {
      String missingRequirements = '';
      // return ValidationConstants.invalidchangePasswordError;

      if (!RegExp(r'[A-Z]').hasMatch(password)) {
        missingRequirements += 'uppercase letter, ';
      }
      if (!RegExp(r'[a-z]').hasMatch(password)) {
        missingRequirements += 'lowercase letter, ';
      }
      if (!RegExp(r'[@#$%^&+=!]').hasMatch(password)) {
        missingRequirements += 'special character, ';
      }
      if (password.length < 8) {
        missingRequirements += 'minimum of 8 characters, ';
      }
      missingRequirements =
          missingRequirements.substring(0, missingRequirements.length - 2);
      return 'Password is missing the following requirements: $missingRequirements';
    }
    return null;
  }

  static String? confirmPasswordValidator(String? confirmPw, String inputPw) {
    if (inputPw.isEmpty) {
      return ValidationConstants.emptyPasswordInputError;
    } else if (confirmPw == inputPw.trim()) {
      return null;
    }
    return ValidationConstants.invalidConfirmPwError;
  }

  static String? oldPasswordValidator(String? confirmPw, String inputPw) {
    if (inputPw.isEmpty) {
      return ValidationConstants.emptyPasswordInputError;
    } else if (confirmPw == inputPw.trim()) {
      return ValidationConstants.oldPPwError;
    }
    return null;
  }

  static String? currentPasswordValidator(String? inputPw, String currentPw) {
    if (inputPw == currentPw) return null;
    return ValidationConstants.invalidCurrentPwError;
  }

  static String? newPasswordValidator(String? newPw, String currentPw) {
    if (newPw!.isEmpty) {
      return ValidationConstants.emptyPasswordInputError;
    } else if (newPw == currentPw) {
      return ValidationConstants.invalidNewPwError;
    }
    return null;
  }

  static String? fullNameValidator(String? fullName) {
    if (fullName != null && fullName.isValidFullName) return null;
    return ValidationConstants.invalidFullNameError;
  }

  static String? addressValidator(String? address) {
    if (address!.isEmpty) return ValidationConstants.emptyAddressInputError;
    return null;
  }

  static String? contactValidator(String? contact) {
    return contact != null && contact.isValidContact
        ? null
        : contact!.isEmpty
            ? ValidationConstants.emptyContactError
            : ValidationConstants.invalidContactError;
  }
}

extension StringExt on String {
  bool get isValidEmail => ValidationConstants.emailRegex.hasMatch(this);

  bool get isValidFullName => ValidationConstants.fullNameRegex.hasMatch(this);

  bool get isValidContact => ValidationConstants.contactRegex.hasMatch(this);

  bool get isValidPassword => ValidationConstants.passwordRegex.hasMatch(this);

  bool get isValidVinNumber => ValidationConstants.vinNumber.hasMatch(this);

  bool get isValidLicense =>
      ValidationConstants.licenseDriverRegex.hasMatch(this);
}

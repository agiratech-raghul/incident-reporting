class ValidationConstants {
  static String percentageSymbol = "%";
  static String success = "success";
  static RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\.]+\.(com|pk)+",
  );

  static RegExp contactRegex = RegExp(r'^[0-9]+$');
  static RegExp licenseDriverRegex = RegExp(r'/^[A-Za-z0-9]{5,11}$/');

  static RegExp passwordRegex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
  );

  static RegExp vinNumber = RegExp(r'^[A-HJ-NPR-Z0-9]{17}$');

  static const emptyContactError = 'Please enter a Mobile Number';

  static const invalidContactError = 'Please enter a valid Mobile Number';

  static RegExp fullNameRegex = RegExp(r'^^[A-Za-z\s]+$');

  static const invalidEmailError = 'Please enter a valid Email Address';

  static const invalidPasswordError = 'Please enter a valid Password';

  static const invalidchangePasswordError =
      'Password should be minimum 8 characters must include uppercase, numbers and special characters';

  static const emptyEmailInputError = 'Please enter an Email ID';

  static const emptyMobileNumberError = 'Please enter a Mobile Number';

  static const emptyPasswordInputError = 'Please enter a Password';

  static const containsCapitalLetterPasswordInputError =
      'Please enter atleast one capital Letter';
  // static const containsSmallLetterPasswordInputError =
  //     'Please enter a password';
  static const containsSpecialLetterPasswordInputError =
      'Please enter Special Password';
  static const containsAbove8LetterPasswordInputError =
      'Please enter above 8 letters';
  static const emptyInputError = 'Please enter a value';
  static const invalidConfirmPwError =
      "New Password & Confirm Password didn't match";
  static const oldPPwError = "Old Password & new Password should not be same";
  static const invalidCurrentPwError = 'Invalid current Password!';
  static const invalidNewPwError = "Current and new Password can't be same";

  static const invalidFullNameError = 'Please enter a valid Full Name';
  static const invalidLicense = 'Please enter a valid License Number';
static const emptyComments = 'Please enter a comment to Edit a Ticket';
  static const vinComments = 'Please enter a Valid VIN Number';
  static const emptyAddressInputError = 'Please enter a address';

  static const emptyBranchInputError = 'Please enter the branch name';
}

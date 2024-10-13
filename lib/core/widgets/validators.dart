class AppValidators {
  AppValidators._();

  // Email
  static String? validateEmail(String? value) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'Please enter email';
    } else if (emailRegex.hasMatch(value) == false) {
      return 'Please enter valid email';
    } else {
      return null;
    }
  }

  // Password
  static String? validatePassword(String? value) {
    RegExp passwordRegex = RegExp(r"^(?=.*[a-zA-Z])(?=.*[0-9])");
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    } else if (value.length < 8 || !passwordRegex.hasMatch(value)) {
      return 'strong password';
    } else {
      return null;
    }
  }

  // Confirm Password
  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please enter confirm password';
    } else if (value != password) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  // User Name
  static String? validateUserName(String? value) {
    RegExp userNameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'Please enter user name';
    } else if (userNameRegex.hasMatch(value) == false) {
      return 'Please enter valid user name';
    } else {
      return null;
    }
  }

  // Full Name
  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'Please enter full name';
    } else {
      return null;
    }
  }

  // Phone Number
  static String? validatePhoneNumber(String? value) {
    RegExp phoneRegex = RegExp(r'^[0-9]+$');
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'Please enter phone number';
    } else if (phoneRegex.hasMatch(value) == false) {
      return 'Please enter valid phone number';
    } else {
      return null;
    }
  }

// // Address
// static String? validateAddress(String? value) {
//   if (value == null || value.isEmpty ||value.trim().isEmpty) {
//     return 'Please enter address';
//   } else {
//     return null;
//   }
// }

// // PinCode
// static String? validatePincode(String? value) {
//   RegExp pincodeRegex = RegExp(r'^[0-9]+$');
//   if (value == null || value.isEmpty ||value.trim().isEmpty) {
//     return 'Please enter pincode';
//   } else if (pincodeRegex.hasMatch(value) == false) {
//     return 'Please enter valid pincode';
//   } else {
//     return null;
//   }
// }

// // City
// static String? validateCity(String? value) {
//   if (value == null || value.isEmpty ||value.trim().isEmpty) {
//     return 'Please enter city';
//   } else {
//     return null;
//   }
// }
}

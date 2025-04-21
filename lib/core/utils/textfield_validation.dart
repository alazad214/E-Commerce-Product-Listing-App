class InputValidator {
//Email Validate-->

  static String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  // Password Validate-->
  static String? passwordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    return null;
  }

  // User Name Validate-->
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    if (value.length < 2) {
      return 'Username must be at least 3 characters long';
    }
    return null;
  }

//Phone Number Validate-->

  static String? validatenumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    }
    final hasOnlyDigits = RegExp(r'^\d+$').hasMatch(value);
    if (!hasOnlyDigits) {
      return 'Phone number must contain only digits';
    }
    return null;
  }

//Address Validate-->
  static String? validateaddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }
    return null;
  }

//Custom Validate Field-->
  static String? customValidateFiled(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }
}

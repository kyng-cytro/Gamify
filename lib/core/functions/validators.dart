class SignupVal {
  final String name;
  final String email;
  final String password;
  final String confirm;

  SignupVal(
      {required this.name,
      required this.email,
      required this.password,
      required this.confirm});

  validate() {
    if (name != "" && email != "" && password != "" && confirm != "") {
      if (password == confirm) {
        return true;
      } else {
        return "Password fields don't match";
      }
    } else {
      return "Please fill in all required fields";
    }
  }
}

class LoginVal {
  final String email;
  final String pass;

  LoginVal({required this.email, required this.pass});

  validate() {
    if (email != "" && pass != "") {
      return true;
    } else {
      return "Please enter vaild credentials";
    }
  }
}

class EmailPasswordValidator {
  String? emailValidator(String value) {
    if (value.isEmpty) return 'Enter email';

    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regExp.hasMatch(value)) {
      return 'Email is invalid';
    }
    return null;
  }

  String? passwordValidator(String value){
    if(value.isEmpty)return 'Enter password';

    if(value.length<7)return 'Password should be more than 6 character';

    return null;
  }
}

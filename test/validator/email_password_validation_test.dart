import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_demo/validator/email_password_validator.dart';

void main() {
  group('validator', () {
    test('Empty email field', () {
      EmailPasswordValidator validator = EmailPasswordValidator();
      String? result = validator.emailValidator('');
      expect( result,'Enter email');
    });

    test('Invalid email address', () {
      EmailPasswordValidator validator = EmailPasswordValidator();
      String? result = validator.emailValidator('djfjd@');
      expect( result,'Email is invalid');
    });

    test('Valid email address', () {
      EmailPasswordValidator validator = EmailPasswordValidator();
      String? result = validator.emailValidator('samjithbs@gmail.com');
      expect( result,null);
    });

    test('Empty password field', () {
      EmailPasswordValidator validator = EmailPasswordValidator();
      String? result = validator.passwordValidator('');
      expect( result,'Enter password');
    });

    test('Invalid email address', () {
      EmailPasswordValidator validator = EmailPasswordValidator();
      String? result = validator.passwordValidator('djd@');
      expect( result,'Password should be more than 6 character');
    });

    test('Valid email address', () {
      EmailPasswordValidator validator = EmailPasswordValidator();
      String? result = validator.passwordValidator('samjithbs');
      expect( result,null);
    });

  });
}

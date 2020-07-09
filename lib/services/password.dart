class Password {
  final String title;
  final String encryptedPassword;

  Password(this.title, this.encryptedPassword);
}

class PasswordService {
  List<Password> passwords;

  PasswordService() {
    passwords = [];
  }

  encryptAndAdd(String title, String password) {
    passwords.add(Password(title, password));
  }

  String decrypt(String cipher, String key) {
    return cipher;
  }

}

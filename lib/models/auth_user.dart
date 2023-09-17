class AuthUser {
  final String email;
  final String token;

  AuthUser({required this.email, required this.token});

  factory AuthUser.fromMap(Map<String, dynamic> data) {
    return AuthUser(
      email: data['email'],
      token: data['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'token': token,
    };
  }
}

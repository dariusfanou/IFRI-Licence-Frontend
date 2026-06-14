class User {
  User({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    this.role
  });

  // JSON -> Dart
  factory User.fromJson(Map<String, Object?> json) {
    return User(
      firstname: json['firstname']! as String,
      lastname: json['lastname']! as String,
      email: json['email']! as String,
      phone: json['phone']! as String,
      role: json['role']! as String,
    );
  }

  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String? role;
}

class RegisterUser {
  RegisterUser({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.password,
  });

  // Dart -> JSON
  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String password;
}
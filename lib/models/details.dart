class Details {
  final String name;
  final int age;
  final String email;
  final String password;

  Details(
      {required this.name,
      required this.age,
      required this.email,
      required this.password});

  Map<String, dynamic> toMap() {
    return {"name": name, "age": age, "email": email, "password": password};
  }

  factory Details.fromMap(Map<String, dynamic> map) {
    return Details(
        name: map['name'],
        age: map['age'],
        email: map['email'],
        password: map['password']);
  }
}
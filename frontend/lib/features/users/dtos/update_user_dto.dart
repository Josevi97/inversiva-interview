class UpdateUserDto {
  final String? name;
  final String? email;
  final int? role;

  UpdateUserDto({this.name, this.email, this.role});

  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (role != null) 'role': role,
    };
  }
}

// Attribute for the Api register (json)
class RegisterResponseEntity {
  RegisterResponseEntity({
    this.message,
    this.user,
    this.statusMsg,
    this.token,
  });

  String? message;
  UserEntity? user;
  String? token;
  String? statusMsg;
}

class UserEntity {
  UserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}

// continue -->   class ,  attributes and constructor only

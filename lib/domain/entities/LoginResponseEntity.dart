// Attribute for the Api register (json)
class LoginResponseEntity {
  LoginResponseEntity({
    this.message,
    this.statusMsg,
    this.user,
    this.token,
  });

  String? message;
  LoginUserEntity? user;
  String? statusMsg;
  String? token;
}

class LoginUserEntity {
  LoginUserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}

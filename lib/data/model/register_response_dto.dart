import 'package:shoppe/domain/entities/RegisterResonseEntitie.dart';

/// message : "success"
/// user : {"name":"Mousa","email":"mousa2003@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MGFiMmY3YzkzMzA0OWM1ZDFmYTRkMSIsIm5hbWUiOiJNb3VzYSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI4NzU0NDIzLCJleHAiOjE3MzY1MzA0MjN9.XBSpfH12fYUYENB98YwNKGyyLOeDgzIK0biDM0EmU3A"

class RegisterResponseDto extends RegisterResponseEntity {
  RegisterResponseDto({
    super.message,
    super.user,
    super.statusMsg,
    super.token,
  });

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class UserDto extends UserEntity {
  UserDto({
    super.name,
    super.email,
  });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
  }
}

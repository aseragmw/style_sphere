

import 'package:style_sphere/core/constants/api_conatsants.dart';
import 'package:style_sphere/features/auth/domain/entities/user_entitiy.dart';

class UserModel extends UserEntity {
  const UserModel({required super.userID, required super.userEmail, required super.username});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(userID: jsonData[USERID], userEmail: jsonData[USEREMAIL], username: jsonData[USERNAME]);
  }

  Map<String, dynamic> toJson() {
    return {
      USERID:userID,
      USEREMAIL:userEmail,
      USERNAME:username
    };
  }
  
}



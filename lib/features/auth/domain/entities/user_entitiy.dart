// here goes the implmentation of the user class as needed for the api
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userID;
  final String userEmail;
  final String username;

  const UserEntity({required this.userID, required this.userEmail, required this.username});
  
  @override
  List<Object?> get props => [userID,userEmail,username];

}

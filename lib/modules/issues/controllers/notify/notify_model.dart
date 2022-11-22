import 'package:build_planner/controllers/user/user_model.dart';

class NotifyModel {
  String notifyId;
  String issueId;
  String role;
  UserModel user;

  NotifyModel({
    required this.notifyId,
    required this.issueId,
    required this.role,
    required this.user,
  });

  factory NotifyModel.fromJSON(Map<String, dynamic> parsedJson) {
    return NotifyModel(
      notifyId: parsedJson['notifyId'],
      issueId: parsedJson['issueId'],
      role: parsedJson['role'],
      user: UserModel(
        userId: parsedJson['userId'],
        name: parsedJson['userName'],
        password: '',
        email: parsedJson['email'],
        designation: '',
        phone: '',
      ),
    );
  }
}

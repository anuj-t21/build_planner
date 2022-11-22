import 'package:build_planner/controllers/user/user_model.dart';

class LogsModel {
  String logId;
  String issueId;
  UserModel user;
  bool isMessage;
  bool byCurrentUser;
  String text;
  DateTime date;

  LogsModel({
    required this.logId,
    required this.issueId,
    required this.user,
    required this.isMessage,
    required this.byCurrentUser,
    required this.text,
    required this.date,
  });

  factory LogsModel.fromJSON(Map<String, dynamic> parsedJson) {
    return LogsModel(
      logId: parsedJson['logsId'],
      issueId: parsedJson['issueId'],
      isMessage: parsedJson['isMessage'],
      date: DateTime.now(),
      byCurrentUser: parsedJson['byCurrentUser'],
      text: parsedJson['text'],
      user: UserModel(
        userId: parsedJson['userId'],
        name: parsedJson['userName'],
        password: '',
        email: '',
        designation: '',
        phone: '',
      ),
    );
  }
}

import 'package:build_planner/controllers/user/user_model.dart';

enum IssueType {
  ER,
  IER,
}

class IssueModel {
  String buildId;
  String issueID;
  IssueType issueType;
  String description;
  DateTime baTimeline;
  DateTime devTimeline;
  DateTime qaTimeline;
  UserModel ba;
  String status;

  IssueModel({
    required this.buildId,
    required this.issueType,
    required this.issueID,
    required this.description,
    required this.ba,
    required this.status,
    required this.baTimeline,
    required this.devTimeline,
    required this.qaTimeline,
  });

  factory IssueModel.fromJSON(Map<String, dynamic> parsedJson) {
    return IssueModel(
      buildId: parsedJson['buildId'],
      issueID: parsedJson['issueId'],
      issueType: parsedJson['issueType'] == 'ER' ? IssueType.ER : IssueType.IER,
      baTimeline: DateTime.now(),
      devTimeline: DateTime.now(),
      qaTimeline: DateTime.now(),
      description: parsedJson['description'],
      status: parsedJson['status'],
      ba: UserModel(
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

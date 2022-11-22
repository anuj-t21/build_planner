import 'package:build_planner/controllers/user/user_model.dart';

class EstimateModel {
  String estimateId;
  String issueId;
  String platform;
  String product;
  String duration;
  DateTime date;
  String status;
  UserModel user;

  EstimateModel({
    required this.estimateId,
    required this.issueId,
    required this.platform,
    required this.product,
    required this.date,
    required this.status,
    required this.duration,
    required this.user,
  });

  factory EstimateModel.fromJSON(Map<String, dynamic> parsedJson) {
    return EstimateModel(
      estimateId: parsedJson['estimateId'],
      issueId: parsedJson['issueId'],
      platform: parsedJson['platform'],
      date: DateTime.now(),
      duration: parsedJson['duration'],
      status: parsedJson['status'],
      product: parsedJson['product'],
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

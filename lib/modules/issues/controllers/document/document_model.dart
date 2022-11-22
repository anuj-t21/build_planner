import 'package:build_planner/controllers/user/user_model.dart';

class DocumentModel {
  String docId;
  String issueId;
  String name;
  UserModel addedBy;
  DateTime dateTime;
//  File attachment;

  DocumentModel({
    required this.docId,
    required this.issueId,
    required this.name,
    required this.addedBy,
    required this.dateTime,
//    required this.attachment,
  });

  factory DocumentModel.fromJSON(Map<String, dynamic> parsedJson) {
    return DocumentModel(
      docId: parsedJson['docId'],
      issueId: parsedJson['issueId'],
      name: parsedJson['docName'],
      dateTime: DateTime.now(),
      addedBy: UserModel(
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

class BuildModel {
  String buildId;
  String buildName;
  DateTime deadline;
  String releaseNote;

  BuildModel({
    required this.buildId,
    required this.buildName,
    required this.deadline,
    required this.releaseNote,
  });

  factory BuildModel.fromJSON(Map<String, dynamic> parsedJson) {
    return BuildModel(
      buildId: parsedJson['buildId'],
      buildName: parsedJson['buildName'],
      deadline: DateTime.now(),
      releaseNote: parsedJson['releaseNote'],
    );
  }
}

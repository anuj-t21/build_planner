import 'package:build_planner/modules/logs/controller/logs_model.dart';
import 'package:build_planner/services/remote_services.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:get/get.dart';

class LogsController extends GetxController {
  onInit() {
    fetchLogs();
    super.onInit();
  }

  List<LogsModel> _logs = <LogsModel>[].obs;

  List get logs => [..._logs];

  List logsByIssueId(String issueId) =>
      [..._logs.where((element) => element.issueId == issueId)];

  fetchLogs() async {
    var getBuildData = await RemoteService().fetchData(StringConstants.urlLogs);
    getBuildData.forEach((key, value) {
      _logs.add(LogsModel.fromJSON(value));
    });
    update();
//    _logs.sort((A, B) => B.date.compareTo(A.date));
  }

  addLog(LogsModel logsModel) {
    _logs.insert(0, logsModel);
  }
}

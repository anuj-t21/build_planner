import 'package:build_planner/modules/issues/controllers/issue/issue_model.dart';
import 'package:build_planner/services/remote_services.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:get/get.dart';

class IssueController extends GetxController {
  onInit() {
    fetchIssue();
    super.onInit();
  }

  List<IssueModel> _issues = <IssueModel>[].obs;

  fetchIssue() async {
    var getBuildData =
        await RemoteService().fetchData(StringConstants.urlIssue);
    getBuildData.forEach((key, value) {
      _issues.add(IssueModel.fromJSON(value));
    });
    update();
  }

  List get issue => [..._issues];

  List issueByBuild(String buildId) =>
      [..._issues.where((element) => element.buildId == buildId)];
}

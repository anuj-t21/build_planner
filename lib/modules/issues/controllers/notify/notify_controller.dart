import 'package:build_planner/modules/issues/controllers/notify/notify_model.dart';
import 'package:build_planner/services/remote_services.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:get/get.dart';

class NotifyController extends GetxController {
  onInit() {
    fetchNotifier();
    super.onInit();
  }

  List<NotifyModel> _notifyUserList = <NotifyModel>[].obs;

  addNotifyUser(NotifyModel notifyModel) {
    _notifyUserList.add(notifyModel);
  }

  removeNotifyUser(NotifyModel notifyModel) {
    _notifyUserList.remove(notifyModel);
  }

  fetchNotifier() async {
    var getBuildData =
        await RemoteService().fetchData(StringConstants.urlNotifier);
    getBuildData.forEach((key, value) {
      _notifyUserList.add(NotifyModel.fromJSON(value));
    });
    update();
  }

  List get notifyUsers => [..._notifyUserList];
  List notifyUserByIssueId(String issueId) =>
      [..._notifyUserList.where((element) => element.issueId == issueId)];
}

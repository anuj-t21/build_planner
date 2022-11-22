import 'package:build_planner/modules/issues/controllers/estimate/estimate_model.dart';
import 'package:build_planner/services/remote_services.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:get/get.dart';

class EstimateController extends GetxController {
  onInit() {
    fetchEstimate();
    super.onInit();
  }

  List<EstimateModel> _estimates = <EstimateModel>[].obs;

  List get estimates => [..._estimates];

  fetchEstimate() async {
    var getBuildData =
        await RemoteService().fetchData(StringConstants.urlEstimate);
    getBuildData.forEach((key, value) {
      _estimates.add(EstimateModel.fromJSON(value));
    });
    update();
  }

  List estimatesByIssueId(String issueId) =>
      [..._estimates.where((element) => element.issueId == issueId)];

  addEstimate(EstimateModel estimateModel) {
    _estimates.add(estimateModel);
  }
}

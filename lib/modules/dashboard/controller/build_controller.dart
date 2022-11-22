import 'package:build_planner/modules/dashboard/controller/build_model.dart';
import 'package:build_planner/services/remote_services.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:get/get.dart';

class BuildController extends GetxController {
  var isFetching = false.obs;
  onInit() async {
    isFetching = true.obs;
    fetchBuild().then((_) => isFetching = false.obs);
    update();
    super.onInit();
  }

  List<BuildModel> _buildModel = <BuildModel>[].obs;

  List<BuildModel> _buildModelBySearch = <BuildModel>[].obs;

  fetchBuild() async {
    var getBuildData = await RemoteService()
        .fetchData(StringConstants.urlBuild); //responseData['data'];
    getBuildData.forEach((key, value) {
      _buildModel.add(BuildModel.fromJSON(value));
    });
    update();
  }

  buildListBySearch(String? searchKey) {
    _buildModelBySearch = [
      ..._buildModel
          .where((element) => element.buildName.contains(searchKey.toString()))
    ];
    print(_buildModelBySearch.length);
    update();
  }

  List get buildModel => [..._buildModel];

  List get buildBySearch => [..._buildModelBySearch];
}

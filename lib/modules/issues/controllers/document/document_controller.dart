import 'package:build_planner/modules/issues/controllers/document/document_model.dart';
import 'package:build_planner/services/remote_services.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:get/get.dart';

class DocumentController extends GetxController {
  onInit() {
    fetchDoc();
    super.onInit();
  }

  List<DocumentModel> _documents = <DocumentModel>[].obs;

  List get documents => [..._documents];

  fetchDoc() async {
    var getBuildData =
        await RemoteService().fetchData(StringConstants.urlDocument);
    getBuildData.forEach((key, value) {
      _documents.add(DocumentModel.fromJSON(value));
    });
    update();
  }

  List documentByIssueId(String issueId) =>
      [..._documents.where((element) => element.issueId == issueId)];

  addDocument(DocumentModel documentModel) {
    print('reacchhhhh');
    _documents.add(documentModel);
  }
}

//    var res = await RemoteService().getDocument();
//    print(res.body);
//    var responseData = json.decode(res.body) as Map<String, dynamic>;
//    var getBuildData = responseData['data'];
//    print('check1');
//    getBuildData.forEach((key, value) {
//      print('check2');
//      _documents.add(DocumentModel.fromJSON(value));
//    });
//    update();

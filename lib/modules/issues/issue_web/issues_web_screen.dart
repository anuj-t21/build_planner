//import 'dart:html';

//import 'dart:html';

import 'package:build_planner/base/custom_app_bar.dart';
import 'package:build_planner/base/custom_button.dart';
import 'package:build_planner/base/custom_text_field.dart';
import 'package:build_planner/modules/issues/controllers/document/document_controller.dart';
import 'package:build_planner/modules/issues/controllers/document/document_model.dart';
import 'package:build_planner/modules/issues/controllers/estimate/estimate_controller.dart';
import 'package:build_planner/modules/issues/controllers/estimate/estimate_model.dart';
import 'package:build_planner/modules/issues/controllers/issue/issue_model.dart';
import 'package:build_planner/modules/logs/controller/logs_controller.dart';
import 'package:build_planner/modules/logs/controller/logs_model.dart';
import 'package:build_planner/modules/issues/controllers/notify/notify_controller.dart';
import 'package:build_planner/modules/issues/controllers/notify/notify_model.dart';
import 'package:build_planner/controllers/user/user_controller.dart';
import 'package:build_planner/controllers/user/user_model.dart';
import 'package:build_planner/modules/issues/details_card.dart';
import 'package:build_planner/modules/issues/issue_web/document_web_tile.dart';
import 'package:build_planner/modules/issues/issue_web/estimate_web_tile.dart';
import 'package:build_planner/modules/issues/issue_web/notify_web_tile.dart';
import 'package:build_planner/modules/logs/logs_widget.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:build_planner/utils/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class IssuesWebScreen extends StatefulWidget {
  final IssueModel issueModel;
  IssuesWebScreen({required this.issueModel});

  @override
  _IssuesWebScreenState createState() => _IssuesWebScreenState();
}

class _IssuesWebScreenState extends State<IssuesWebScreen> {
  final UserController _userController = Get.put(UserController());
  final EstimateController _estimateController = Get.put(EstimateController());
  final NotifyController _notifyController = Get.put(NotifyController());
  final DocumentController _documentController = Get.put(DocumentController());
  final LogsController _logsController = Get.put(LogsController());

  @override
  initState() {
    super.initState();
    for (int i = 0; i < _userController.users.length; i++) {
      items.add(
        DropdownMenuItem(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _userController.users[i].name,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                _userController.users[i].email,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          value: _userController.users[i].email,
        ),
      );
    }
  }

  List<DropdownMenuItem> items = [
//    DropdownMenuItem(
//      child: Text('User 1'),
//      value: 'User 1',
//    ),
//    DropdownMenuItem(
//      child: Text('User 2'),
//      value: 'User 2',
//    ),
//    DropdownMenuItem(
//      child: Text('User 3'),
//      value: 'User 3',
//    ),
//    DropdownMenuItem(
//      child: Text('User 4'),
//      value: 'User 4',
//    )
  ];
  var selectedValue = '';

  var _expandedNotify = true;

  var _expandedDocument = true;

  var _expandedEstimate = true;

  final _estimateForm = GlobalKey<FormState>();
  final _notifyForm = GlobalKey<FormState>();
  final _documentForm = GlobalKey<FormState>();

  submitEstimate(EstimateModel estimateModel) {
    final _isValid = _estimateForm.currentState!.validate();
    if (!_isValid) {
      return;
    }
    _estimateForm.currentState!.save();
    _estimateController.addEstimate(estimateModel);

    //should be added only if estimate adding successful
    _logsController.addLog(
      LogsModel(
        logId: DateTime.now().toString(),
        issueId: widget.issueModel.issueID,
        user: estimateModel.user,
        isMessage: false,
        byCurrentUser: false,
        text: 'was added as an estimate.',
        date: DateTime.now(),
      ),
    );
  }

  submitNotify(NotifyModel notifyModel) {
    final _isValid = _notifyForm.currentState!.validate();
    if (!_isValid) {
      return;
    }
    _notifyForm.currentState!.save();
    _notifyController.addNotifyUser(notifyModel);
  }

  submitDocument(DocumentModel documentModel) {
    final _isValid = _documentForm.currentState!.validate();
    if (!_isValid) {
      return;
    }
    _documentForm.currentState!.save();
    _documentController.addDocument(documentModel);

    //should be added only if document adding successful
    _logsController.addLog(
      LogsModel(
        logId: DateTime.now().toString(),
        issueId: widget.issueModel.issueID,
        user: documentModel.addedBy,
        isMessage: false,
        byCurrentUser: false,
        text: 'added ' + documentModel.name,
        date: DateTime.now(),
      ),
    );
  }

  Future<dynamic> addEstimateDialog() {
    EstimateModel estimateModel = EstimateModel(
      estimateId: DateTime.now().toString(),
      issueId: widget.issueModel.issueID,
      platform: '',
      product: '',
      date: DateTime.now(),
      status: '',
      duration: '',
      user: UserModel(
        userId: '',
        name: '',
        password: '',
        email: '',
        designation: '',
        phone: '',
      ),
    );
    return showDialog(
      context: context,
      builder: (ctx) => Dialog(
        child: Container(
//          height: 400,
          width: Get.width * 0.52,
          decoration: BoxDecoration(
            borderRadius: StyleConstants.commonBorder12,
            color: Theme.of(context).backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar(head: StringConstants.addEstimate),
              Padding(
                padding: CustomPadding.commonPadding20,
                child: Form(
                  key: _estimateForm,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                            hintText: StringConstants.productHead,
                            textEditingController: TextEditingController(),
                            onSave: (value) {
                              print('hiiiii');
                              print(value);
                              estimateModel.product = value!;
                            },
                          ),
                          CustomTextField(
                            hintText: StringConstants.platformHead,
                            textEditingController: TextEditingController(),
                            onSave: (value) {
                              estimateModel.platform = value!;
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                            hintText: StringConstants.durationHead,
                            textEditingController: TextEditingController(),
                            onSave: (value) {
                              estimateModel.duration = value!;
                            },
                          ),
                          CustomTextField(
                            hintText: StringConstants.statusHead,
                            textEditingController: TextEditingController(),
                            onSave: (value) {
                              estimateModel.status = value!;
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: CustomPadding.commonPadding8,
                        width: Get.width * 0.24,
                        child: SearchableDropdown.single(
                          items: items,
                          value: selectedValue,
                          hint: StringConstants.dropDownAddDevHint,
                          searchHint: null,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                              estimateModel.user =
                                  _userController.userByEmail(value);
                            });
                          },
                          dialogBox: false,
                          isExpanded: true,
                          menuConstraints: BoxConstraints(
                            maxHeight: Get.height * 0.4,
                            maxWidth: Get.width * 0.23,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      CustomButton(
                        text: StringConstants.addButtonText,
                        onPressed: () {
                          submitEstimate(estimateModel);
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> addNotifyUserDialog() {
    NotifyModel notifyModel = NotifyModel(
      notifyId: DateTime.now().toString(),
      issueId: widget.issueModel.issueID,
      role: '',
      user: UserModel(
        userId: '',
        name: '',
        password: '',
        email: '',
        designation: '',
        phone: '',
      ),
    );

    return showDialog(
      context: context,
      builder: (ctx) => Dialog(
        child: Container(
//          height: 240,
          width: Get.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: StyleConstants.commonBorder12,
            color: Theme.of(context).backgroundColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar(head: StringConstants.addUser),
              Padding(
                padding: CustomPadding.commonPadding20,
                child: Form(
                  key: _notifyForm,
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: StringConstants.notifyRoleFieldHint,
                        textEditingController: TextEditingController(),
                        onSave: (value) {
                          print('hiiiii');
                          print(value);
                          notifyModel.role = value!;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: CustomPadding.commonPadding8,
                        width: Get.width * 0.24,
                        child: SearchableDropdown.single(
                          items: items,
                          value: selectedValue,
                          hint: StringConstants.dropDownUserHint,
                          searchHint: null,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                              notifyModel.user =
                                  _userController.userByEmail(value);
                            });
                          },
                          dialogBox: false,
                          isExpanded: true,
                          menuConstraints: BoxConstraints(
                            maxHeight: Get.height * 0.4,
                            maxWidth: Get.width * 0.23,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        text: StringConstants.addButtonText,
                        onPressed: () {
                          submitNotify(notifyModel);
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> addDocumentDialog() {
    DocumentModel documentModel = DocumentModel(
      docId: DateTime.now().toString(),
      issueId: widget.issueModel.issueID,
      name: '',
      addedBy: UserModel(
        userId: '1234',
        name: 'Anuj',
        password: 'anuj',
        email: '',
        designation: '',
        phone: '',
      ),
      dateTime: DateTime.now(),
    );

    return showDialog(
      context: context,
      builder: (ctx) => Dialog(
        child: Container(
//          height: 240,
          width: Get.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: StyleConstants.commonBorder12,
            color: Theme.of(context).backgroundColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar(head: StringConstants.addDocument),
              Padding(
                padding: CustomPadding.commonPadding20,
                child: Form(
                  key: _documentForm,
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: StringConstants.docNameFieldHint,
                        textEditingController: TextEditingController(),
                        onSave: (value) {
                          documentModel.name = value!;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        text: StringConstants.addButtonText,
                        onPressed: () {
                          submitDocument(documentModel);
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeadTile(String head, bool expanded) {
    return ListTile(
      leading: IconButton(
        icon: expanded
            ? Icon(Icons.keyboard_arrow_down)
            : Icon(Icons.keyboard_arrow_right),
        onPressed: () {
          setState(() {
            if (head == StringConstants.notifyHead)
              _expandedNotify = !_expandedNotify;
            if (head == StringConstants.documentHead)
              _expandedDocument = !_expandedDocument;
            if (head == StringConstants.estimateHead)
              _expandedEstimate = !_expandedEstimate;
          });
        },
      ),
      title: Text(head),
      trailing: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          if (head == StringConstants.estimateHead) addEstimateDialog();
          if (head == StringConstants.notifyHead) addNotifyUserDialog();
          if (head == StringConstants.documentHead) addDocumentDialog();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            widget.issueModel.issueID,
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Row(
          children: [
            Expanded(
              child: Container(
                width: Get.width * 0.7,
                height: Get.height * 0.9,
                padding: CustomPadding.commonPadding8,
                child: ListView(
                  children: [
                    buildHeadTile(
                      StringConstants.notifyHead,
                      _expandedNotify,
                    ),
                    if (_expandedNotify)
                      Padding(
                        padding: CustomPadding.commonPadding20,
                        child: NotifyWebTile(
                          issueId: widget.issueModel.issueID,
                        ),
                      ),
                    buildHeadTile(
                      StringConstants.documentHead,
                      _expandedDocument,
                    ),
                    if (_expandedDocument)
                      Padding(
                        padding: CustomPadding.commonPadding20,
                        child: DocumentWebTile(
                          issueId: widget.issueModel.issueID,
                        ),
                      ),
                    buildHeadTile(
                      StringConstants.estimateHead,
                      _expandedEstimate,
                    ),
                    if (_expandedEstimate)
                      Padding(
                        padding: CustomPadding.commonPadding20,
                        child: EstimateWebTile(
                          issueId: widget.issueModel.issueID,
                        ),
//                          GetBuilder<EstimateController>(
//                            init: EstimateController(),
//                            builder: (notifyData) => EstimateWebTile(
//                              issueId: widget.issueModel.issueID,
//                            ),
//                          ),
                      ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DetailsCard(
                  issueModel: widget.issueModel,
                ),
                Container(
                  height: Get.height * 0.5,
                  width: Get.width * 0.26,
                  color: Colors.grey.shade50,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: StyleConstants.tl8tr8Border,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        width: Get.width * 0.26,
                        child: Center(
                            child: Text(
                          StringConstants.logsButtonHead.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                      ),
                      //removed builder from here, in case
                      Expanded(
                        child: LogsWidget(
                          issueId: widget.issueModel.issueID,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

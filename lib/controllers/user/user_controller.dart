import 'package:build_planner/controllers/user/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  List<UserModel> _users = [
    UserModel(
      userId: '1234',
      name: 'Anuj',
      password: 'anuj',
      email: 'anujt@meditab.com',
      designation: '',
      phone: '',
    ),
    UserModel(
      userId: '5678',
      name: 'Nikul',
      password: 'nikul',
      email: 'nikulk@meditab.com',
      designation: '',
      phone: '',
    ),
  ];

  List get users => [..._users];

  UserModel userByEmail(String email) =>
      _users.firstWhere((element) => element.email == email);
}

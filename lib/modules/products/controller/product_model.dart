import 'package:build_planner/controllers/user/user_model.dart';

class ProductModel {
  final String productId;
  final String productName;
  final String platform;
  final UserModel owner;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.platform,
    required this.owner,
  });
}

import 'package:build_planner/controllers/user/user_model.dart';
import 'package:build_planner/modules/products/controller/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<ProductModel> _productModel = <ProductModel>[
    ProductModel(
      productId: 'PA123',
      productName: 'IMSGo',
      platform: 'Android',
      owner: UserModel(
        userId: '1234',
        name: 'Anuj',
        password: 'anuj',
        email: '',
        designation: '',
        phone: '',
      ),
    ),
    ProductModel(
      productId: 'PA456',
      productName: 'Quickap',
      platform: 'Android',
      owner: UserModel(
        userId: '1234',
        name: 'Anuj',
        password: 'anuj',
        email: '',
        designation: '',
        phone: '',
      ),
    ),
    ProductModel(
      productId: 'PA789',
      productName: 'Patient',
      platform: 'Android',
      owner: UserModel(
        userId: '1234',
        name: 'Anuj',
        password: 'anuj',
        email: '',
        designation: '',
        phone: '',
      ),
    ),
    ProductModel(
      productId: 'PA012',
      productName: 'Build Planner',
      platform: 'Android',
      owner: UserModel(
        userId: '1234',
        name: 'Anuj',
        password: 'anuj',
        email: '',
        designation: '',
        phone: '',
      ),
    ),
  ].obs;
  List<ProductModel> _productModelBySearch = <ProductModel>[].obs;

  buildListBySearch(String? searchKey) {
    _productModelBySearch = [
      ..._productModel.where((element) => element.productName
          .toLowerCase()
          .contains(searchKey.toString().toLowerCase()))
    ];
    update();
  }

  List get products => [..._productModel];

  List get searchedProducts => [..._productModelBySearch];
}

import 'package:build_planner/base/custom_search_tile.dart';
import 'package:build_planner/modules/products/controller/product_controller.dart';
import 'package:build_planner/modules/products/product_tile.dart';
import 'package:build_planner/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductController _productController = Get.put(ProductController());
//    final deviceSize = MediaQuery.of(context).size;
    final TextEditingController textEditingController = TextEditingController();
    return Container(
      height: ResponsiveWidget.isLargeScreen(context)
          ? Get.height * 0.9
          : Get.height * 0.82,
      width: ResponsiveWidget.isLargeScreen(context)
          ? Get.width * 0.75
          : Get.width,
      child: !ResponsiveWidget.isLargeScreen(context)
          ? ListView(
              scrollDirection: Axis.vertical,
              children: [
                CustomSearchTile(
                  textEditingController: textEditingController,
                  onChange: (value) {},
                  onPressed: () {},
                ),
//                buildProductTile(context),
//                buildProductTile(context),
//                buildProductTile(context),
//                buildProductTile(context),
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomSearchTile(
                  textEditingController: textEditingController,
                  onChange: (value) {
                    _productController.buildListBySearch(value);
                  },
                  onPressed: () {},
                ),
                GetBuilder<ProductController>(
                  builder: (ctx) => Expanded(
                    child: Container(
                      height: Get.height * 0.79,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 1.8,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: textEditingController.text == ''
                            ? _productController.products.length
                            : _productController.searchedProducts.length,
                        itemBuilder: (ctx, index) {
                          return ProductTile(
                            productModel: textEditingController.text == ''
                                ? _productController.products[index]
                                : _productController.searchedProducts[index],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

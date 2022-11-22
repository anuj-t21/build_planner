import 'package:build_planner/base/custom_chip.dart';
import 'package:build_planner/modules/products/controller/product_model.dart';
import 'package:build_planner/utils/constants/color_constants.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:build_planner/utils/constants/style_constants.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  ProductTile({required this.productModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CustomPadding.commonPadding8,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: ColorConstants.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: StyleConstants.commonBorder8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: CustomPadding.commonPadding12,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    productModel.productName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 2,
              thickness: 2,
              color: Theme.of(context).backgroundColor,
            ),
            buildRows(StringConstants.productIDHead, productModel.productId),
            Divider(
              thickness: 1,
              color: Theme.of(context).backgroundColor,
            ),
            buildRows(StringConstants.platformHead, productModel.platform),
            Divider(
              thickness: 1,
              color: Theme.of(context).backgroundColor,
            ),
            buildRows(StringConstants.ownerHead, productModel.owner.name),
          ],
        ),
      ),
    );
  }

  Widget buildRows(String rowHead, String chipHead) {
    return Padding(
      padding: CustomPadding.commonPadding8,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            rowHead,
          ),
          Padding(
            padding: CustomPadding.commonPadding4,
            child: CustomChip(
              text: chipHead,
            ),
          )
        ],
      ),
    );
  }
}

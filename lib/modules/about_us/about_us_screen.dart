//import 'dart:html';

import 'package:build_planner/base/custom_app_bar.dart';
import 'package:build_planner/modules/app_drawer.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/responsive.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Row(
        children: [
          if (ResponsiveWidget.isLargeScreen(context))
            AppDrawer(
              fromBottomBar: true,
            ),
          if (ResponsiveWidget.isLargeScreen(context))
            SizedBox(
              width: 20,
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(head: 'About Us'),
                Padding(
                  padding: CustomPadding.commonPadding16,
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec turpis dictum, tincidunt turpis id, suscipit risus. Morbi in nibh at mi iaculis vehicula. Maecenas ornare erat tempor augue volutpat, id blandit sem feugiat. Etiam metus risus, fermentum quis orci vel, lobortis laoreet nisl. Nulla sodales mauris ac urna aliquet, ac pharetra justo placerat. Sed lobortis id dui pellentesque dictum. Vestibulum rhoncus sed diam ut convallis. Quisque vitae neque varius, dapibus urna in, luctus sem. Praesent commodo dictum ipsum et dapibus.\n\n'
                      'Vivamus sollicitudin sollicitudin fringilla. Phasellus ut velit blandit dui bibendum fringilla. Morbi ultricies aliquet magna et vulputate. Donec mollis mollis efficitur. Nullam quis tortor viverra, mollis augue a, pulvinar metus. Duis in tincidunt nisi. Suspendisse libero enim, hendrerit vitae purus in, rutrum mattis velit. Vivamus turpis eros, pulvinar non aliquet id, luctus vehicula lorem. Quisque nulla ligula, faucibus non erat eget, vestibulum ultricies quam. Cras lacinia libero laoreet tellus semper, nec tincidunt lacus suscipit. Ut hendrerit massa vitae justo placerat, vitae mollis mauris mattis. Fusce et turpis ornare nunc consectetur sagittis in rhoncus nunc. Integer dolor risus, tincidunt consectetur eleifend non, consectetur et lacus.\n\n'
                      'Donec viverra ornare ipsum, id bibendum tortor lobortis nec. In ornare mollis urna, eget fringilla massa tincidunt at. Nullam nec massa quis justo tincidunt dictum. Praesent viverra, justo eget vestibulum vestibulum, est lacus semper mi, et placerat neque nibh eu erat. Aenean vel erat est. Integer congue eros neque, nec iaculis augue elementum ac. Donec efficitur pharetra tellus, id finibus mauris accumsan ac. Mauris luctus placerat augue tincidunt facilisis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris ac euismod lectus. Nam a massa vitae velit vulputate scelerisque. Donec interdum, purus finibus egestas faucibus, justo elit vehicula diam, vel tincidunt tortor dui sed nisi. Fusce vel ex magna. Praesent cursus blandit convallis. Pellentesque vestibulum feugiat ipsum, vel ultrices nunc luctus vel. Maecenas malesuada tortor justo, et rutrum nunc vehicula vitae.\n\n'
                      'Aliquam imperdiet rutrum ante bibendum feugiat. Etiam ullamcorper urna et nunc pellentesque, non finibus metus egestas. Sed hendrerit quam vel massa interdum rhoncus. Nam tincidunt, dolor et interdum vulputate, mi risus porttitor metus, hendrerit varius mi magna vitae leo. Proin dapibus mollis est, ut vulputate ante dictum et. Etiam odio elit, pretium eu ornare vitae, mollis id dui. Fusce quis dolor dolor.\n'
                      'Pellentesque enim arcu, bibendum eu ipsum vitae, suscipit ornare dui. Mauris ullamcorper at elit at imperdiet. Maecenas tempor dictum ornare. Morbi ut metus sem. Etiam nulla tellus, posuere eu libero ac, congue viverra elit. Aenean efficitur lorem et faucibus vehicula. Cras porttitor erat nibh, nec rhoncus libero scelerisque a. Mauris pulvinar eros nunc, vitae luctus lorem dignissim in. Proin eu posuere tellus. Fusce sed mi ut augue imperdiet vestibulum ut sed eros. Nam porta congue turpis, non feugiat ipsum porttitor sed.\n\n'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

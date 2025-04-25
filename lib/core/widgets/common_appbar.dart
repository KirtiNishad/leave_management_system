import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_text.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  String title;

  CommonAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(

          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          )),
      surfaceTintColor: Theme.of(context).primaryColor,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppText(
          text: title,
          weight: FontWeight.w600,
          letterSpacing: 1,
        ),
      ),
      elevation: 2,
      foregroundColor: Theme.of(context).primaryColor,
      shadowColor: Colors.grey.shade300,
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

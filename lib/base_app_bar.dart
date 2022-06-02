import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.grey;
  final Text title;
  final AppBar appBar;

  // ignore: use_key_in_widget_constructors
  /// you can add more fields that meet your needs

  const BaseAppBar({
    required this.title,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: backgroundColor,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'navegador');
          },
          icon: const Icon(Icons.apps_outlined),
        ),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'perfil');
            },
            icon: const Icon(Icons.person))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

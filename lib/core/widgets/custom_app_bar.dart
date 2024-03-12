import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Decoration? boxDecoration;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    this.boxDecoration,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        leading: showBackButton
            ? IconButton(
                padding: const EdgeInsetsDirectional.only(start: 24.0),
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                })
            : null,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: SvgPicture.asset("assets/icons/logo.svg"),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

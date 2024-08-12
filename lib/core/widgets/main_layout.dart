import 'package:flutter/material.dart';
import 'package:style_sphere/core/extentions/screen_size.dart';
import 'package:style_sphere/core/utils/app_theme.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.screenBackgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
            child:SingleChildScrollView(
        child: body
      ) ),
        ),
      ),
    );
    
  }
}

import 'package:flutter/material.dart';
import 'package:style_sphere/core/utils/app_theme.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color:color==null?color: AppTheme.whiteColor,
      ),
    );
  }
}

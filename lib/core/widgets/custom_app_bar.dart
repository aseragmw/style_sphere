import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool? showBackCursor;
  final Widget? trailingWidget;

  const CustomAppBar({super.key, this.title, this.showBackCursor, this.trailingWidget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Container(
          child: Center(
            child: Text(title ?? ""),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            showBackCursor!=null ? showBackCursor!?InkWell(child: Icon(Icons.arrow_back_ios_new) ,onTap: () {
              Navigator.of(context).pop();
            },):const SizedBox():const SizedBox(),
          trailingWidget??const SizedBox(),
          ],
        )
      ],
    );
  }
}

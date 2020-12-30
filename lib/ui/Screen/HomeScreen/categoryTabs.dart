import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  final tabHeadingText;
  final Color textColor;
  final double textSize;
  CategoryTabs(this.tabHeadingText,this.textColor,this.textSize);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: Text(
          "$tabHeadingText",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .button
              .copyWith(fontWeight: FontWeight.w900, fontSize: textSize,color: textColor),
        ),
      ),
    );
  }
}

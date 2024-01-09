import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: AppColors.primaryColor.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.computer_outlined,
              size: 32,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: AppColors.primaryColor),
        ),
      ],
    );
  }
}

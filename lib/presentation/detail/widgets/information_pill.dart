import 'package:flutter/material.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';

class InformationPill extends StatelessWidget {
  const InformationPill(
      {super.key,
      required this.title,
      required this.detail,
      required this.icon});

  final String title;
  final String detail;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.codGray.withOpacity(0.5),),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: AppColors.dawn),),
            Text(detail, style: TextStyle(color: AppColors.codGray, fontSize: 16),),
          ],
        ),
      ],
    );
  }
}

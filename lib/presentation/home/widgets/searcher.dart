import 'package:flutter/material.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';

class Searcher extends StatelessWidget {
  const Searcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.codGray),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded),
          const SizedBox(width: 10),
          Text(
            'Search for recipes...',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}

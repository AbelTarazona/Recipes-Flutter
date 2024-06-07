import 'package:flutter/material.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';
import 'package:recipes_aplazo/presentation/search/search_page.dart';

class Searcher extends StatelessWidget {
  const Searcher({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(SearchPage.route());
      },
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: AppColors.codGray),
        ),
        child: const Row(
          children: [
            Icon(Icons.search_rounded),
            SizedBox(width: 10),
            Text(
              'Search for recipes...',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

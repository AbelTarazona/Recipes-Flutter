import 'package:flutter/material.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';

class Content extends StatefulWidget {
  const Content({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {

  bool isActiveInstructions = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.albescentWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    isActiveInstructions ? 'Instructions' : 'Ingredients',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                const VerticalDivider(color: AppColors.codGray,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isActiveInstructions = !isActiveInstructions;
                    });
                  },
                  child: Text(
                    isActiveInstructions ? 'Ingredients' : 'Instructions',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.codGray,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, pos) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                isActiveInstructions ? '${pos + 1}. ${widget.recipe.instructions[pos]}' : widget.recipe.ingredients[pos],
                style: const TextStyle(fontSize: 16),
              ),
            ),
            separatorBuilder: (context, pos) => Divider(
              color: AppColors.dawn.withOpacity(0.5),
            ),
            itemCount: isActiveInstructions ? widget.recipe.instructions.length : widget.recipe.ingredients.length,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text.rich(
            TextSpan(
              text: 'Let\'s cook',
              children: [
                TextSpan(
                    text: ' something delicious',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
            style: TextStyle(
              fontSize: 50,
              height: 1.2,
              color: AppColors.codGray,
            ),
          ),
        ),
        Image.asset(
          'assets/images/vegetables.png',
          width: 120,
          height: 120,
        )
      ],
    );
  }
}

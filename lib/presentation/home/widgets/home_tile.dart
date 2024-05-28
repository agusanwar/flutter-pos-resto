import 'package:flutter/material.dart';
import 'package:posresto/core/extensions/date_time_ext.dart';

import '../../../core/components/search_input.dart';
import '../../../core/constants/colors.dart';

class HomeTitle extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? onChanged;

  const HomeTitle({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Narve Pos',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              DateTime.now().toFormattedDate(),
              style: const TextStyle(
                color: AppColors.subtitle,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 200.0,
          child: SearchInput(
            controller: controller,
            onChanged: onChanged,
            hintText: 'Search item...',
          ),
        ),
      ],
    );
  }
}

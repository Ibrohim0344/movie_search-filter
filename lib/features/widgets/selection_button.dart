import 'package:flutter/material.dart';
import 'package:insoft_test_task/common/extensions/app_extensions.dart';
import 'package:insoft_test_task/common/style/colors.dart';

class SelectionButton extends StatelessWidget {
  final String text;
  final bool value;
  final void Function(bool?) onChanged;
  final bool isBackgroundVisible;

  const SelectionButton({
    required this.text,
    required this.value,
    required this.onChanged,
    this.isBackgroundVisible = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: isBackgroundVisible
            ? Colors.white.withOpacity(.2)
            : Colors.transparent,
      ),
      child: Row(
        children: [
          Checkbox(
            activeColor: Colors.red,
            visualDensity: VisualDensity.compact,
            value: value,
            onChanged: onChanged,
          ),
          Text(
            text,
            style: context.textStyle.labelMedium?.copyWith(
              color: AppColors.silver,
            ),
          ),
          10.width,
        ],
      ),
    );
  }
}

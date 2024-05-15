import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insoft_test_task/common/extensions/app_extensions.dart';
import 'package:insoft_test_task/common/style/colors.dart';

class MySearchField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const MySearchField({
    required this.controller,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
        
      textInputAction: TextInputAction.search,
      style: context.textStyle.labelLarge?.copyWith(
        color: AppColors.silver,
      ),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(.3),
        filled: true,
        prefixIcon: const Padding(
          padding: EdgeInsets.all(14),
          child: Icon(
            CupertinoIcons.search,
            color: AppColors.silver,
          ),
        ),
        hintText: "Search",
        hintStyle: context.textStyle.labelLarge?.copyWith(
          color: AppColors.silver,
        ),
        contentPadding: const EdgeInsets.all(4),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: AppColors.silver,
            width: 2,
          ),
        ),
      ),
    );
  }
}

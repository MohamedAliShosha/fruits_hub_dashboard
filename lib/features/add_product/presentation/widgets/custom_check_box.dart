import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onChanged});

  final bool isChecked;
  // This the callBack reference that will bve used in checkBox that exists in "TermsAndConditions" widget
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Call the onChanged callback with the new value
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.kPrimaryColor : AppColors.kWhiteColor,
          shape: BeveledRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isChecked ? Colors.transparent : const Color(0xFFDCDEDE),
            ),
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
        child: isChecked
            ? const Icon(
                Icons.check,
                color: Colors.white,
              )
            : const SizedBox(),
      ),
    );
  }
}

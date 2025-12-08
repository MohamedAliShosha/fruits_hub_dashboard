import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/core/utils/constants.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widgets/custom_check_box.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({super.key, required this.onChanged});

  /*
    - This is a normal callBack but it differs from other callBacks as it accepts an "argument"
    - Here I define the form of function that should be built at sign_up_view body widget
  */
  final ValueChanged<bool> onChanged;

  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width:
              MediaQuery.sizeOf(context).width - (kHorizontalPadding * 2) - 48,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Is this product featured?',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          child: SizedBox(
            width: 16,
          ),
        ),
        CustomCheckBox(
          onChanged: (value) {
            setState(() {
              isTermsAccepted = value;
              // Sending the changed value to the onChanged callBack
              widget.onChanged(value);
            });
          },
          isChecked:
              isTermsAccepted, // 👈 this is initially false, So when the app first builds: isChecked inside CustomCheckBox = false
        ),
      ],
    );
  }
}

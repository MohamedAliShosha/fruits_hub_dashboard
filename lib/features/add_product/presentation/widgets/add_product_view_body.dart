import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_form_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: const Column(
            children: [
              CustomTextFormField(
                hintText: 'Product name',
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: 'Product price',
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                // A unique code for each product
                hintText: 'Product code',
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                maxLines: 5,
                hintText: 'Product description',
                textInputType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

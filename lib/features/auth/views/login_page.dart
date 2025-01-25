import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/text_style.dart';
import '../../../core/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FormBuilder(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                textInputAction: TextInputAction.next,
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ],
                ),
              ),
              Gap(20.h),
              FormBuilderTextField(
                name: 'password',
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                textInputAction: TextInputAction.done,
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(),
                  ],
                ),
              ),
              Gap(24.h),
              CustomButton(
                  title: 'Login',
                  onTap: () {
                    if (formKey.currentState!.saveAndValidate()) {}
                  }),
              Gap(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: AppTextStyles.gray16Bold700,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.products, (route) => false),
                    child: Text(
                      'Sign Up',
                      style: AppTextStyles.primary16Bold700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/text_style.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../data/models/login_request.dart';
import '../provider/providers.dart';

class LoginPage extends HookConsumerWidget {
  LoginPage({super.key});

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _LoginForm(formKey: formKey),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _EmailField(),
          Gap(20.h),
          _PasswordField(),
          Gap(24.h),
          const _LoginButton(),
          Gap(24.h),
          _SignUpPrompt(),
        ],
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'email',
      initialValue: 'samad',
      decoration: const InputDecoration(hintText: 'Email'),
      textInputAction: TextInputAction.next,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );
  }
}

class _PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'password',
      initialValue: '1234',
      decoration: const InputDecoration(hintText: 'Password'),
      textInputAction: TextInputAction.done,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );
  }
}

class _LoginButton extends ConsumerWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginViewModelProvider);
    return loginState.when(
      initial: () => CustomButton(
        title: 'Login',
        onTap: () async {
          final formState = FormBuilder.of(context);
          if (formState?.saveAndValidate() ?? false) {
            final email = formState?.value['email'];
            final password = formState?.value['password'];
            final loginRequest = LoginRequest(
              userNameOrEmailAddress: email,
              password: password,
            );
            ref.read(loginViewModelProvider.notifier).login(
                  loginRequest: loginRequest,
                );
          }
        },
      ),
      loading: () => const CircularProgressIndicator(),
      error: (failure) => Center(
        child: Text(failure.message),
      ),
      success: (loginResponse) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.products, (route) => false);
        });
        return const SizedBox();
      },
    );
  }
}

class _SignUpPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: AppTextStyles.gray16Bold700,
        ),
        GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.products, (route) => false),
          child: Text(
            'Sign Up',
            style: AppTextStyles.primary16Bold700,
          ),
        ),
      ],
    );
  }
}

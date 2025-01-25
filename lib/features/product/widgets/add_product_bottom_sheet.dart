import 'package:agile_crafts/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';

import '../../../core/utils/text_style.dart';

class AddProductBottomSheet extends StatelessWidget {
  AddProductBottomSheet({super.key});
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: FormBuilder(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add Product',
              style: AppTextStyles.primary16Bold700,
            ),
            Gap(20.h),
            FormBuilderTextField(
              name: 'name',
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
              textInputAction: TextInputAction.next,
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(),
                ],
              ),
            ),
            Gap(12.h),
            FormBuilderTextField(
              name: 'description',
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
              textInputAction: TextInputAction.next,
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(),
                ],
              ),
            ),
            Gap(12.h),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: FormBuilderTextField(
                    name: 'id',
                    decoration: const InputDecoration(
                      hintText: 'ID',
                    ),
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                      ],
                    ),
                  ),
                ),
                Gap(12.w),
                Flexible(
                  flex: 1,
                  child: FormBuilderTextField(
                    name: 'tenantId',
                    decoration: const InputDecoration(
                      hintText: 'Tenant ID',
                    ),
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Gap(12.h),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                Text('Active', style: AppTextStyles.primary16Bold700),
              ],
            ),
            Gap(20.w),
            CustomButton(
              title: 'Add Product',
              onTap: () {
                if (formKey.currentState!.saveAndValidate()) {
                  print(formKey.currentState!.value);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:agile_crafts/data/models/product.dart';
import 'package:agile_crafts/main.data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils/text_style.dart';
import '../../../core/widgets/custom_button.dart';

class AddProductPage extends HookConsumerWidget {
  AddProductPage({super.key});
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 20.h,
          ),
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
                  initialValue: 'Product Name',
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
                  initialValue: 'Product Description',
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
                        initialValue: '1201',
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
                        initialValue: '10',
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
                FormBuilderCheckbox(
                  name: 'isAvailable',
                  initialValue: true,
                  decoration: const InputDecoration(),
                  title: Text('Active', style: AppTextStyles.primary16Bold700),
                ),
                Gap(20.w),
                CustomButton(
                  title: 'Add Product',
                  onTap: () async {
                    if (formKey.currentState!.saveAndValidate()) {
                      Product model =
                          Product.fromJson(formKey.currentState!.value);
                      await ref.products.save(
                        model,
                        onSuccess: (data, label, adapter) async {
                          final model = await adapter.onSuccess(data, label);
                          return model as Product;
                        },
                        onError: (e, label, adapter) async {
                          return adapter.onError(e, label);
                        },
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:agile_crafts/core/widgets/custom_button.dart';
import 'package:agile_crafts/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils/text_style.dart';
import '../provider/providers.dart';

class AddProductBottomSheet extends StatelessWidget {
  AddProductBottomSheet({super.key});
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 20.h,
          bottom: MediaQuery.of(context)
              .viewInsets
              .bottom, // Adds padding for keyboard
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
              Consumer(builder: (context, ref, _) {
                final addProductState = ref.watch(addProductViewModelProvider);
                return addProductState.when(
                  initial: () => CustomButton(
                    title: 'Add Product',
                    onTap: () {
                      if (formKey.currentState!.saveAndValidate()) {
                        final Product product = Product(
                          name: formKey.currentState!.value['name'],
                          description:
                              formKey.currentState!.value['description'],
                          id: int.parse(formKey.currentState!.value['id']),
                          tenantId: int.parse(
                              formKey.currentState!.value['tenantId']),
                          isAvailable:
                              formKey.currentState!.value['isAvailable'],
                        );
                        ref
                            .read(addProductViewModelProvider.notifier)
                            .addProduct(
                              product: product,
                            );
                      }
                    },
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (failure) => Center(child: Text(failure.message)),
                  success: (success) {
                    print(success);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ref.refresh(productsViewModelProvider.notifier).stream;
                      Navigator.of(context).pop();
                    });
                    return const SizedBox();
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

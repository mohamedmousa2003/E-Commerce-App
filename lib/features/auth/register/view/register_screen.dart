import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helpers/spacing.dart';
import 'package:shoppe/core/resources/assets_manager.dart';
import 'package:shoppe/core/resources/constants.dart'; // تأكد أن هذا الملف يحتوي على المتغيرات
import 'package:shoppe/core/themes/colors.dart';
import 'package:shoppe/core/themes/styles.dart';
import 'package:shoppe/core/widgets/dialog_utils.dart';
import 'package:shoppe/core/widgets/title_text.dart';
import 'package:shoppe/core/widgets/validators.dart';
import 'package:shoppe/domain/di/di.dart';
import 'package:shoppe/features/auth/register/view_model/register_view_model_cubit.dart';
import 'package:shoppe/features/auth/register/view_model/register_view_model_state.dart';

import '../../../../core/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context, text: loading);
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context,
            state.failures.errorMessage,
            messageTitle: error,
            negActionName: ok,
          );
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context,
            registerSuccessfully,
            messageTitle: success,
            negActionName: ok,
          );
        }
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            Image.asset(ImageAssets.backgroundImage),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 8.0, left: 10.0, right: 10.0, top: 30),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    child: Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TitleTextWidget(
                            label: register,
                            textStyle: TextStyles.font40BlackBold,
                          ),
                          // SizeBox
                          15.height,
                          TitleTextWidget(
                            label: fullName,
                            textStyle: TextStyles.font18DarkBlueSemiBold,
                          ),
                          5.height,
                          // TextFormField name
                          CustomTextField(
                            hint: enterFulName,
                            onValidate: AppValidators.validateFullName,
                            controller: viewModel.nameController,
                          ),
                          // SizeBox
                          15.height,
                          TitleTextWidget(
                            label: mobileNumber,
                            textStyle: TextStyles.font18DarkBlueSemiBold,
                          ),
                          5.height,
                          // TextFormField pone
                          CustomTextField(
                            hint: enterPhone,
                            onValidate: AppValidators.validatePhoneNumber,
                            controller: viewModel.phoneController,
                          ),
                          // SizeBox
                          15.height,
                          TitleTextWidget(
                            label: email,
                            textStyle: TextStyles.font18DarkBlueSemiBold,
                          ),
                          5.height,
                          // TextFormField email
                          CustomTextField(
                            hint: enterEmail,
                            onValidate: AppValidators.validateEmail,
                            controller: viewModel.emailController,
                          ),
                          // SizeBox
                          15.height,
                          TitleTextWidget(
                            label: possWord,
                            textStyle: TextStyles.font18DarkBlueSemiBold,
                          ),
                          5.height,
                          // TextFormField password
                          CustomTextField(
                            hint: enterPassword,
                            isPassword: true,
                            onValidate: AppValidators.validatePassword,
                            controller: viewModel.passwordController,
                          ),
                          // SizeBox
                          15.height,
                          TitleTextWidget(
                            label: confirmPassword,
                            textStyle: TextStyles.font18DarkBlueSemiBold,
                          ),
                          5.height,
                          // TextFormField password
                          CustomTextField(
                            hint: enterConfirmPassword,
                            isPassword: true,
                            onValidate: (value) =>
                                AppValidators.validateConfirmPassword(
                                    value, viewModel.rePasswordController.text),
                            // تمرير المتغير الثاني بشكل ثابت
                            controller: viewModel.rePasswordController,
                          ),
                          // SizeBox
                          30.height,
                          // ClickButton

                          TextButton(
                            onPressed: () {
                              viewModel.register();
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(AppColors.mainBlue),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize: WidgetStateProperty.all(
                                const Size(double.infinity, 52),
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.sp),
                                ),
                              ),
                            ),
                            child: TitleTextWidget(
                              label: register,
                              textStyle: TextStyles.font25WhiteBold,
                            ),
                          ),
                          20.height,
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(alreadyHaveAccount,
                                style: TextStyles.font18BlueBold),
                          ),

                          ///////////////////////////////
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

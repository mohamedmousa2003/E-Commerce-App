import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helpers/spacing.dart';
import 'package:shoppe/core/resources/assets_manager.dart';
import 'package:shoppe/core/resources/constants.dart'; // تأكد أن هذا الملف يحتوي على المتغيرات
import 'package:shoppe/core/routes_manager/routes.dart';
import 'package:shoppe/core/themes/colors.dart';
import 'package:shoppe/core/themes/styles.dart';
import 'package:shoppe/core/widgets/dialog_utils.dart';
import 'package:shoppe/core/widgets/shared_preference_utils.dart';
import 'package:shoppe/core/widgets/title_text.dart';
import 'package:shoppe/core/widgets/validators.dart';
import 'package:shoppe/domain/di/di.dart';
import 'package:shoppe/features/auth/login/view_model/login_view_model_cubit.dart';
import 'package:shoppe/features/auth/login/view_model/login_view_model_state.dart';

import '../../../../core/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, text: wait);
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context,
            state.failures.errorMessage,
            messageTitle: error,
            negActionName: ok,
          );
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context,
            loginSuccessfully,
            messageTitle: success,
            negActionName: ok,
          );

          // save token (SharedPreferences)
          SharedPreferenceUtils.saveData(
              key: "token", value: state.loginResponseEntity.token);
          Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(ImageAssets.backgroundImage),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                // إضافة ScrollView
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        55.height,
                        TitleTextWidget(
                          label: login,
                          textStyle: TextStyles.font40BlackBold,
                        ),
                        // SizeBox
                        20.height,
                        TitleTextWidget(
                          label: email,
                          textStyle: TextStyles.font18DarkBlueSemiBold,
                        ),
                        5.height,
                        // TextFormField email
                        CustomTextField(
                          hint: enterEmail,
                          controller: viewModel.emailController,
                          onValidate: AppValidators.validateEmail,
                        ),
                        // SizeBox
                        15.height,
                        TitleTextWidget(
                            label: possWord,
                            textStyle: TextStyles.font18DarkBlueSemiBold),
                        5.height,
                        // TextFormField password
                        CustomTextField(
                          hint: enterPassword,
                          controller: viewModel.passwordController,
                          isPassword: true,
                        ),

                        // SizeBox
                        15.height,
                        TitleTextWidget(
                          textAlign: TextAlign.end,
                          label: forgotPassword,
                          textStyle: TextStyles.font18DarkBlueBold,
                        ),
                        // SizeBox
                        30.height,
                        // ClickButton
                        TextButton(
                          onPressed: () {
                            viewModel.login();
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
                            label: login,
                            textStyle: TextStyles.font25WhiteBold,
                          ),
                        ),
                        20.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TitleTextWidget(
                                label: noAccount,
                                textStyle: TextStyles.font18DarkBlueSemiBold),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.registerScreen);
                              },
                              child: Text(createAccount,
                                  style: TextStyles.font18BlueBold),
                            )
                          ],
                        ), // استخدام SizedBox للتباعد
                      ],
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

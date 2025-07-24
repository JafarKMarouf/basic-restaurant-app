part of '../index.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  final Rx<AutovalidateMode> autoValidate = AutovalidateMode.disabled.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  bool validator() {
    if (formKey.value.currentState!.validate()) {
      return true;
    } else {
      autoValidate.value = AutovalidateMode.always;
      return false;
    }
  }

  Future<void> signIn(LoginUserRequest request) async {
    isLoading.value = true;
    var result = await sl<SignInUseCase>().call(request);
    isLoading.value = false;
    result.fold(
      (error) {
        AppSnackBar.show(
            title: 'Error',
            message: error.message,
            backgroundColor: AppColors.secondary,
            textColor: AppColors.danger,
            iconColor: AppColors.danger
        );
      },
      (data) {
        AppSnackBar.show(
          title: 'Success',
          message: 'Sign In Successfully!',
          backgroundColor: AppColors.primary,
        );
        clearForm();
        Get.offAllNamed(AppPages.home);
      },
    );
  }

  void clearForm() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

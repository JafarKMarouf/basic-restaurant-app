part of '../index.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SignInController>(
      builder: (controller) => ModalProgressHUD(
        inAsyncCall: controller.isLoading.value,
        color: AppColors.primary,
        opacity: .1,
        child: Scaffold(
          appBar: BasicAppbar(hideBack: true),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Form(
                    key: controller.formKey.value,
                    autovalidateMode: controller.autoValidate.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleScreen(title: "Sign in"),
                        const SizedBox(height: 32),
                        _emailField(controller),
                        const SizedBox(height: 20),
                        _passwordField(controller),
                        const SizedBox(height: 20),
                        _continueButton(context, controller),
                        const SizedBox(height: 20),
                        _authPrompt(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailField(SignInController signInController) {
    return CustomTextFormField(
      title: "Email Address",
      controller: signInController.emailController,
      validator: FormValidator.validateEmail,
      prefixIcon: Icons.email_rounded,
    );
  }

  Widget _passwordField(SignInController signInController) {
    return CustomTextFormField(
      title: 'Password',
      controller: signInController.passwordController,
      textInputAction: TextInputAction.done,
      obscureText: !signInController.isPasswordVisible.value,
      prefixIcon: Icons.lock,
      validator: FormValidator.validatePassword,
      suffixIcon: IconButton(
        icon: Icon(
          !signInController.isPasswordVisible.value
              ? Icons.visibility_off
              : Icons.visibility,
        ),
        onPressed: signInController.togglePasswordVisibility,
      ),
    );
  }

  Widget _continueButton(
    BuildContext context,
    SignInController signInController,
  ) {
    return BasicAppButton(
      onPressed: () {
        if (signInController.validator()) {
          signInController.signIn(
            LoginUserRequest(
              email: signInController.emailController.text,
              password: signInController.passwordController.text,
            ),
          );
        }
      },
      title: "Continue",
    );
  }

  Widget _authPrompt(BuildContext context) {
    return AuthPrompt(
      promptText: "Don't have an Account? ",
      actionText: "Create One",
      onTap: () {
        Get.toNamed(AppPages.signUp);
      },
    );
  }
}

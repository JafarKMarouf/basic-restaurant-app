part of '../index.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SignUpController>(
      builder: (controller) => ModalProgressHUD(
        inAsyncCall: controller.isLoading.value,
        color: AppColors.primary,
        opacity: .1,
        child: Scaffold(
          appBar: BasicAppbar(),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23),
                  child: Form(
                    key: controller.formKey.value,
                    autovalidateMode: controller.autoValidate.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleScreen(title: "Create Account"),
                        const SizedBox(height: 32),
                        _firstNameField(controller),
                        const SizedBox(height: 20),
                        _lastNameField(controller),
                        const SizedBox(height: 20),
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

  Widget _firstNameField(SignUpController signupController) {
    return CustomTextFormField(
      title: "Firstname",
      prefixIcon: Icons.person,
      controller: signupController.firstNameController,
      validator: (value) => FormValidator.validateNotEmpty(value, 'First Name'),
    );
  }

  Widget _lastNameField(SignUpController signupController) {
    return CustomTextFormField(
      title: "Lastname",
      prefixIcon: Icons.people,
      controller: signupController.lastNameController,
      validator: (value) => FormValidator.validateNotEmpty(value, 'Last Name'),
    );
  }

  Widget _emailField(SignUpController signupController) {
    return CustomTextFormField(
      title: "Email Address",
      prefixIcon: Icons.email_rounded,
      controller: signupController.emailController,
      validator: FormValidator.validateEmail,
    );
  }

  Widget _passwordField(SignUpController signupController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          title: "Password",
          prefixIcon: Icons.lock,
          obscureText: !signupController.isPasswordVisible.value,
          controller: signupController.passwordController,
          validator: FormValidator.validatePassword,
          textInputAction: TextInputAction.done,
          suffixIcon: IconButton(
            icon: Icon(
              !signupController.isPasswordVisible.value
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
            onPressed: signupController.togglePasswordVisibility,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _continueButton(
    BuildContext context,
    SignUpController signupController,
  ) {
    return BasicAppButton(
      onPressed: () {
        if (signupController.validator()) {
          signupController.signUp(
            StoreUserRequest(
              firstName: signupController.firstNameController.text,
              lastName: signupController.lastNameController.text,
              email: signupController.emailController.text,
              password: signupController.passwordController.text,
            ),
          );
        }
      },
      title: "Continue",
    );
  }

  Widget _authPrompt(BuildContext context) {
    return AuthPrompt(
      promptText: "Do you have an Account? ",
      actionText: "Sign in",
      onTap: () => AppNavigator.pushReplacementAndRemove(const SignInView()),
    );
  }
}

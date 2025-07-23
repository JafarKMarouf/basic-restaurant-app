part of '../index.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleScreen(title: "Sign in"),
                  const SizedBox(height: 32),
                  _emailField(),
                  const SizedBox(height: 20),
                  _passwordField(),
                  const SizedBox(height: 20),
                  _continueButton(context),
                  const SizedBox(height: 20),
                  _authPrompt(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _emailField() {
    return CustomTextFormField(
      title: "Email Address",
      prefixIcon: Icons.email_rounded,
    );
  }

  Widget _passwordField() {
    return CustomTextFormField(
      title: 'Password',
      textInputAction: TextInputAction.done,
      obscureText: true,
      prefixIcon: Icons.lock,
      suffixIcon: IconButton(
        icon: const Icon(Icons.visibility_off),
        onPressed: () {},
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(onPressed: () {}, title: "Continue");
  }

  Widget _authPrompt(BuildContext context) {
    return AuthPrompt(
      promptText: "Don't have an Account? ",
      actionText: "Create One",
      onTap: () {
        AppNavigator.push(const RegisterView());
      },
    );
  }
}

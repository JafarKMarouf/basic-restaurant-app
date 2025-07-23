part of '../index.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleScreen(title: "Create Account"),
                      const SizedBox(height: 32),
                      _firstNameField(),
                      const SizedBox(height: 20),
                      _lastNameField(),
                      const SizedBox(height: 20),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _firstNameField() {
    return CustomTextFormField(
      title: "Firstname",
      prefixIcon: Icons.person,
      validator: (value) {
        return null;
      },
    );
  }

  Widget _lastNameField() {
    return CustomTextFormField(
      title: "Lastname",
      prefixIcon: Icons.people,
      validator: (value) {
        return null;
      },
    );
  }

  Widget _emailField() {
    return CustomTextFormField(
      title: "Email Address",
      prefixIcon: Icons.email_rounded,
      validator: (value) {
        return null;
      },
    );
  }

  Widget _passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          title: "Password",
          prefixIcon: Icons.lock,
          obscureText: true,
          textInputAction: TextInputAction.done,
          validator: (value) {
            return null;
          },
          onChanged: (value) {},
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility_off),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(onPressed: () {}, title: "Continue");
  }

  Widget _authPrompt(BuildContext context) {
    return AuthPrompt(
      promptText: "Do you have an Account? ",
      actionText: "Sign in",
      onTap: () => AppNavigator.pushReplacementAndRemove(const LoginView()),
    );
  }
}

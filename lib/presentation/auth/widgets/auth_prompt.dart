part of '../index.dart';

class AuthPrompt extends StatelessWidget {
  final String promptText;
  final String actionText;
  final VoidCallback onTap;

  const AuthPrompt({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(promptText),
        GestureDetector(
          onTap: onTap,
          child: Text(actionText, style: AppStyles.styleBold16(context)),
        ),
      ],
    );
  }
}

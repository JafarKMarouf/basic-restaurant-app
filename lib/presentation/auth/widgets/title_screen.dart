part of '../index.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppStyles.styleBold32(context));
  }
}

part of '../../index.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Widget? content;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  const BasicAppButton({
    this.onPressed,
    this.title = '',
    this.height,
    this.width,
    this.content,
    this.textStyle,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primary,
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 50,
        ),
      ),
      child:
          content ??
          Text(
            title,
            style:
                textStyle ??
                AppStyles.styleBold16(context).copyWith(color: Colors.white),
          ),
    );
  }
}

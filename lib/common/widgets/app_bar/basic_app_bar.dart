part of '../../index.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;
  final double? height;
  final EdgeInsetsGeometry? actionsPadding;

  const BasicAppbar({
    this.title,
    this.hideBack = false,
    this.action,
    this.backgroundColor,
    this.height,
    this.actionsPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final boxDecorationTheme = Theme.of(
      context,
    ).extension<BoxDecorationTheme>();

    return AppBar(
      actionsPadding: actionsPadding ?? EdgeInsets.zero,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 80,
      title: title ?? const Text(''),
      titleSpacing: 0,
      actions: [action ?? Container()],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 40,
                width: 40,
                decoration: boxDecorationTheme?.card.copyWith(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppImages.vectorsArrowLeft,
                    height: 16,
                    width: 16,
                  ),
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80);
}

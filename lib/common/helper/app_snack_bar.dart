part of '../index.dart';

class AppSnackBar {
  static void show({
    required String title,
    required String message,
    Color backgroundColor = Colors.black87,
    IconData icon = Icons.info_outline,
    Color iconColor = Colors.white,
    Color textColor = Colors.white,
    SnackPosition position = SnackPosition.BOTTOM,
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      backgroundColor: backgroundColor,
      colorText: textColor,
      icon: Icon(icon, color: iconColor),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: duration,
      isDismissible: true,
    );
  }
}

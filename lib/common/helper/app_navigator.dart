part of '../index.dart';

class AppNavigator {
  static void push(Widget page) {
    Get.to(
      page,
      curve: AppConstant.kCurves,
      transition: AppConstant.kTransition,
    );
  }

  static void pushReplacement(Widget page) {
    Get.off(
      page,
      curve: AppConstant.kCurves,
      transition: AppConstant.kTransition,
    );
  }

  static void pushReplacementAndRemove(Widget page) {
    Get.offAll(
      page,
      curve: AppConstant.kCurves,
      transition: AppConstant.kTransition,
    );
  }

  static void pop() {
    Get.back();
  }
}

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/utils/uikits.dart';

class Toast {
  static void showToast(String msg, {bool hasNavigationBar = false, bool isDark = false}) {
    BotToast.showText(
      text: msg,
      onlyOne: true,
      textStyle: TextStyle(
        fontSize: 15,
        color: isDark ? const Color(0xffffffff) : const Color(0xffffffff),
      ),
      contentColor: isDark ? Colors.black87 : Colors.black87,
      align: Alignment.center,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(5)),
    );
  }

  static CancelFunc showLoading({
    String loadingMessage = '正在加载',
    bool isCancelable = false,
    bool isDark = true,
  }) {
    return BotToast.showCustomLoading(
      backgroundColor: Colors.transparent,
      backButtonBehavior: isCancelable ? BackButtonBehavior.close : null,
      clickClose: isCancelable,
      align: Alignment.center,
      toastBuilder: (cancelFunc) {
        return Container(
          width: 150,
          height: 120,
          decoration: UIkit.getDecoration(color: isDark ? Colors.black87 : Colors.white, allRadius: 5),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  backgroundColor: isDark ? Color(0xff000000) : Color(0xff000000),
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFffffff)),
                ),
              ),
              SizedBox(height: 20),
              Text(
                loadingMessage,
                style: TextStyle(color: isDark ? Colors.white : Colors.black, fontSize: 15),
              )
            ],
          ),
        );
      },
    );
  }
}

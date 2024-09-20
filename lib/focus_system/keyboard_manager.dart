import 'dart:html';

class KeyboardManager {
  static void init() {
    print('KeyboardManager init in dart');
    window.onLoad.listen((event) {
      print('onLoad was called');
      document.querySelector('.focusable')?.focus();
    });
  }
}

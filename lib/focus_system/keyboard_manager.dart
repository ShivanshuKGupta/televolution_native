import 'dart:html';

class KeyboardManager {
  static void init() {
    window.onKeyDown.listen((event) {
      switch (event.key) {
        case 'ArrowUp':
          break;
        case 'ArrowDown':
          break;
        case 'ArrowLeft':
          break;
        case 'ArrowRight':
          break;
        case 'Backspace':
          window.history.back();
          break;
        default:
      }
    });
  }
}

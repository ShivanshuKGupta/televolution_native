import 'dart:html';

class KeyboardManager {
  static void init() {
    print('KeyboardManager init');
    window.onKeyDown.listen((event) {
      print(event.key);
      if (document.activeElement == null) {
        print('focusable is null');
        document.querySelector('.focusable')?.focus();
        return;
      }
      final focusableElements = document.querySelectorAll('.focusable');
      final currentIndex = document.activeElement == null
          ? 0
          : [...focusableElements].indexOf(document.activeElement!);

      switch (event.key) {
        case 'ArrowDown':
        case 'ArrowRight':
          final nextIndex = (currentIndex + 1) % focusableElements.length;
          focusableElements[nextIndex].focus();
          break;

        case 'ArrowUp':
        case 'ArrowLeft':
          final prevIndex = (currentIndex - 1 + focusableElements.length) %
              focusableElements.length;
          focusableElements[prevIndex].focus();
          break;

        case 'Backspace':
          window.history.back();
          break;
      }
    });

    window.onLoad.listen((event) {
      print('onLoad was called');
      document.querySelector('.focusable')?.focus();
    });
  }
}

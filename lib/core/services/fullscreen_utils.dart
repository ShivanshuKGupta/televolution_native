import 'package:web/web.dart';

class FullscreenUtils {
  static Future<void> enterFullscreen() async {
    document.documentElement!.requestFullscreen();
  }

  static void exitFullscreen() {
    document.exitFullscreen();
  }
}

import '../utils/log_extension.dart';

class FullscreenUtils {
  static Future<void> enterFullscreen() async {
    printLog('Fullscreen not supported on this platform');
  }

  static void exitFullscreen() {
    printLog('Fullscreen not supported on this platform');
  }
}

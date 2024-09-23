import '../utils/log_extension.dart';

class FullscreenUtils {
  static Future<void> enterFullscreen() async {
    printLog('Going Fullscreen');
    // document.documentElement!.requestFullscreen();
  }

  static void exitFullscreen() {
    // document.exitFullscreen();
    printLog('Exiting Fullscreen');
    // document.exitFullscreen();
  }
}

import 'dart:developer' as dev;


import 'string_extensions.dart';

/// Prints the message with the file path where the log was called
void printLog(dynamic message, {StackTrace? stackTrace}) {

  try {
    final frames = (stackTrace ?? StackTrace.current).toString().split('\n');
    if (frames.isEmpty) {
      dev.log(message.toString());
      return;
    }
    String? requiredFrame = frames.firstOrNull;
    if (requiredFrame == null) {
      dev.log(message.toString());
      return;
    }

    for (int i = 1; i < frames.length; i++) {
      final frame = frames[i];
      if (!(frame.contains('printLog') || frame.contains('log_extension'))) {
        requiredFrame = frame;
        break;
      }
    }

    requiredFrame = requiredFrame!.split('/').sublist(2).join('/');
    final firstSpaceIndex = requiredFrame.indexOf(' ');
    requiredFrame =
        requiredFrame.replaceRange(firstSpaceIndex, firstSpaceIndex + 1, ':');
    requiredFrame = requiredFrame.removeAllWhitespace;
    dev.log('$message | $requiredFrame');
  } catch (e) {
    dev.log(message.toString());
  }
}

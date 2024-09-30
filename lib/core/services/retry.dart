import 'dart:math' as math;

/// Wrapper for retrying a function that returns a Future.
/// It uses exponential backoff to retry the function.
Future<T> retry<T>(
  Future<T> Function() fn, {
  /// Number of retries. -1 means infinite retries.
  int retries = -1,

  /// Maximum delay between retries in seconds.
  int maxDelay = 5,
}) async {
  var count = 0;
  while (true) {
    try {
      return await fn();
    } catch (e) {
      if (retries != -1 && count >= retries) {
        rethrow;
      }
      count++;
      final delay =
          math.min(math.Random().nextInt(math.pow(2, count).toInt()), maxDelay);
      await Future.delayed(Duration(seconds: delay));
    }
  }
}

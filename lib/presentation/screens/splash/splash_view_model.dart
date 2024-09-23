import 'package:jaspr_riverpod/jaspr_riverpod.dart';
class SplashViewModel extends StateNotifier {
  SplashViewModel() : super('');

  void init() {
    // Add your initialization logic here.
  }

  final splashViewModelProvider = StateNotifierProvider((ref) => SplashViewModel());
}
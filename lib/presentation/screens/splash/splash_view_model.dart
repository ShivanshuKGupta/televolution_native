import 'package:jaspr_riverpod/jaspr_riverpod.dart';

class SplashViewModel extends StateNotifier<String> {
  SplashViewModel() : super('');

  void init() {
    // Add your initialization logic here.
  }
}

// Define a provider for the SplashViewModel
final splashViewModelProvider =
    StateNotifierProvider<SplashViewModel, String>((ref) {
  return SplashViewModel();
});

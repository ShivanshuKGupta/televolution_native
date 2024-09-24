import 'package:jaspr_riverpod/jaspr_riverpod.dart';
class SplashViewModel extends StateNotifier<String> {
  SplashViewModel() : super('Welcome to the Stateroom!');


  void init() {
    // Add your initialization logic here.
  }

  final splashViewModelProvider = StateNotifierProvider((ref) => SplashViewModel());
}
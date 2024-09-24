import 'package:jaspr_riverpod/jaspr_riverpod.dart';

import '../../../data/models/passenger_model.dart';

class SplashViewModel extends StateNotifier<String> {
  SplashViewModel() : super('');

  void init() {
    // Add your initialization logic here.
  }

  List<Passenger> fetchPassengers() {
    // Add your fetch logic here.
    return [];
  }
}

// Define a provider for the SplashViewModel
final splashViewModelProvider =
    StateNotifierProvider<SplashViewModel, String>((ref) {
  return SplashViewModel();
});

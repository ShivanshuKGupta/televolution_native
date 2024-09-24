import 'package:jaspr_riverpod/jaspr_riverpod.dart';

import '../../../appwrite/appwrite.dart';
import '../../../appwrite/realtime_stream.dart';
import '../../../data/models/passenger_model.dart';

class SplashViewModel extends StateNotifier<String> {
  SplashViewModel() : super('');

  void init() {
    // Add your initialization logic here.
  }

  ModelStream<Passenger> passengerStream = ModelStream(
    databaseId: AppwriteClient.dbId,
    collectionId: AppwriteClient.passenger,
    convert: Passenger.fromJson,
  );
}

// Define a provider for the SplashViewModel
final splashViewModelProvider =
    StateNotifierProvider<SplashViewModel, String>((ref) {
  return SplashViewModel();
});

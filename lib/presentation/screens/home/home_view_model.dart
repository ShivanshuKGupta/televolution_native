import 'package:jaspr_riverpod/jaspr_riverpod.dart';

import '../../../appwrite/appwrite.dart';
import '../../../appwrite/model_stream.dart';
import '../../../data/models/modules_activation.dart';

class HomeViewModel extends StateNotifier<String> {
  HomeViewModel() : super('');
  final modelStream = ModelStream(
      databaseId: AppwriteClient.dbId,
      collectionId: AppwriteClient.moduleActivation,
      convert: ModulesActivationModel.fromJson);
}

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, String>((ref) {
  return HomeViewModel();
});
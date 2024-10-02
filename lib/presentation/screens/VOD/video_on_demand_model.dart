import 'dart:math' show sqrt;
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

import '../../../data/models/movie/movie.dart';

class VideoOnDemandModel extends StateNotifier<String> {
  VideoOnDemandModel() : super('');

  void init() {
    // Add your initialization logic here.
  }
  final numColumns = sqrt(Movie.allMovies.length).ceil();
}

final videoOnDemandModelProvider =
    StateNotifierProvider<VideoOnDemandModel, String>((ref) {
  return VideoOnDemandModel();
});

import 'dart:math' show sqrt;

import 'package:jaspr/jaspr.dart';

import '../data/models/movie/movie.dart';

class VideoOnDemand extends StatelessComponent {
  const VideoOnDemand({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final numColumns = sqrt(Movie.allMovies.length).ceil();

    yield div([
      div(
        [
          ...Movie.allMovies.map((movie) {
            return div([
              div(
                [
                  h2([text(movie.title)],
                      classes: 'text-white text-lg font-bold'),
                ],
                classes:
                    'absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center',
              ),
            ],
                classes:
                    'relative rounded-lg overflow-hidden bg-cover bg-center h-64',
                styles: Styles.background(
                  image: ImageStyle.url(
                    movie.image,
                  ),
                ));
          }),
        ],
      ),
    ],
        classes:
            'grid grid-cols-1 sm:grid-cols-2 md:grid-cols-$numColumns gap-4 justify-center');
  }
}

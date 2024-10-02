import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../../../app/routes.dart';
import '../../../core/utils/focus_component.dart';
import '../../../data/models/movie/movie.dart';
import 'video_on_demand_model.dart';

class VideoOnDemand extends StatelessComponent {
  const VideoOnDemand({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final videoOnDemandModel = VideoOnDemandModel();

    yield div(
      [
        ...Movie.allMovies.map(
          (movie) {
            return FocusComponent(
              children: [
                div(
                  [
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
                      'relative rounded-40 overflow-hidden bg-cover bg-center h-64',
                  styles: Styles.combine(
                    [
                      const Styles.box(
                        radius: BorderRadius.circular(Unit.pixels(20)),
                      ),
                      Styles.background(
                        image: ImageStyle.url(movie.image),
                      ),
                    ],
                  ),
                ),
              ],
              onTap: () {
                Router.of(context).push(
                  AppRoutes.hls,
                  extra: movie.streamUrl,
                );
              },
            );
          },
        ),
      ],
      styles: Styles.grid(
          gap: const GridGap.all(Unit.pixels(2)),
          template: GridTemplate(
              columns: GridTracks([
            for (var i = 0; i < videoOnDemandModel.numColumns; i++)
              const GridTrack(TrackSize.fr(1)),
          ]))),
    );
  }
}

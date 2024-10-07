import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../../../app/routes.dart';
import '../../../core/utils/focus_component.dart';
import '../../../data/models/movie/movie.dart';

class VideoOnDemand extends StatefulComponent {
  const VideoOnDemand({super.key});
  @override
  State<StatefulComponent> createState() => VideoOnDemandState();
}

class VideoOnDemandState extends State<VideoOnDemand> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    final int numColumns = 7;

    yield div(
      [
        raw('''
          <style>
            .focus-zoom {
              transition: transform 0.3s ease-in-out;
            }
            .focus-zoom:focus-within,
            .focus-zoom:hover {
              transform: scale(1.1);
            }
            .focus-zoom:focus-within h2 {
              font-size: 20px !important; 
              transition: font-size 0.3s ease-in-out;
          </style>
        '''),
        ...Movie.allMovies.map(
          (movie) {
            return div(
              [
                FocusComponent(
                  children: [
                    div(
                      [
                        div(
                          [
                            h2([text(movie.title)],
                                classes: 'text-white text-sm font-bold'),
                          ],
                          classes:
                              'absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center',
                        ),
                      ],
                      styles: Styles.background(
                        image: ImageStyle.url(movie.image),
                        size: BackgroundSize.cover,
                      ),
                      classes:
                          'relative rounded-40 overflow-hidden bg-center h-40 w-45 rounded-[20px]',
                    ),
                  ],
                  classes: 'duration-200 ease-in-out mr-2',
                  onTap: () {
                    Router.of(context).push(
                      AppRoutes.hls,
                      extra: movie.streamUrl,
                    );
                  },
                ),
              ],
              classes:
                  'focus-zoom mr-2 mb-4', // Adding focus-zoom class for zoom effect
            );
          },
        ),
      ],
      styles: Styles.grid(
        template: GridTemplate(
            columns: GridTracks(
              [
                for (var i = 0;
                    i < numColumns;
                    i++) // Set to a fixed number of columns
                  const GridTrack(TrackSize.fr(1)),
              ],
            ),
            areas: GridAreas(
              [
                for (var i = 0; i < Movie.allMovies.length; i++) 'movie$i',
              ],
            )),
      ),
      classes:
          'min-h-screen p-20 content-center justify-between',
    );
  }
}

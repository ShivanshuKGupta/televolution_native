import 'dart:js_interop';

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_material/jaspr_material.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:web/web.dart';

import '../../../app/routes.dart';
import '../../../components/clock.dart';
import '../../../core/utils/datetime_extensions.dart';
import '../../../core/utils/focus_component.dart';
import '../../../data/models/modules_activation.dart';
// import '../../../material_icons/icon.dart';
// import '../../../material_icons/icons.dart';
import 'home_view_model.dart';

class HomeScreen extends StatefulComponent {
  const HomeScreen({super.key});

  @override
  State<StatefulComponent> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final homeViewModel = HomeViewModel();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield video(
      [],
      controls: false,
      autoplay: true,
      loop: true,
      muted: true,
      preload: Preload.auto,
      src: 'videos/H264HD1080.mp4',
      styles: const Styles.combine(
        [
          Styles.box(
            width: Unit.percent(100),
            height: Unit.percent(100),
            position: Position.absolute(
              top: Unit.zero,
              left: Unit.zero,
            ),
          ),
          Styles.raw({
            'object-fit': 'cover',
            'z-index': '-9',
          })
        ],
      ),
    );

    yield div(
      [
        div(
          [
            img(
              src: 'https://mytvpocroyal.com/web/assets/assets/images/logo.png',
              width: 150,
              styles: const Styles.raw({'filter': 'brightness(0) invert(1)'}),
            ),
            ClockComponent(builder: (context, dateTime) {
              return div(
                [
                  div([text(dateTime.time)], classes: 'text-3xl font-bold'),
                  div([text(dateTime.dayString)], classes: 'text-l font-bold'),
                ],
                classes:
                    'text-white text-center flex flex-col justify-center h-full',
              );
            })
          ],
          classes:
              'bg-black bg-opacity-50 text-white p-4 flex flex-row justify-between',
        ),
        StreamBuilder(
          stream: homeViewModel.modelStream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<ModulesActivationModel> data = snapshot.data!;
              return [
                div(
                  [
                    for (final item in data)
                      FocusComponent(
                        children: [
                          if (item.$id == 'account_information') const Icon(Icons.person),
                          if (item.$id == 'live_tv') const Icon(Icons.tv),
                          if (item.$id == 'video_on_demand') const Icon(Icons.ondemandVideo),
                          if (item.$id == 'my_photos') const Icon(Icons.photoLibrary),
                          if (item.$id == 'itinerary') const Icon(Icons.roomService),
                          if (item.$id == 'explore') const Icon(Icons.star),
                          if (item.$id == 'room_controls') const Icon(Icons.home),
                          if (item.$id == 'guest_relations') const Icon(Icons.info),

                          text(item.title),
                        ],
                        borderRadius: const BorderRadius.circular(
                          Unit.pixels(100),
                        ),
                        onTap: () {
                          console.log('Tapped on ${item.title}'.toJS);
                          Router.of(context).push(AppRoutes.vod);
                        },
                        classes:
                            'pt-4 pb-4 flex flex-col items-center whitespace-nowrap',
                      ),
                  ],
                  classes:
                      'grid grid-cols-8 gap-2 p-2 bg-black bg-opacity-50 text-white rounded-full',
                )
              ];
            } else if (snapshot.hasError) {
              return [text('Error: ${snapshot.error}')];
            }
            return [text('Loading...')];
          },
        ),
      ],
      classes: 'flex flex-col justify-between h-screen',
    );
  }
}

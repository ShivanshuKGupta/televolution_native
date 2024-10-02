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
import '../../widgets/common_divider.dart';
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
      src: 'https://mytvpocroyal.com/uploads/H264HD1080.mp4',
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
            div([
              img(
                src:
                    'https://mytvpocroyal.com/web/assets/assets/images/logo.png',
                width: 150,
                styles: const Styles.raw({'filter': 'brightness(0) invert(1)'}),
              ),
            ]),
            div(
              [
                const Icon(Icons.message),
                commonDivider(),
                const Icon(Icons.security),
                commonDivider(),
                const Icon(Icons.notifications),
                commonDivider(),
                const Icon(Icons.settings),
                commonDivider(),
                const Icon(Icons.powerSettingsNew),
                commonDivider(),
                ClockComponent(
                  builder: (context, dateTime) {
                    return div(
                      [
                        div([text(dateTime.time)], classes: 'text-3xl '),
                        div([text(dateTime.dayString)], classes: 'text-l '),
                      ],
                      classes:
                          'text-white text-center flex flex-col justify-center h-full',
                    );
                  },
                )
              ],
              classes: 'flex flex-row justify-center items-center',
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
        div([
          img(
            src: 'https://mytvpocroyal.com/uploads/ship.png',
            width: 750,
          ),
        ]),
        StreamBuilder(
          stream: homeViewModel.modelStream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<ModulesActivationModel> data = snapshot.data!;
              return [
                div(
                  [
                    for (final item in data)
                      if (item.enabled)
                        FocusComponent(
                          children: [
                            Icon(switch (item.$id) {
                              'account_information' => Icons.person,
                              'live_tv' => Icons.tv,
                              'video_on_demand' => Icons.ondemandVideo,
                              'my_photos' => Icons.photoLibrary,
                              'itinerary' => Icons.roomService,
                              'explore' => Icons.star,
                              'room_controls' => Icons.home,
                              'guest_relations' => Icons.info,
                              _ => Icons.error,
                            }),
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
                      'grid grid-cols-8 gap-2 p-2 bg-black bg-opacity-50 text-white rounded-t-3xl',
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

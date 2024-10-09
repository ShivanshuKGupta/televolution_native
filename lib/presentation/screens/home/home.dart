import 'dart:js_interop';

import 'package:jaspr/jaspr.dart' hide Element;
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

  Element? get slideDiv => document.getElementById('slideDiv');
  bool get isSlideUp => slideDiv?.classList.contains('active') ?? false;

  void slideUp() {
    if (!isSlideUp) slideDiv?.classList.toggle('active');
  }

  void slideDown() {
    if (isSlideUp) slideDiv?.classList.toggle('active');
  }

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
        /// Appbar
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
                FocusComponent(
                  children: [
                    const Icon(Icons.mail, size: Unit.pixels(50)),
                  ],
                  onTap: () {},
                ),
                commonDivider(),
                FocusComponent(
                  children: [
                    const Icon(Icons.healthAndSafety, size: Unit.pixels(50)),
                  ],
                  onTap: () {},
                ),
                commonDivider(),
                FocusComponent(
                  children: [
                    div(
                      [
                        span(
                          [
                            text('TV ON THE GO'),
                          ],
                          classes: 'text-l mb-1 font-light',
                        ),
                        span(
                          [
                            img(
                              src: 'images/qrcode.png',
                              height: 60,
                              width: 60,
                            ),
                          ],
                        ),
                      ],
                      classes:
                          'flex flex-col justify-center items-center rounded-3xl p-3 bg-black bg-opacity-20',
                    ),
                  ],
                  onTap: () {},
                ),
                commonDivider(),
                div(
                  [
                    div(
                      [
                        span(
                          [
                            text('GANGWAY'),
                          ],
                          classes:
                              'bg-black bg-opacity-20 text-white p-2 w-[100px] rounded-tl-lg rounded-tr-lg text-center text-[15px] font-light',
                        ),
                        span(
                          [
                            text('DECK 5'),
                          ],
                          classes:
                              'bg-white text-black p-2 w-[100px] text-center text-xl rounded-bl-lg rounded-br-lg font-light',
                        ),
                      ],
                      classes: 'flex flex-col justify-center items-center',
                    ),
                    div(
                      [
                        span(
                          [
                            text('ALL BOARD'),
                          ],
                          classes:
                              'bg-black bg-opacity-20 text-white p-2 w-[100px] rounded-tl-lg rounded-tr-lg text-center text-[15px] font-light',
                        ),
                        span(
                          [
                            text('5:00 PM'),
                          ],
                          classes:
                              'bg-white text-black p-2 w-[100px] text-center text-xl rounded-bl-lg rounded-br-lg font-light',
                        )
                      ],
                      classes: 'flex flex-col justify-center items-center',
                    ),
                  ],
                  classes: 'flex flex-row justify-center items-center',
                ),
                commonDivider(),
                div(
                  [
                    div(
                      [
                        span(
                          [
                            span(
                              [
                                text(
                                  '76°',
                                ),
                              ],
                              classes: 'text-white text-5xl font-light',
                            ),
                            text('/24°C'),
                          ],
                        ),
                        span(
                          [
                            span(
                              [
                                const Icon(
                                  Icons.sunnySnowing,
                                  size: Unit.pixels(14),
                                  colour: Colors.black,
                                ),
                                text('6:30AM'),
                              ],
                              classes:
                                  'text-black mr-2 justify-center items-center bg-white p-2 rounded-3xl text-[12px] space-x-2 font-light',
                            ),
                            span(
                              [
                                const Icon(
                                  Icons.sunnySnowing,
                                  size: Unit.pixels(14),
                                  colour: Colors.white,
                                ),
                                text('8:40PM'),
                              ],
                              classes:
                                  'text-white mr-5 justify-center items-center bg-black p-2 rounded-3xl text-[12px] space-x-2 font-light',
                            ),
                          ],
                        ),
                      ],
                      classes: 'flex flex-col justify-center items-center',
                    ),
                    span(
                      [
                        const Icon(Icons.wbSunny,
                            colour: Colors.yellow, size: Unit.pixels(50)),
                        text('Sunny'),
                      ],
                      classes:
                          'flex flex-col justify-center items-center text-center text-[15px]',
                    ),
                  ],
                  classes: 'flex flex-row justify-center items-center',
                ),
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
          ],
          classes:
              'bg-black bg-opacity-50 text-white p-4 flex flex-row justify-between',
        ),

        /// Ship
        div(
          [
            img(
              src: 'https://mytvpocroyal.com/uploads/ship.png',
              width: 750,
            ),
          ],
          classes: 'flex-grow flex items-center justify-start',
        ),

        /// Bottom Navigation Menu
        StreamBuilder(
          stream: homeViewModel.modelStream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<ModulesActivationModel> data = snapshot.data!;
              return [
                raw('''
<style>
#slideDiv {
    position: fixed;
    bottom: -100px; /* Start off screen */
    left: 0;
    width: 100%;
    transition: bottom 0.5s ease;
}

/* When active, slide up the div */
#slideDiv.active {
    bottom: 0;
}
</style>
'''),
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
                              Unit.pixels(20),
                            ),
                            onTap: () {
                              console.log('Tapped on ${item.title}'.toJS);
                              if (item.$id == 'live_tv') {
                                Router.of(context).push(AppRoutes.liveTV);
                              } else if (item.$id == 'video_on_demand') {
                                Router.of(context).push(AppRoutes.vod);
                              } else {
                                Router.of(context).push(AppRoutes.vod);
                              }
                            },
                            classes:
                                'pt-4 pb-4 flex flex-col items-center whitespace-nowrap',
                          ),
                    ],
                    id: 'slideDiv',
                    classes:
                        'grid grid-cols-8 gap-2 p-2 bg-black bg-opacity-50 text-white rounded-t-3xl pb-4',
                    events: {
                      'focusin': (event) {
                        slideUp();
                      },
                      'focusout': (event) {
                        slideDown();
                      },
                    })
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

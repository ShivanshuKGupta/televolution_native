import 'package:jaspr/jaspr.dart';

import '../../../core/utils/focus_component.dart';

class LiveTv extends StatefulComponent {
  const LiveTv({super.key});
  @override
  State<StatefulComponent> createState() => LiveTvState();
}

class LiveTvState extends State<LiveTv> {
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
    yield div([
      div(
        [
          FocusComponent(
            classes: 'mb-2',
            children: [
              div(
                [
                  img(
                    src: 'images/images.png',
                    classes: 'rounded-lg p-1 text-sm size-20 mr-5',
                  ),
                  div(
                    [
                      div(
                        [
                          span([
                            text('HDMI 1'),
                          ]),
                          span([
                            text('HDMI 1'),
                          ]),
                        ],
                        classes: 'flex flex-col',
                      ),
                    ],
                    classes: 'flex flex-col justify-center items-start',
                  ),
                ],
                classes: 'flex',
              ),
            ],
          ),
          FocusComponent(
            classes: 'mb-2',
            children: [
              div(
                [
                  img(
                    src: 'images/images.png',
                    classes: 'rounded-lg p-1 text-sm size-20 mr-5',
                  ),
                  div(
                    [
                      div(
                        [
                          span([
                            text('Celebrity Entertaiment'),
                          ]),
                          span([
                            text('Celebrity Entertaiment'),
                          ]),
                        ],
                        classes: 'flex flex-col',
                      ),
                    ],
                    classes: 'flex flex-col justify-center items-start',
                  ),
                ],
                classes: 'flex',
              ),
            ],
          ),
          FocusComponent(
            classes: 'mb-2',
            children: [
              div(
                [
                  img(
                    src: 'images/images.png',
                    classes: 'rounded-lg p-1 text-sm size-20 mr-5',
                  ),
                  div(
                    [
                      div(
                        [
                          span([
                            text('Cruise Compass'),
                          ]),
                          span([
                            text('Stays up to date with the latest news'),
                          ]),
                        ],
                        classes: 'flex flex-col',
                      ),
                    ],
                    classes: 'flex flex-col justify-center items-start',
                  ),
                ],
                classes: 'flex',
              ),
            ],
          ),
          FocusComponent(
            classes: 'mb-2',
            children: [
              div(
                [
                  img(
                    src: 'images/images.png',
                    classes: 'rounded-lg p-1 text-sm size-20 mr-5',
                  ),
                  div(
                    [
                      div(
                        [
                          span([
                            text('On The map'),
                          ]),
                          span([
                            text('Explore the ship and find your way around'),
                          ]),
                        ],
                        classes: 'flex flex-col',
                      ),
                    ],
                    classes: 'flex flex-col justify-center items-start',
                  ),
                ],
                classes: 'flex',
              ),
            ],
          ),
        ],
        classes: 'glass-effect bg-white p-4 rounded-lg w-full text-black shadow-xl ',
        styles: const Styles.raw(
          {
            'background-color': 'rgba(255, 255, 255, 0.2)',
            'backdrop-filter': 'blur(10px)',
            '-webkit-backdrop-filter': 'blur(10px)',
            'border': '1px solid rgba(255, 255, 255, 0.3)',
            'box-shadow': '0 4px 6px rgba(0, 0, 0, 0.1)',
            'border-radius': '15px',
          },
        ),
      ),
    ], classes: 'w-full h-full flex items-center justify-center p-4');
  }
}
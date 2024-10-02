import 'package:jaspr/jaspr.dart';

import '../../../components/clock.dart';
//import '../../widgets/bubbleBackground/bubble_animation.dart';
import 'menu.dart';
import 'splash_view_model.dart';

class SplashScreen extends StatefulComponent {
  const SplashScreen({super.key});

  @override
  State<StatefulComponent> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final splashViewModel = SplashViewModel();
  @override
  Iterable<Component> build(BuildContext context) sync* {
    // yield const BubbleAnimation();
   yield video(
      [],
      controls: false,
      autoplay: true,
      loop: true,
      muted: true,
      preload: Preload.auto,
      src: 'https://mytvpocroyal.com/uploads/CELAdds.mp4',
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
      // styles: const Styles.combine([
      //   Styles.box(
      //     height: Unit.percent(100),
      //     width: Unit.percent(100),
      //     position: Position.relative(),
      //     overflow: Overflow.hidden,
      //   ),
      //   Styles.background(
      //     color: Colors.black,
      //   ),
      // ]),
      classes: 'bg-black h-screen w-screen relative overflow-hidden',
    );

    yield section(
      [
        div([
          ClockComponent(builder: (context, time) {
            return h2(
              [text('${time.hour}:${time.minute.toString().padLeft(2, '0')}')],
              // styles: const Styles.combine([
              //   Styles.box(
              //       margin: EdgeInsets.zero,
              //       padding: EdgeInsets.only(top: Unit.pixels(0)),
              //       position: Position.absolute(
              //         top: Unit.pixels(10),
              //         right: Unit.pixels(10),
              //       )),
              //   Styles.text(fontSize: Unit.pixels(30)),
              // ]),
              classes: 'absolute top-[10px] right-[10px] text-[30px] m-0',
            );
          }),
          div([
            img(
              src: 'https://mytvpocroyal.com/web/assets/assets/images/logo.png',
              // width: 150,
              // styles:
              //     const Styles.raw({'filter': 'brightness(0) invert(1)'}),
              classes: 'w-[150px] invert brightness-[0]',
            ),
            h2(
              [text('Welcome to the Stateroom Landon Byron')],
              // styles: const Styles.combine([
              //   Styles.box(
              //     padding: EdgeInsets.only(top: Unit.pixels(20)),
              //     margin: EdgeInsets.zero,
              //   ),
              //   Styles.text(
              //     fontSize: Unit.pixels(30),
              //     fontWeight: FontWeight.normal,
              //   ),
              // ]),
              classes: 'text-white pt-[20px] m-0 text-[30px] font-normal',
            ),
            h2(
              [text('We Hope you enjoy excel')],
              // styles: const Styles.combine([
              //   Styles.box(
              //     margin: EdgeInsets.zero,
              //     padding: EdgeInsets.only(top: Unit.pixels(0)),
              //   ),
              //   Styles.text(
              //     fontSize: Unit.pixels(30),
              //     fontWeight: FontWeight.normal,
              //   ),
              // ]),
              classes: 'text-white pt-[0px] m-0 text-[30px] font-normal',
            ),
            h4(
              [text('Press any key to continue')],
              // styles: const Styles.combine([
              //   Styles.box(
              //     margin: EdgeInsets.only(top: Unit.pixels(20)),
              //   ),
              // ]),
              classes: 'mt-[20px]',
            ),
          ],
              // styles: const Styles.combine([
              //   Styles.box(
              //     position: Position.absolute(
              //       top: Unit.pixels(0),
              //       left: Unit.pixels(0),
              //       right: Unit.pixels(0),
              //       bottom: Unit.pixels(0),
              //     ),
              //     display: Display.flex,
              //   ),
              //   Styles.flexbox(
              //     direction: FlexDirection.column,
              //     justifyContent: JustifyContent.center,
              //     alignItems: AlignItems.center,
              //   ),
              //   Styles.raw({'pointer-events': 'none'})
              // ]),
              classes:
                  'absolute inset-0 flex flex-col justify-center items-center pointer-events-none'),
          div(
            [
              const Menu(),
            ],
            classes: 'pb-10 flex-wrap justify-center',
            // styles: const Styles.flexbox(
            //   wrap: FlexWrap.wrap,
            //   justifyContent: JustifyContent.center,
            // ),
          ),
        ],
            // styles: const Styles.combine([
            //   Styles.box(
            //     position: Position.absolute(
            //       top: Unit.pixels(0),
            //       left: Unit.pixels(0),
            //       right: Unit.pixels(0),
            //       bottom: Unit.pixels(0),
            //     ),
            //     display: Display.flex,
            //   ),
            //   Styles.flexbox(
            //     direction: FlexDirection.column,
            //     justifyContent: JustifyContent.spaceBetween,
            //     wrap: FlexWrap.wrap,
            //   ),
            // ]),
            classes:
                'absolute inset-0 flex flex-col justify-between flex-wrap'),
      ],
      // styles: const Styles.combine(
      //   [
      //     Styles.text(
      //       color: Colors.white,
      //     ),
      //   ],
      // ),
      classes: 'text-white',
    );
  }
}

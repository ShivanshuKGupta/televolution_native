import 'package:jaspr/jaspr.dart';

import '../../../components/clock.dart';
import '../../../pages/bubble_animation.dart';
import 'menu.dart';

class ScreensaverScreen extends StatelessComponent {
  const ScreensaverScreen({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield const BubbleAnimation();

    yield section(
      [
        div(
          [
            ClockComponent(builder: (context, time) {
              return h2(
                [
                  text('${time.hour}:${time.minute.toString().padLeft(2, '0')}')
                ],
                styles: const Styles.combine([
                  Styles.box(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.only(top: Unit.pixels(0)),
                      position: Position.absolute(
                        top: Unit.pixels(10),
                        right: Unit.pixels(10),
                      )),
                  Styles.text(fontSize: Unit.pixels(30)),
                ]),
              );
            }),
            div(
              [
                img(
                  src:
                      'https://mytvpocroyal.com/web/assets/assets/images/logo.png',
                  width: 150,
                  styles:
                      const Styles.raw({'filter': 'brightness(0) invert(1)'}),
                ),
                h2([text('Welcome to the Stateroom Landon Byron')],
                    styles: const Styles.combine([
                      Styles.box(
                        padding: EdgeInsets.only(top: Unit.pixels(20)),
                        margin: EdgeInsets.zero,
                      ),
                      Styles.text(
                        fontSize: Unit.pixels(30),
                        fontWeight: FontWeight.normal,
                      ),
                    ])),
                h2([text('We Hope you enjoy excel')],
                    styles: const Styles.combine([
                      Styles.box(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.only(top: Unit.pixels(0)),
                      ),
                      Styles.text(
                        fontSize: Unit.pixels(30),
                        fontWeight: FontWeight.normal,
                      ),
                    ])),
                h4([text('Press any key to continue')],
                    styles: const Styles.combine([
                      Styles.box(
                        margin: EdgeInsets.only(top: Unit.pixels(20)),
                      ),
                    ])),
              ],
              styles: const Styles.combine([
                Styles.box(
                  position: Position.absolute(
                    top: Unit.pixels(0),
                    left: Unit.pixels(0),
                    right: Unit.pixels(0),
                    bottom: Unit.pixels(0),
                  ),
                  display: Display.flex,
                ),
                Styles.flexbox(
                  direction: FlexDirection.column,
                  justifyContent: JustifyContent.center,
                  alignItems: AlignItems.center,
                ),
                Styles.raw({'pointer-events': 'none'})
              ]),
            ),
            div(
              [
                div([
                  text(
                    'Who\'s Watching?',
                  ),
                ],
                    styles: const Styles.text(
                        align: TextAlign.center,
                        color: Colors.white,
                        fontSize: Unit.pixels(35),
                        fontWeight: FontWeight.bold,
                        wordSpacing: Unit.pixels(1))),
                const Menu(),
              ],
            )
          ],
          styles: const Styles.combine([
            Styles.box(
              position: Position.absolute(
                top: Unit.pixels(0),
                left: Unit.pixels(0),
                right: Unit.pixels(0),
                bottom: Unit.pixels(0),
              ),
              display: Display.flex,
            ),
            Styles.flexbox(
              direction: FlexDirection.column,
              justifyContent: JustifyContent.spaceBetween,
            ),
          ]),
        ),
      ],
      styles: const Styles.combine([
        Styles.text(
          color: Colors.white,
        ),
      ]),
    );
  }
}

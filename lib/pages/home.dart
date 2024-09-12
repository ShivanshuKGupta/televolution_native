import 'package:jaspr/jaspr.dart';
import 'package:televolution_native/pages/bubble_animation.dart';

class ScreensaverScreen extends StatelessComponent {
  const ScreensaverScreen({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      [
        img(
          src: 'https://mytvpocroyal.com/web/assets/assets/images/logo.png',
          width: 80,
          styles: Styles.box(
            border: Border.all(
              BorderSide(color: Colors.white),
            ),
          ),
        ),
        h2([text('Welcome to the Stateroom Landon Byron')]),
        h2([text('We Hope you enjoy excel')]),
        h4([text('Press any key to continue')]),
        BubbleAnimation(),
      ],
      styles: Styles.combine([
        Styles.text(
          color: Colors.black,
        ),
      ]),
    );
  }
}

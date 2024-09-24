import 'dart:js_interop';
import 'dart:math';

import 'package:jaspr/jaspr.dart';
import 'package:web/web.dart';

import '../../../core/utils/focus_component.dart';
import 'splash_view_model.dart';

class Menu extends StatelessComponent {
  Menu({super.key});
  final splashViewModel = SplashViewModel();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield StreamBuilder(
      stream: splashViewModel.passengerStream.stream,
      builder: (context, snapshot) sync* {
        final passengers = snapshot.data;
        if (passengers == null) {
          yield text('Loading...');
          return;
        }

        yield div(
          [
            ...passengers.map(
              (passenger) {
                return Box(passenger.fName);
              },
            )
          ],
          styles: const Styles.combine(
            [
              Styles.flexbox(
                justifyContent: JustifyContent.center,
                alignItems: AlignItems.center,
                direction: FlexDirection.row,
              ),
            ],
          ),
        );
      },
    );
  }
}

Random random = Random();

class Box extends StatelessComponent {
  final String title;
  const Box(this.title, {super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    Unit commonUnit = const Unit.vh(10);

    yield FocusComponent(
      onTap: () {
        console.log('Box $title tapped'.toJS);
      },
      borderRadius: const BorderRadius.circular(
        Unit.pixels(20),
      ),
      child: div(
        [
          h1(
            [text(title)],
            styles: Styles.combine([
              Styles.background(
                  color: Color.rgb(
                    random.nextInt(255),
                    random.nextInt(255),
                    random.nextInt(255),
                  ),
                  size: BackgroundSize.sides(
                    commonUnit,
                    commonUnit,
                  )),
              Styles.text(
                align: TextAlign.center,
                lineHeight: commonUnit,
              ),
              Styles.box(
                width: commonUnit,
                height: commonUnit,
                radius: const BorderRadius.circular(
                  Unit.percent(50),
                ),
              ),
            ]),
          ),
          h3([text('This is box $title.')]),
        ],
        styles: const Styles.box(
          radius: BorderRadius.all(
            Radius.circular(
              Unit.pixels(20),
            ),
          ),
          padding: EdgeInsets.all(Unit.pixels(20)),
        ),
      ),
    );
  }
}

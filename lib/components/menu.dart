import 'dart:js_interop';
import 'dart:math';

import 'package:jaspr/jaspr.dart';
import 'package:web/web.dart';

import '../core/utils/focus_component.dart';

class Menu extends StatelessComponent {
  const Menu({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      [
        const Box('1'),
        const Box('2'),
        const Box('3'),
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
  }
}

Random random = Random();

class Box extends StatelessComponent {
  final String title;
  const Box(this.title, {super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield FocusComponent(
      onTap: () {
        console.log('Box $title tapped'.toJS);
      },
      borderRadius: const BorderRadius.circular(
        Unit.pixels(20),
      ),
      child: div(
        [
          div([
            div([
              h1([text(title)]),
            ],
                styles: const Styles.box(
                  radius: BorderRadius.all(
                    Radius.circular(
                      Unit.pixels(40),
                    ),
                  ),
                )),
          ],
              styles: Styles.background(
                color: Color.rgb(
                  random.nextInt(255),
                  random.nextInt(255),
                  random.nextInt(255),
                ),
              )),
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

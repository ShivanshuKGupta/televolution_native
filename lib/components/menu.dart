import 'package:jaspr/jaspr.dart';
import 'package:televolution_native/focus_system/focus_component.dart';

class Menu extends StatelessComponent {
  const Menu({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      [
        Box(1),
        Box(2),
        Box(3),
      ],
      styles: Styles.combine(
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

class Box extends StatelessComponent {
  final int title;
  const Box(this.title, {super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield FocusComponent(
        borderRadius: BorderRadius.circular(
          Unit.pixels(20),
        ),
        child: div(
          [
            h1([text('Box $title')]),
            p([text('This is box $title.')]),
          ],
        ));
  }
}

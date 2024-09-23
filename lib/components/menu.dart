import 'package:jaspr/jaspr.dart';
import '../core/utils/focus_component.dart';

class Menu extends StatelessComponent {
  const Menu({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      [
        const Box(1),
        const Box(2),
        const Box(3),
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

class Box extends StatelessComponent {
  final int title;
  const Box(this.title, {super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield FocusComponent(
      onTap: () {
        print('Box $title tapped');
      },
      borderRadius: const BorderRadius.circular(
        Unit.pixels(20),
      ),
      child: div(
        [
          h1([text('Box $title')]),
          p([text('This is box $title.')]),
        ],
      ),
    );
  }
}

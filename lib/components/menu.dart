import 'dart:html';

import 'package:jaspr/jaspr.dart';

class Menu extends StatefulComponent {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int focus = 0;

  @override
  void initState() {
    super.initState();
    document.addEventListener('keydown', (event) {
      if (event is! KeyboardEvent) return;
      switch (event.key) {
        case 'ArrowUp':
          print('Up arrow pressed');
          break;
        case 'ArrowDown':
          print('Down arrow pressed');
          break;
        case 'ArrowLeft':
          focus = (focus - 1 + 3) % 3;
          print('Left arrow pressed');
          break;
        case 'ArrowRight':
          focus = (focus + 1) % 3;
          print('Right arrow pressed');
          break;
      }
      setState(() {});
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      [
        Box(1, focus == 0),
        Box(2, focus == 1),
        Box(3, focus == 2),
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
  final bool focus;
  const Box(this.title, this.focus, {super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      [
        h1([text('Box $title')]),
        p([text('This is box $title.')]),
      ],
      styles: Styles.combine(
        [
          Styles.box(
            border: Border.all(
              BorderSide(
                color: focus ? Colors.blue : Colors.black,
                width: Unit.pixels(focus ? 5 : 2),
              ),
            ),
            radius: BorderRadius.circular(
              Unit.pixels(focus ? 10 : 5),
            ),
            padding: EdgeInsets.all(Unit.pixels(10)),
          ),
        ],
      ),
    );
  }
}

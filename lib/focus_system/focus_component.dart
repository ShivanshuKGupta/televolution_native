import 'package:jaspr/jaspr.dart';

class FocusComponent extends StatelessComponent {
  final Component child;
  const FocusComponent({
    required this.child,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      [child],
      styles: Styles.box(
        border: Border.all(
          BorderSide.dotted(
            color: Colors.blue,
            width: Unit.pixels(5),
          ),
        ),
      ),
    );
  }
}

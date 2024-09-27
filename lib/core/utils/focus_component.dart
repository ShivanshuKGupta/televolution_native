import 'package:jaspr/jaspr.dart';

class FocusComponent extends StatelessComponent {
  final Iterable<Component> children;
  final int tabIndex;
  final Color? focusedBackgroundColor;
  final Color focusedBorderColor;
  final int focusedBorderWidth;
  final BorderRadius borderRadius;
  final void Function() onTap;
  final String classes;

  const FocusComponent({
    super.key,
    required this.children,
    this.tabIndex = 0,
    this.focusedBackgroundColor,
    this.focusedBorderColor = Colors.white,
    this.focusedBorderWidth = 4,
    this.borderRadius = const BorderRadius.circular(Unit.pixels(20)),
    required this.onTap,
    this.classes = '',
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      events: {'click': (event) => onTap.call()},
      [
        raw('''
          <style>
            .focusable {
              outline: none;
              border: ${focusedBorderWidth}px solid transparent;
              border-radius: ${borderRadius.styles.values.first};
            }
            .focusable:focus { 
              ${focusedBackgroundColor != null ? "background-color: ${focusedBackgroundColor!.value};" : ""}
              border: ${focusedBorderWidth}px solid ${focusedBorderColor.value};
              border-radius: ${borderRadius.styles.values.first};
            }
          </style>
'''),
        ...children,
      ],
      // classes: 'focusable hover:shadow-xl tint-300 cursor-pointer $classes',
      classes:
          'focusable cursor-pointer font-bold hover:bg-opacity-20 hover:bg-white hover:shadow-xl active:bg-blue-700 active:scale-95 transition-all duration-200 ease-in-out $classes',
      attributes: {
        'tabindex': tabIndex.toString(),
        'z-index': '10',
      },
    );
  }
}

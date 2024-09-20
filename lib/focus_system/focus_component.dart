import 'package:jaspr/jaspr.dart';

class FocusComponent extends StatelessComponent {
  final Component child;
  final int tabIndex;
  final Color focusedBackgroundColor;
  final Color focusedBorderColor;
  final int focusedBorderWidth;
  final BorderRadius? borderRadius;
  final void Function() onTap;

  const FocusComponent({
    super.key,
    required this.child,
    this.tabIndex = 0,
    this.focusedBackgroundColor = Colors.transparent,
    this.focusedBorderColor = Colors.white,
    this.focusedBorderWidth = 4,
    this.borderRadius,
    required this.onTap,
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
              border-radius: ${borderRadius?.styles.values.first ?? '0px'};
            }
            .focusable:focus { 
              background-color: ${focusedBackgroundColor.value}; 
              border: ${focusedBorderWidth}px solid ${focusedBorderColor.value};
            }
          </style>
'''),
        child,
      ],
      classes: 'focusable',
      attributes: {
        'tabindex': tabIndex.toString(),
        'z-index': "10",
      },
    );
  }
}

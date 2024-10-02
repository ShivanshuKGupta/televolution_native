  import 'package:jaspr/jaspr.dart';

Component commonDivider() {
    return div(
            [],
            classes:
                'w-px bg-white mx-4', // Styling the divider to be a thin vertical line
            styles: const Styles.raw({
              'height':
                  '100%', // Making sure the height covers the full parent height
            }),
          );
  }

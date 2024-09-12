import 'package:jaspr/jaspr.dart';
import 'package:televolution_native/appwrite.dart';

import '../components/counter.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section([
      img(src: 'images/logo.png', width: 80),
      h1([text('Welcome')]),
      p([text('You successfully create a new Jaspr site.')]),
      button([text('Click me')], onClick: () {
        Appwrite.getDoc();
      }),
      div(styles: Styles.box(height: 100.px), []),
      const Counter(),
    ]);
  }
}

import 'dart:math';

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../../../app/routes.dart';
import '../../../core/utils/focus_component.dart';
import 'splash_view_model.dart';

class Menu extends StatefulComponent {
  const Menu({super.key});

  @override
  State<StatefulComponent> createState() => MenuState();
}

class MenuState extends State<Menu> {
  final splashViewModel = SplashViewModel();

  @override
  void dispose() {
    splashViewModel.passengerStream.dispose();
    super.dispose();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield StreamBuilder(
      stream: splashViewModel.passengerStream.stream,
      builder: (context, snapshot) sync* {
        final passengers = snapshot.data;
        if (passengers == null) {
          yield img(
            src: 'images/spinner.gif',
            // styles: const Styles.combine(
            //   [
            //     Styles.box(
            //       width: Unit.vw(4),
            //       height: Unit.vw(4),
            //       position: Position.absolute(
            //         left: Unit.percent(50),
            //         bottom: Unit.pixels(20),
            //       ),
            //     ),
            //   ],
            // ),
            classes:
                'align-center w-[4vw] h-[4vw] absolute left-1/2 bottom-[20px]',
          );
          return;
        }
        yield div(
          [
            div(
              [
                text(
                  'Who\'s Watching?',
                ),
              ],
              // styles: const Styles.text(
              //   align: TextAlign.center,
              //   color: Colors.white,
              //   fontSize: Unit.pixels(35),
              //   fontWeight: FontWeight.bold,
              //   wordSpacing: Unit.pixels(1),
              // ),
              classes:
                  'pb-3 text-center text-white text-[35px] font-bold tracking-[1px]',
            ),
            div([
              ...passengers.map(
                (passenger) {
                  return Box(passenger.fName);
                },
              )
            ],
                // styles: const Styles.combine(
                //   [
                //     Styles.flexbox(
                //       justifyContent: JustifyContent.center,
                //       alignItems: AlignItems.center,
                //       direction: FlexDirection.row,
                //       wrap: FlexWrap.wrap,
                //     ),
                //   ],
                // ),
                classes: 'flex justify-center items-center flex-row flex-wrap')
          ],
          classes: 'rounded-[20px]',
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

    yield FocusComponent(
      onTap: () {
        Router.of(context).push(AppRoutes.home);
      },
      borderRadius: const BorderRadius.circular(
        Unit.pixels(20),
      ),
      children: [
        div(
          [
            h1(
              [text('${title[0]}${title[1]}'.toUpperCase())],
              styles: Styles.combine([
                Styles.background(
                    color: Color.rgb(
                  random.nextInt(255),
                  random.nextInt(255),
                  random.nextInt(255),
                ))
              ]),
              // styles: Styles.combine(
              //   [
              //     Styles.background(
              //         color: Color.rgb(
              //           random.nextInt(255),
              //           random.nextInt(255),
              //           random.nextInt(255),
              //         ),
              //         size: BackgroundSize.sides(
              //           commonUnit,
              //           commonUnit,
              //         )),
              //     Styles.text(
              //         align: TextAlign.center,
              //         lineHeight: commonUnit,
              //         fontSize: const Unit.pixels(30)),
              //     Styles.box(
              //       width: commonUnit,
              //       height: commonUnit,
              //       radius: const BorderRadius.circular(
              //         Unit.percent(50),
              //       ),
              //     ),
              //   ],
              // ),
              classes:
                  'border-4 border-white w-[8vh] h-[8vh] bg-random text-center leading-[8vh] text-[30px] rounded-full',
            ),
            h3([text(title)]),
          ],
          // styles: const Styles.combine(
          //   [
          //     Styles.box(
          //       radius: BorderRadius.all(
          //         Radius.circular(
          //           Unit.pixels(20),
          //         ),
          //       ),
          //       padding: EdgeInsets.all(Unit.pixels(20)),
          //     ),
          //     Styles.flexbox(
          //       justifyContent: JustifyContent.center,
          //       alignItems: AlignItems.center,
          //       direction: FlexDirection.column,
          //     ),
          //   ],
          // ),
            classes: 'rounded-[20px] p-[20px] flex justify-center items-center flex-col',
        ),
      ],
    );
  }
}

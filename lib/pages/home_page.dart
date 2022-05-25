import 'dart:ui';

import 'package:demoapp/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: SafeArea(
          child: orientation == Orientation.portrait
              ? Stack(
                  children: [
                    const GetstartedBackground(),
                    const FractionallySizedBox(
                      heightFactor: 0.35,
                      child: GetStartedHeader(),
                    ),
                    Align(
                      alignment: Alignment(0.0, 0.8),
                      child: GetStartedButton(
                        fixedSize: MaterialStateProperty.all(
                          Size(
                            size.width * 0.9,
                            size.height * 0.065,
                          ),
                        ),
                        textStyle: MaterialStateProperty.all(
                          PrimaryFont.medium(size.height * 0.015),
                        ),
                      ),
                    )
                  ],
                )
              : Row(
                  children: [
                    const Expanded(
                        child: Align(
                      alignment: Alignment.topCenter,
                      child: FractionallySizedBox(
                          heightFactor: 0.7, child: GetStartedHeader()),
                    )),
                    Expanded(
                      child: Stack(
                        children: [
                          const GetstartedBackground(),
                          Align(
                            alignment: const Alignment(0.0, 0.8),
                            child: GetStartedButton(
                              fixedSize: MaterialStateProperty.all(
                                Size(
                                  size.width * 0.4,
                                  size.height * 0.065,
                                ),
                              ),
                              textStyle: MaterialStateProperty.all(
                                PrimaryFont.medium(size.height * 0.015),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    Key? key,
    this.fixedSize,
    this.textStyle,
  }) : super(key: key);

  final MaterialStateProperty<Size>? fixedSize;
  final MaterialStateProperty<TextStyle>? textStyle;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('GET STARTED'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kColorLightGrey),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        fixedSize: fixedSize,
        foregroundColor: MaterialStateProperty.all(kColorDarkGrey),
        textStyle: textStyle,
      ),
    );
  }
}

class GetstartedBackground extends StatelessWidget {
  const GetstartedBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Align(
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
            heightFactor: orientation == Orientation.portrait ? 0.6 : 0.9,
            widthFactor: 1,
            child: FittedBox(
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                clipBehavior: Clip.antiAlias,
                child: SvgPicture.asset('assets/images/bg_get_started.svg'))));
  }
}

class GetStartedHeader extends StatelessWidget {
  const GetStartedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: SvgPicture.asset(
              'assets/images/ic_logo.svg',
              alignment: Alignment(0.0, -0.8),
            )),
        Flexible(
          flex: 1,
          child: FittedBox(
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Hi Afsar, Welcome\n',
                    style: PrimaryFont.medium(30).copyWith(
                      color: kColorLightYellow,
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                          text: 'to Silent Moon',
                          style: PrimaryFont.thin(30)
                              .copyWith(color: kColorLightYellow))
                    ])),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: SizedBox.expand(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FittedBox(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Explore the app, Find some peace of mind\n to prepare for meditation.',
                      style: PrimaryFont.light(16)
                          .copyWith(color: kColorLightGrey, height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

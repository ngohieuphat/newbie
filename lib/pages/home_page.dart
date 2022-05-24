import 'package:demoapp/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: SafeArea(
          child: orientation == Orientation.portrait
              ? Stack(
                  children: const [
                    GetstartedBackground(),
                    GetStartedHeader(),
                  ],
                )
              : Row(
                  children: const [
                    Expanded(child: GetStartedHeader()),
                    Expanded(child: GetstartedBackground())
                  ],
                )),
    );
  }
}

class GetstartedBackground extends StatelessWidget {
  const GetstartedBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
            heightFactor: 0.6,
            widthFactor: 1,
            child: FittedBox(
                fit: BoxFit.cover,
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
        SvgPicture.asset('assets/images/ic_logo.svg'),
        Text('Hi Afsar, Welcome'),
        Text('to Silent Moon'),
        Text(
            'Explore the app, Find some peace of mind to prepare for meditation.')
      ],
    );
  }
}

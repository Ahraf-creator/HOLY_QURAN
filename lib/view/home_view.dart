// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, override_on_non_overriding_member

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_holy_quran/darkThemeController/darkThemeprovider.dart';
import 'package:the_holy_quran/design.dart';
import 'package:the_holy_quran/widgets/mainscreen.dart';

import 'myDrawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late bool _canBeDragged;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = animationController.isDismissed;
    bool isDragCloseFromRight = animationController.isCompleted;
    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta! / 280;
      animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    double _kMinFlingVelocity = 365.0;
    if (animationController.isDismissed || animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      animationController.fling(velocity: visualVelocity);
    } else if (animationController.value < 0.5) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      behavior: HitTestBehavior.translucent,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Material(
            color: themeChange.darkTheme ? Colors.grey[850] : Colors.white70,
            child: SafeArea(
                child: Stack(
              children: [
                Transform.translate(
                  offset: Offset(280 * (animationController.value - 1), 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(math.pi / 2 * (1 - animationController.value)),
                    alignment: Alignment.centerRight,
                    child: MyDrawer(),
                  ),
                ),
                Transform.translate(
                  offset: Offset(280 * animationController.value, 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(-math.pi / 2 * animationController.value),
                    alignment: Alignment.centerLeft,
                    child: MainView(),
                  ),
                ),
                Positioned(
                  top: 4.0 + MediaQuery.of(context).padding.top,
                  left: MediaQuery.of(context).size.width * 0.01 +
                      animationController.value * 200,
                  child: IconButton(
                    onPressed: toggle,
                    icon: Icon(Icons.menu),
                    color: themeChange.darkTheme ? Colors.white : Colors.black,
                  ),
                )
              ],
            )),
          );
        },
      ),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              top: 100,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    "Holy\nQu'ran",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              )),
          Positioned(
            right: 10,
            top: 40,
            child: Image.asset(
              'images/grad_logo.png',
              height: 195,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainScreenBtn(
                  btnText: "Surah Index",
                  onPressFtn: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => design()));
                  },
                ),
                MainScreenBtn(
                  btnText: 'Juzz Index',
                  onPressFtn: () {},
                ),
                MainScreenBtn(
                  btnText: 'Sajda Index',
                  onPressFtn: () {},
                ),
              ],
            ),
          ),
          Positioned(
              top: 230,
              left: 25,
              child: Opacity(
                opacity: 0.2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 200.0),
                  child: Image.asset('images/quranRail.png'),
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Text(
                    'Feel the happiness of paradise ',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

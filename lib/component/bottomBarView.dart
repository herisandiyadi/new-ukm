import 'dart:math' as math;
import 'package:enforcea/component/ContactUs.dart';
import 'package:enforcea/component/faqDetail.dart';
import 'package:enforcea/component/historyNav.dart';
import 'package:enforcea/theme/homeTheme.dart';
import 'package:enforcea/model/tabIconData.dart';
import 'package:flutter/material.dart';
import 'package:enforcea/util/hexColor.dart';
import 'package:enforcea/component/newsNav.dart';
import 'package:enforcea/util/cache_util.dart';
import 'package:enforcea/component/downloadNav.dart';
import 'package:enforcea/component/settingNav.dart';
import 'package:enforcea/constants.dart';
import 'package:enforcea/home.dart';
import '../login.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView(
      {Key key, this.tabIconsList, this.changeIndex, this.addClick})
      : super(key: key);

  final Function(int index) changeIndex;
  final Function addClick;
  final List<TabIconData> tabIconsList;
  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return Transform(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              child: PhysicalShape(
                color: HomeTheme.white,
                elevation: 16.0,
                clipper: TabClipper(
                    radius: Tween<double>(begin: 0.0, end: 0.0)
                            .animate(CurvedAnimation(
                                parent: animationController,
                                curve: Curves.fastOutSlowIn))
                            .value *
                        38.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 62,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: widget.tabIconsList[0].imagePath == ""
                                  ? Material(
                                      child: IconButton(
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.person_add,
                                              color: Colors.grey,
                                              size: 30,
                                            ),
                                            Text(
                                              "SignUp",
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushReplacementNamed("/login");
                                        },
                                      ),
                                    )
                                  : TabIcons(
                                      tabIconData: widget.tabIconsList[0],
                                      removeAllSelect: () {
                                        setRemoveAllSelection(
                                            widget.tabIconsList[0]);
                                        widget.changeIndex(0);
                                      },
                                      label: widget.tabIconsList[0].label),
                            ),
                            Expanded(
                              child: widget.tabIconsList[1].imagePath == ""
                                  ? SizedBox(
                                      width: double.infinity,
                                    )
                                  : TabIcons(
                                      tabIconData: widget.tabIconsList[1],
                                      removeAllSelect: () {
                                        setRemoveAllSelection(
                                            widget.tabIconsList[1]);
                                        widget.changeIndex(1);
                                      },
                                      label: widget.tabIconsList[1].label),
                            ),
                            Expanded(
                              child: widget.tabIconsList[2].imagePath == ""
                                  ? SizedBox(
                                      width: double.infinity,
                                    )
                                  : TabIcons(
                                      tabIconData: widget.tabIconsList[2],
                                      removeAllSelect: () {
                                        setRemoveAllSelection(
                                            widget.tabIconsList[2]);
                                        widget.changeIndex(2);
                                      },
                                      label: widget.tabIconsList[2].label),
                            ),
                            Expanded(
                              child: widget.tabIconsList[3].imagePath == ""
                                  ? SizedBox(
                                      width: double.infinity,
                                    )
                                  : TabIcons(
                                      tabIconData: widget.tabIconsList[3],
                                      removeAllSelect: () {
                                        setRemoveAllSelection(
                                            widget.tabIconsList[3]);
                                        widget.changeIndex(3);
                                      },
                                      label: widget.tabIconsList[3].label),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Material(
                                  child: IconButton(
                                    icon: Column(
                                      children: [
                                        Icon(
                                          Icons.more_horiz,
                                          color: Colors.grey,
                                          size: 30,
                                        ),
                                        Text(
                                          "More",
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.only(right: 15),
                                    onPressed: () {
                                      // modalBottomPopup(context);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      border: Border(
        top: BorderSide(
          //                    <--- top side
          color: Colors.black54,
          width: 3.0,
        ),
      ),
    );
  }

  void setRemoveAllSelection(TabIconData tabIconData) {
    if (!mounted) return;
    setState(() {
      widget.tabIconsList.forEach((TabIconData tab) {
        tab.isSelected = false;
        if (tabIconData.index == tab.index) {
          tab.isSelected = true;
        }
      });
    });
  }
}

class TabIcons extends StatefulWidget {
  const TabIcons({Key key, this.tabIconData, this.removeAllSelect, this.label})
      : super(key: key);

  final TabIconData tabIconData;
  final Function removeAllSelect;
  final String label;
  @override
  _TabIconsState createState() => _TabIconsState();
}

class _TabIconsState extends State<TabIcons> with TickerProviderStateMixin {
  @override
  void initState() {
    widget.tabIconData.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          if (!mounted) return;
          widget.removeAllSelect();
          widget.tabIconData.animationController.reverse();
        }
      });
    super.initState();
  }

  void setAnimation() {
    widget.tabIconData.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {
          if (!widget.tabIconData.isSelected) {
            setAnimation();
          }
        },
        child: IgnorePointer(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              ScaleTransition(
                alignment: Alignment.center,
                scale: Tween<double>(begin: 0.88, end: 1.0).animate(
                    CurvedAnimation(
                        parent: widget.tabIconData.animationController,
                        curve:
                            Interval(0.1, 1.0, curve: Curves.fastOutSlowIn))),
                child: Column(
                  children: [
                    Image.asset(
                      widget.tabIconData.isSelected
                          ? widget.tabIconData.selectedImagePath
                          : widget.tabIconData.imagePath,
                      width: 27,
                      height: 27,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        widget.label,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 4,
                left: 6,
                right: 0,
                child: ScaleTransition(
                  alignment: Alignment.center,
                  scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: widget.tabIconData.animationController,
                          curve:
                              Interval(0.2, 1.0, curve: Curves.fastOutSlowIn))),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: HomeTheme.nearlyDarkBlue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 6,
                bottom: 8,
                child: ScaleTransition(
                  alignment: Alignment.center,
                  scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: widget.tabIconData.animationController,
                          curve:
                              Interval(0.5, 0.8, curve: Curves.fastOutSlowIn))),
                  child: Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color: HomeTheme.nearlyDarkBlue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 8,
                bottom: 0,
                child: ScaleTransition(
                  alignment: Alignment.center,
                  scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: widget.tabIconData.animationController,
                          curve:
                              Interval(0.5, 0.6, curve: Curves.fastOutSlowIn))),
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: HomeTheme.nearlyDarkBlue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabClipper extends CustomClipper<Path> {
  TabClipper({this.radius = 38.0});

  final double radius;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    final double v = radius * 2;
    path.lineTo(0, 0);
    path.arcTo(Rect.fromLTWH(0, 0, radius, radius), degreeToRadians(180),
        degreeToRadians(90), false);
    path.arcTo(
        Rect.fromLTWH(
            ((size.width / 2) - v / 2) - radius + v * 0.04, 0, radius, radius),
        degreeToRadians(270),
        degreeToRadians(70),
        false);

    path.arcTo(Rect.fromLTWH((size.width / 2) - v / 2, -v / 2, v, v),
        degreeToRadians(160), degreeToRadians(-140), false);

    path.arcTo(
        Rect.fromLTWH((size.width - ((size.width / 2) - v / 2)) - v * 0.04, 0,
            radius, radius),
        degreeToRadians(200),
        degreeToRadians(70),
        false);
    path.arcTo(Rect.fromLTWH(size.width - radius, 0, radius, radius),
        degreeToRadians(270), degreeToRadians(90), false);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TabClipper oldClipper) => true;

  double degreeToRadians(double degree) {
    final double redian = (math.pi / 180) * degree;
    return redian;
  }
}

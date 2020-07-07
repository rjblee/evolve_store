import 'package:flutter/cupertino.dart';

class CustomNeumorphic extends StatelessWidget {
  Map<String, dynamic> topShadow;
  Map<String, dynamic> bottomShadow;
  double radius;
  Color background;
  Widget child;
  EdgeInsets padding;
  double width;
  double height;

  CustomNeumorphic(
      {this.topShadow,
      this.bottomShadow,
      this.radius: 10.0,
      this.background: const Color(0XFFEFF3F6),
      this.child,
      this.padding,
      this.width,
      this.height});

  List<BoxShadow> MakeShadow() {
    topShadow = topShadow != null
        ? topShadow
        : {
            'R': 0,
            'G': 0,
            'B': 0,
            'O': 0.1,
          };

    bottomShadow = bottomShadow != null
        ? bottomShadow
        : {
            'R': 255,
            'G': 255,
            'B': 255,
            'O': 0.9,
          };
    return [
      BoxShadow(
          color: Color.fromRGBO(
              topShadow['R'], topShadow['G'], topShadow['B'], topShadow['O']),
          offset: Offset(6, 2),
          blurRadius: 6.0,
          spreadRadius: 3.0),
      BoxShadow(
          color: Color.fromRGBO(bottomShadow['R'], bottomShadow['G'],
              bottomShadow['B'], bottomShadow['O']),
          offset: Offset(-6, -2),
          blurRadius: 6.0,
          spreadRadius: 3.0)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? this.width,
      height: height ?? this.height,
      padding: padding ?? this.padding,
      child: child ?? this.child,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: MakeShadow(),
      ),
    );
  }
}

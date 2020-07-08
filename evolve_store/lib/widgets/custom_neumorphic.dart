import 'package:flutter/cupertino.dart';

class CustomNeumorphic extends StatelessWidget {
  Map<String, dynamic> topShadow;
  Map<String, dynamic> bottomShadow;
  double radius;
  Color background;
  Widget child;
  EdgeInsets padding;
  EdgeInsets margin;
  double width;
  double height;
  AlignmentGeometry alignment;
  double depth;
  bool negative;

  CustomNeumorphic(
      {this.topShadow,
      this.bottomShadow,
      this.radius: 10.0,
      this.background: const Color(0XFFEFF3F4),
      this.child,
      this.padding,
      this.width,
      this.height,
      this.margin,
      this.alignment,
      this.depth:1,
      this.negative: false});

  List<BoxShadow> MakeShadow() {
    return [
      BoxShadow(
          color: Color.fromRGBO(0,0,0, depth*0.01 + 0.1),
          offset: negative ? Offset(-6, -2): Offset(6, 2),
          blurRadius: 6.0,
          spreadRadius: 3.0),
      BoxShadow(
          color: Color.fromRGBO(255,255,255, 0.9),
          offset: negative ? Offset(6, 2): Offset(-6, -2),
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
      margin: margin ?? this.margin,
      alignment: alignment ?? this.alignment,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: MakeShadow(),
      ),
    );
  }
}

//第四步，水平和垂直线的组件,核心是CustomPaint
//lib/components/divider/normal_divider.dart
import 'package:flutter/material.dart';
import 'divider.dart';
import 'painter.dart';

class NormalDivider extends AppDividerBase {
  const NormalDivider({
    Key? key,
    double? value,
    AppDividerDirections direction = AppDividerDirections.horizontal,
    AppDividerStyles style = AppDividerStyles.solid,
    double? thickness,
    double? indent,
    double? endIndent,
    AppDividerColors color = AppDividerColors.mydefault,
  }) : super(
         key: key,
         value: value,
         direction: direction,
         style: style,
         thickness: thickness,
         indent: indent,
         endIndent: endIndent,
         color: color,
       );

  @override
  Widget build(BuildContext context) {
    //thickness如果为空，默认1.0
    final thickness = this.thickness ?? 1.0;
    //indent和endIndent如果为空，默认0.0
    final indent = this.indent ?? 0.0;
    final endIndent = this.endIndent ?? 0.0;

    //根据方向设置宽高
    final size = direction == AppDividerDirections.horizontal
        ? Size(double.infinity, value ?? thickness) //水平线宽度撑满，高度thickness
        : Size(value ?? thickness, double.infinity); //垂直线高度撑满，宽度thickness

    //绘制的核心是return custompaint
    return CustomPaint(
      size: size,
      painter: AppDividerPainter(
        style: style,
        thickness: thickness,
        direction: direction,
        color: getColor(context),
        indent: indent,
        endIndent: endIndent,
      ),
    );
  }
}

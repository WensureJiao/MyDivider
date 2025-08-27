import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'divider.dart';
import 'normal_divider.dart';

class LabelDivider extends AppDivider {
  ///标签
  final String label;

  ///标签样式
  final TextStyle? labelStyle;

  ///标签和线的间距
  final double? padding;

  const LabelDivider({
    super.key,
    required this.label,
    this.labelStyle,
    this.padding,
    super.value,
    super.direction = AppDividerDirections.horizontal,
    super.style = AppDividerStyles.solid,
    super.thickness,
    super.indent,
    super.endIndent,
    super.color = AppDividerColors.defaultColor,
  });

  @override
  Widget build(BuildContext context) {
    //direction转换为Axis,for Flex
    final newdirection = switch (this.direction) {
      AppDividerDirections.horizontal => Axis.horizontal,
      AppDividerDirections.vertical => Axis.vertical,
    };
    return Flex(
      direction: newdirection, //水平或垂直布局
      children: [
        Expanded(
          child: NormalDivider(
            direction: direction,
            style: style,
            thickness: thickness,
            indent: indent,
            endIndent: endIndent,
            color: color,
            value: value,
          ),
        ),
        Padding(
          padding: newdirection == Axis.horizontal
              ? EdgeInsets.symmetric(horizontal: padding ?? 8.0)
              : EdgeInsets.symmetric(vertical: padding ?? 8.0),
          child: Text(
            label,
            style: labelStyle ?? TextStyle(color: getColor(context)),
          ),
        ),
        Expanded(
          child: NormalDivider(
            direction: direction,
            style: style,
            thickness: thickness,
            indent: indent,
            endIndent: endIndent,
            color: color,
            value: value,
          ),
        ),
      ],
    );
  }
}

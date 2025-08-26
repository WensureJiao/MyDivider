import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'divider.dart';
import 'normal_divider.dart';

class LabelDivider extends AppDividerBase {
  final String label; //标签
  final TextStyle? labelStyle; //标签样式

  const LabelDivider({
    Key? key,
    required this.label,
    this.labelStyle,
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
              ? const EdgeInsets.symmetric(horizontal: 8.0)
              : const EdgeInsets.symmetric(vertical: 8.0),
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

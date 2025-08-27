// 方向：水平 / 垂直
// 样式：实线 / 虚线 / 点线
// 粗细 / 缩进：thickness / indent / endIndent
// 带标签：中间标签 + 自定义样式与 padding
// 颜色：通过枚举映射到主题色（不依赖你项目里的 WooTheme）
// 工厂构造：horizontal / vertical / label 便捷创建

//第二步，创建分割线的抽象基类和枚举和颜色获取方法
//lib/components/divider/divider.dart

import 'package:flutter/material.dart';
import 'normal_divider.dart';
import 'label_divider.dart';

///分割线方向的枚举
enum AppDividerDirections { horizontal, vertical }

///分割线样式的枚举
enum AppDividerStyles { solid, dashed, dotted }

///分割线颜色的枚举
enum AppDividerColors { defaultColor, primary, success, warning, danger }

///分割线的抽象基类
abstract class AppDivider extends StatelessWidget {
  ///分割线的值，水平分割线的高度，垂直分割线的宽度
  final double? value;

  ///方向
  final AppDividerDirections direction;

  ///样式
  final AppDividerStyles style;

  ///粗细
  final double? thickness;

  ///起始缩进
  final double? indent;

  ///结束缩进
  final double? endIndent;
  final AppDividerColors color;

  const AppDivider({
    super.key,
    this.value,
    this.direction = AppDividerDirections.horizontal,
    this.style = AppDividerStyles.solid,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color = AppDividerColors.defaultColor, //默认色
  });
  //获取颜色
  Color getColor(BuildContext context) {
    switch (color) {
      case AppDividerColors.primary:
        return Theme.of(context).colorScheme.primary;
      case AppDividerColors.success:
        return Colors.green;
      case AppDividerColors.warning:
        return Colors.orange;
      case AppDividerColors.danger:
        return Colors.red;
      case AppDividerColors.defaultColor:
        return Theme.of(context).dividerColor; //默认色
    }
  }

  ///工厂构造函数，便捷创建水平分割线
  factory AppDivider.horizontal({
    double? height,

    AppDividerStyles style = AppDividerStyles.solid,
    double? thickness,
    double? indent,
    double? endIndent,
    AppDividerColors color = AppDividerColors.defaultColor,
  }) {
    return NormalDivider(
      value: height,
      direction: AppDividerDirections.horizontal,
      style: style,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
    );
  }

  ///工厂构造函数，便捷创建垂直分割线
  factory AppDivider.vertical({
    double? width,
    AppDividerStyles style = AppDividerStyles.solid,
    double? thickness,
    double? indent,
    double? endIndent,
    AppDividerColors color = AppDividerColors.defaultColor,
  }) {
    return NormalDivider(
      value: width,
      direction: AppDividerDirections.vertical,
      style: style,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
    );
  }

  ///工厂构造函数，便捷创建带标签的分割线
  factory AppDivider.label({
    TextStyle? textStyle,
    required String label,
    double? padding,
    double? value,
    AppDividerDirections direction = AppDividerDirections.horizontal,
    AppDividerStyles style = AppDividerStyles.solid,
    double? thickness,
    double? indent,
    double? endIndent,
    AppDividerColors color = AppDividerColors.defaultColor,
  }) {
    return LabelDivider(
      label: label,
      labelStyle: textStyle,
      padding: padding,
      value: value,
      direction: direction,
      style: style,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
    );
  }
}

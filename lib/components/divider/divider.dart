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

//分割线方向的枚举
enum AppDividerDirections { horizontal, vertical }

//分割线样式的枚举
enum AppDividerStyles { solid, dashed, dotted }

//分割线颜色的枚举
enum AppDividerColors { mydefault, primary, success, warning, danger }

//分割线的抽象基类
abstract class AppDividerBase extends StatelessWidget {
  final double? value; //分割线的值，水平分割线的高度，垂直分割线的宽度
  final AppDividerDirections direction; //方向
  final AppDividerStyles style; //样式
  final double? thickness; //粗细
  final double? indent; //起始缩进
  final double? endIndent; //结束缩进
  final AppDividerColors color; //颜色

  //不为空的变量如果不写required一定要初始化
  const AppDividerBase({
    Key? key,
    this.value,
    this.direction = AppDividerDirections.horizontal, //默认水平
    this.style = AppDividerStyles.solid, //默认实线
    this.thickness,
    this.indent,
    this.endIndent,
    this.color = AppDividerColors.mydefault, //默认色
  }) : super(key: key);
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
      case AppDividerColors.mydefault:
        return Theme.of(context).dividerColor; //默认色
    }
  }

  //工厂构造函数，便捷创建水平分割线
  factory AppDividerBase.horizontal({
    double? height,

    AppDividerStyles style = AppDividerStyles.solid,
    double? thickness,
    double? indent,
    double? endIndent,
    AppDividerColors color = AppDividerColors.mydefault,
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
  //工厂构造函数，便捷创建垂直分割线
  factory AppDividerBase.vertical({
    double? width,
    AppDividerStyles style = AppDividerStyles.solid,
    double? thickness,
    double? indent,
    double? endIndent,
    AppDividerColors color = AppDividerColors.mydefault,
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
  //工厂构造函数，便捷创建带标签的分割线
  factory AppDividerBase.label({
    TextStyle? textStyle,
    required String label,
    double? padding,
    double? value,
    AppDividerDirections direction = AppDividerDirections.horizontal,
    AppDividerStyles style = AppDividerStyles.solid,
    double? thickness,
    double? indent,
    double? endIndent,
    AppDividerColors color = AppDividerColors.mydefault,
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

      //传递参数
    );
  }
}

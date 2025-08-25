//第三步，主要的绘制逻辑
//lib/components/divider/painter.dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'divider.dart';

class AppDividerPainter extends CustomPainter {
  final AppDividerStyles style; //样式
  final double thickness; //粗细
  final AppDividerDirections direction; //方向
  final Color color; //颜色
  final double indent; //起始缩进
  final double endIndent; //结束缩进

  AppDividerPainter({
    required this.style,
    required this.thickness,
    required this.direction,
    required this.color,
    required this.indent,
    required this.endIndent,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;
    double startX, endX, startY, endY;
    if (direction == AppDividerDirections.horizontal) {
      startX = indent;
      endX = size.width - endIndent;
      startY = size.height / 2;
      endY = size.height / 2;
    } else {
      startX = size.width / 2;
      endX = size.width / 2;
      startY = indent;
      endY = size.height - endIndent;
    }
    switch (style) {
      //绘制实线
      case AppDividerStyles.solid:
        canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
        break;
      //绘制虚线
      case AppDividerStyles.dashed:
        final dashWidth = thickness * 3;
        final dashSpace = thickness * 2;
        if (direction == AppDividerDirections.horizontal) {
          double x = startX;
          while (x < endX) {
            final nextX = min(x + dashWidth, endX);
            canvas.drawLine(Offset(x, startY), Offset(nextX, startY), paint);
            x += dashWidth + dashSpace;
          }
        } else {
          double y = startY;
          while (y < endY) {
            final nextY = min(y + dashWidth, endY);
            canvas.drawLine(Offset(startX, y), Offset(startX, nextY), paint);
            y += dashWidth + dashSpace;
          }
        }
        break;
      //绘制点线
      case AppDividerStyles.dotted:
        final dotRadius = thickness / 2;
        final dotSpacing = thickness * 2;
        paint.style = PaintingStyle.fill; //点线需要填充,实心圆点

        if (direction == AppDividerDirections.horizontal) {
          double x = startX + dotRadius; //center of first dot
          while (x < endX) {
            canvas.drawCircle(Offset(x, startY), dotRadius, paint);
            x += dotRadius * 2 + dotSpacing;
          }
        } else {
          double y = startY + dotRadius; //center of first dot
          while (y < endY) {
            canvas.drawCircle(Offset(startX, y), dotRadius, paint);
            y += dotRadius * 2 + dotSpacing;
          }
        }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is AppDividerPainter) {
      return oldDelegate.style != style ||
          oldDelegate.thickness != thickness ||
          oldDelegate.direction != direction ||
          oldDelegate.color != color ||
          oldDelegate.indent != indent ||
          oldDelegate.endIndent != endIndent;
    }
    return false;
  }
}

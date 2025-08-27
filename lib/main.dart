import 'package:flutter/material.dart';

import 'components/divider/index.dart';

void main() {
  runApp(DividerApp());
}

class DividerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Divider Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(title: Text('Divider Demo')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, //居中对齐
            children: [
              Text('Solid Horizontal Divider:'),
              AppDivider.horizontal(
                style: AppDividerStyles.solid,
                thickness: 2.0,
                color: AppDividerColors.primary,
                indent: 20.0,
                endIndent: 20.0,
              ),
              SizedBox(height: 20),
              Text('Dotted Horizontal Divider:'),
              AppDivider.horizontal(
                style: AppDividerStyles.dotted,
                thickness: 3.0,
                color: AppDividerColors.primary,
                indent: 20.0,
                endIndent: 20.0,
              ),
              SizedBox(height: 20),
              Text('Dashed Horizontal Divider:'),
              AppDivider.horizontal(
                style: AppDividerStyles.dashed,
                thickness: 2.0,
                color: AppDividerColors.defaultColor,
                indent: 20.0,
                endIndent: 20.0,
              ),
              SizedBox(height: 20),
              Text('Solid Vertical Divider:'),
              SizedBox(
                height: 100,
                child: AppDivider.vertical(
                  style: AppDividerStyles.solid,
                  thickness: 2.0,
                  color: AppDividerColors.success,
                  indent: 10.0,
                  endIndent: 10.0,
                ),
              ),
              SizedBox(height: 20),
              Text('Dotted Vertical Divider:'),
              SizedBox(
                height: 100,
                child: AppDivider.vertical(
                  style: AppDividerStyles.dotted,
                  thickness: 3.0,
                  color: AppDividerColors.success,
                  indent: 10.0,
                  endIndent: 10.0,
                ),
              ),
              SizedBox(height: 20),
              Text('Dashed Vertical Divider:'),
              SizedBox(
                height: 100,
                child: AppDivider.vertical(
                  style: AppDividerStyles.dashed,
                  thickness: 2.0,
                  color: AppDividerColors.success,
                  indent: 10.0,
                  endIndent: 10.0,
                ),
              ),
              SizedBox(height: 20),
              Text('Solid Horizontal Label Divider:'),
              AppDivider.label(
                label: 'Section 1',
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).primaryColor,
                ),
                padding: 3.0,
                style: AppDividerStyles.solid,
                thickness: 1.0,
                color: AppDividerColors.warning,
                indent: 10.0,
                endIndent: 10.0,
              ),
              SizedBox(height: 20),
              Text('Dotted Horizontal Label Divider:'),
              AppDivider.label(
                label: 'Section 2',
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).hintColor,
                ),
                padding: 3.0,
                style: AppDividerStyles.dotted,
                thickness: 3.0,
                color: AppDividerColors.danger,
                indent: 10.0,
                endIndent: 10.0,
              ),
              SizedBox(height: 20),
              Text('Dashed Horizontal Label Divider:'),
              AppDivider.label(
                label: 'Section 3',
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).disabledColor,
                ),
                padding: 3.0,
                style: AppDividerStyles.dashed,
                thickness: 2.0,
                color: AppDividerColors.defaultColor,
                indent: 10.0,
                endIndent: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

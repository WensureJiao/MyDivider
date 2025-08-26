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
              AppDividerBase.horizontal(
                style: AppDividerStyles.solid,
                thickness: 2.0,
                color: AppDividerColors.primary,
                indent: 20.0,
                endIndent: 20.0,
              ),
              SizedBox(height: 20),
              Text('Dashed Vertical Divider:'),
              SizedBox(
                height: 100,
                child: AppDividerBase.vertical(
                  style: AppDividerStyles.dashed,
                  thickness: 2.0,
                  color: AppDividerColors.success,
                  indent: 10.0,
                  endIndent: 10.0,
                ),
              ),
              SizedBox(height: 20),
              Text('Label Divider:'),
              AppDividerBase.label(
                label: 'Section 1',
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                padding: 3.0,
                style: AppDividerStyles.solid,
                thickness: 1.0,
                color: AppDividerColors.danger,
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

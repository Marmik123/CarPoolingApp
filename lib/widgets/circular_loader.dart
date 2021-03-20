import 'package:car_pooling_app/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

buildLoader({Color color = kText}) {
  return CircularProgressIndicator(
    strokeWidth: 1,
    valueColor: AlwaysStoppedAnimation<Color>(color),
    backgroundColor: Colors.grey,
  );
}

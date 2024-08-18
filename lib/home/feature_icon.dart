import 'package:flutter/material.dart';

class FeatureIcon {
  final String name;
  final Color bgColor;
  final String iconRes;
  final double paddingSize;
  final Widget widgetDestination;

  FeatureIcon({required this.name, required this.bgColor, required this.iconRes,
    required this.paddingSize, required this.widgetDestination});
}
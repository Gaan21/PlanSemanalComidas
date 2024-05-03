import 'package:flutter/material.dart';

class MenuItemModel {
  final String title;
  final String link;
  final String? arguments;
  final IconData icon;

  const MenuItemModel({
    required this.title,
    required this.link,
    required this.icon,
    this.arguments,
  });
}

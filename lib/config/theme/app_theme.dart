import 'package:flutter/material.dart';

class AppTheme {
  final BuildContext _context;
  AppTheme(this._context);

  ThemeData get theme => ThemeData(
    colorSchemeSeed: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: MediaQuery.of(_context).platformBrightness,
  );
}

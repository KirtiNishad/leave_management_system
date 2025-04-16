import 'dart:ui';

import 'package:flutter/material.dart';

class AppThemes{

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFd9dfdd),
      surfaceTint: Color(0xff4c662b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffcdeda3),
      onPrimaryContainer: Color(0xff354e15),
      secondary: Color(0xff4d662a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcfeda2),
      onSecondaryContainer: Color(0xff364e14),
      tertiary: Color(0xff37693d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffb9f0b8),
      onTertiaryContainer: Color(0xff1f5027),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff9faef),
      onSurface: Color(0xff1a1c16),
      onSurfaceVariant: Color(0xff44483d),
      outline: Color(0xff75796c),
      outlineVariant: Color(0xffc5c8ba),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f312a),
      inversePrimary: Color(0xffb2d189),
      primaryFixed: Color(0xffcdeda3),
      onPrimaryFixed: Color(0xff102000),
      primaryFixedDim: Color(0xffb2d189),
      onPrimaryFixedVariant: Color(0xff354e15),
      secondaryFixed: Color(0xffcfeda2),
      onSecondaryFixed: Color(0xff111f00),
      secondaryFixedDim: Color(0xffb3d088),
      onSecondaryFixedVariant: Color(0xff364e14),
      tertiaryFixed: Color(0xffb9f0b8),
      onTertiaryFixed: Color(0xff002107),
      tertiaryFixedDim: Color(0xff9dd49e),
      onTertiaryFixedVariant: Color(0xff1f5027),
      surfaceDim: Color(0xffdadbd0),
      surfaceBright: Color(0xfff9faef),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f4e9),
      surfaceContainer: Color(0xffeeefe3),
      surfaceContainerHigh: Color(0xffe8e9de),
      surfaceContainerHighest: Color(0xffe2e3d8),
    );
  }

}
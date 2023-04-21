import 'package:flutter/material.dart';

import 'size.dart';

class _TextStyles {
  TextStyle extraLarge({Color? color = const Color(0xFF000000), double? size = 36}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: size,
      );

  TextStyle large({Color? color = const Color(0xFF000000), double size = 32}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: size,
      );

  TextStyle medium({Color? color = const Color(0xFF000000), double? size = 24}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: size,
      );

  TextStyle regular({Color? color = const Color(0xFF000000), double? size = 20}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size,
      );

  TextStyle small({Color? color = const Color(0xFF000000), double? size = 16}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w300,
        fontSize: size,
      );

  TextStyle extraSmall({Color? color = const Color(0xFF000000), double? size = 14}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size,
      );

  TextStyle caption(BuildContext context, {Color? color = const Color(0xFF000000)}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size.width(context, .0083),
      );

  TextStyle buttons({Color? color = const Color(0xFF000000), double? size = 16}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: size,
      );
}

final textStyles = _TextStyles();

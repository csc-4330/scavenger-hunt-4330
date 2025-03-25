import 'package:flutter/material.dart';

class LSUColors {
  // -----------------------------------
  // OFFICIAL BRAND COLORS
  // -----------------------------------
  static const Color purple = Color(0xFF461D7C); // LSU Primary Purple
  static const Color gold = Color(0xFFFDD023);   // LSU Primary Gold

  // -----------------------------------
  // TONAL PALETTE
  // -----------------------------------

  /// Corporate Purple - Pantone 2627 C / 269 U
  static const Color corporatePurple = Color(0xFF3C1053); // #3C1053

  /// Light Purple - Pantone 7660 C / 7660 U
  static const Color lightPurple = Color(0xFFA39AAC);     // #A39AAC

  /// Corporate Gold - Pantone 7555 C / 7555 U
  static const Color corporateGold = Color(0xFFD29F13);   // #D29F13

  /// Light Gold (No solid Pantone version)
  static const Color lightGold = Color(0xFFF1EEDB);       // #F1EEDB

  // -----------------------------------
  // NEUTRAL PALETTE
  // -----------------------------------

  /// Light Gray - Pantone Cool Gray 2 C / 2 U
  static const Color lightGray = Color(0xFFD0D0CE);       // #D0D0CE

  /// 50% Gray - Pantone Cool Gray 8 C / 8 U
  static const Color mediumGray = Color(0xFF999999);      // #999999

  /// Process Black
  static const Color processBlack = Color(0xFF333333);    // #333333

  /// Metallic Gold - Pantone 872
  /// NOTE: Metallic gold is not representable in flat RGB.
  /// Use [corporateGold] or [gold] for digital use.
  static const Color metallicGoldFallback = Color(0xFFD29F13); // same as corporateGold

  // -----------------------------------
  // CORE NEUTRALS
  // -----------------------------------
  static const Color black = Colors.black;
  static const Color white = Colors.white;
}

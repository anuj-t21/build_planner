import 'package:flutter/material.dart';

class StyleConstants {
  static final BorderRadius commonBorder4 = BorderRadius.circular(4);
  static final BorderRadius commonBorder8 = BorderRadius.circular(8);
  static final BorderRadius commonBorder12 = BorderRadius.circular(12);
  static final BorderRadius commonBorder16 = BorderRadius.circular(16);
  static final BorderRadius commonBorder28 = BorderRadius.circular(28);

  static final BorderRadius bottomRightBorder140 = BorderRadius.only(
    bottomRight: Radius.circular(
      140,
    ),
  );
  static final BorderRadius bottomRightBorder16 = BorderRadius.only(
    bottomRight: Radius.circular(16),
  );

  static final BorderRadius br0Border = BorderRadius.only(
    bottomRight: Radius.circular(0),
    bottomLeft: Radius.circular(8),
    topRight: Radius.circular(8),
    topLeft: Radius.circular(8),
  );
  static final BorderRadius bl0Border = BorderRadius.only(
    bottomRight: Radius.circular(8),
    bottomLeft: Radius.circular(0),
    topRight: Radius.circular(8),
    topLeft: Radius.circular(8),
  );

  static final BorderRadius tl4tr4Border = BorderRadius.only(
    topLeft: Radius.circular(4),
    topRight: Radius.circular(4),
  );
  static final BorderRadius tl8tr8Border = BorderRadius.only(
    topLeft: Radius.circular(8),
    topRight: Radius.circular(8),
  );
  static final BorderRadius tl28tr28Border = BorderRadius.only(
    topLeft: Radius.circular(28),
    topRight: Radius.circular(28),
  );
}

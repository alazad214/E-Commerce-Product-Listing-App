import 'package:flutter/material.dart';

final class UIHelper {
  UIHelper._();

  static Widget verticalSpace(num height) =>
      SizedBox(height: height.toDouble());
  static Widget horizontalSpace(num width) => SizedBox(width: width.toDouble());

  static final Widget verticalSpaceSmall = verticalSpace(10);
  static final Widget verticalSpaceMedium = verticalSpace(20);
  static final Widget verticalSpaceMediumLarge = verticalSpace(25);
  static final Widget verticalSpaceSemiLarge = verticalSpace(40);
  static final Widget verticalSpaceLarge = verticalSpace(60);
  static final Widget verticalSpaceExtraLarge = verticalSpace(100);

  static final Widget horizontalSpaceSmall = horizontalSpace(10);
  static final Widget horizontalSpaceMedium = horizontalSpace(20);
  static final Widget horizontalSpaceSemiLarge = horizontalSpace(40);
  static final Widget horizontalSpaceLarge = horizontalSpace(60);

  static Widget customDivider({double width = double.infinity}) =>
      Container(height: 0.6, color: Colors.black26, width: width);

  static double defaultPadding() => 16;
}

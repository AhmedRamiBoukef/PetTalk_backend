import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pe_talk/constants.dart';

class PeButton extends TextButton {
  final double height, width;
  PeButton({
    Key? key,
    required super.onPressed,
    this.height = 40.0,
    this.width = double.infinity,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    LinearGradient? gradient,
    String? label,
    String icon = '',
    Widget? son,
  }) : super(
          key: key,
          child: son ??
              Container(
                height: height,
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  color: mainClr,
                  gradient: gradient,
                ),
                child: Row(
                  children: [
                    icon != ''
                        ? SvgPicture.asset(getIcon(icon))
                        : const Spacer(),
                    if (icon != '')
                      const SizedBox(
                        width: 6,
                      ),
                    Text(
                      label!,
                      style: const TextStyle(
                        color: white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
        );
}

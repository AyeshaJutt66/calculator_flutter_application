import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String buttonText;
  final BorderRadius borderRadius;
  final GestureTapCallback onPressed;
  final double height;
  final double width;

  const ButtonWidget({
    super.key,
    required this.color,
    required this.textColor,
    required this.buttonText,
    required this.onPressed,
    required this.height,
    required this.width,
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: color,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  offset: Offset(-6, -6),blurRadius: 8
              ),
              BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  offset: Offset(6, 6),blurRadius: 8
              ),
            ],
          ),
          child: Material(
            color: color,
            borderRadius: borderRadius,
            child: InkWell(
              onTap: onPressed,
              borderRadius: borderRadius,
              splashColor: Colors.black.withValues(alpha: 0.1),
              highlightColor: Colors.black.withValues(alpha: 0.05),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(color: textColor, fontSize: 30),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

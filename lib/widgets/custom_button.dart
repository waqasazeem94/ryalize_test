import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final double? btnHeight;
  final double? btnWidth;
  final Color color;
  final BorderSide side;
  final double elevation;

  const CustomButton({
    Key? key,
    required this.name,
    this.btnHeight,
    this.btnWidth,
    required this.onTap,
    this.color = Colors.deepOrange,
    this.side = const BorderSide(width: 0, color: Colors.transparent),
    this.elevation = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight,
      width: btnWidth,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            side: side,
            elevation: elevation,
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(name, style: Theme.of(context).textTheme.headline6)),
    );
  }
}
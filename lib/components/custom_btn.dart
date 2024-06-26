import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animated_button/simple_animated_button.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
    required this.onPressed,
    required this.text,
    this.color = Colors.amber,
    this.bgcolor = Colors.green,
        this.fsize = 20,
    this.btnheight = 45,
    this.btnwidth = 200}
      ) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color bgcolor;
  final double btnheight;
  final double btnwidth;
  final double fsize;

  @override
  Widget build(BuildContext context) {
    return ElevatedLayerButton(
      buttonHeight: btnheight,

      buttonWidth: btnwidth,
      animationDuration: const Duration(milliseconds: 200),
      animationCurve: Curves.easeInOut,
      topDecoration: BoxDecoration(
      color: color,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(10),
      border: Border.all()),
      topLayerChild: Text(
      text,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: fsize,
      )),
      baseDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
      color: Colors.green,
      border: Border.all()),
      onClick: onPressed);
  }
}

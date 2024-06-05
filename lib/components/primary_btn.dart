import 'package:firebase_firestore_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: brightGreyColor,
        surfaceTintColor: brightGreyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
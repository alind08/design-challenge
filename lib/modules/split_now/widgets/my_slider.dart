// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_challenge/shared/global_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderView extends StatelessWidget {
  final String name;
  final String imagePath;
  final Color avatarBgColor;
  final int amount;
  const SliderView({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.avatarBgColor,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Container(
                      margin: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: avatarBgColor,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        imagePath,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                '₹ $amount',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Material(
          color: bgColor,
          child: Theme(
            data: ThemeData(
              scaffoldBackgroundColor: bgColor,
              primaryColor: bgColor,
              sliderTheme: SliderThemeData(
                overlappingShapeStrokeColor: bgColor,
                disabledSecondaryActiveTrackColor: bgColor,
                trackHeight: 30.0,
                trackShape: const RoundedRectSliderTrackShape(),
                activeTrackColor: avatarBgColor,
                inactiveTrackColor: darkBg,
                inactiveTickMarkColor: Colors.white,
                disabledActiveTickMarkColor: Colors.white,
                disabledInactiveTickMarkColor: Colors.white,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 17.0,
                  pressedElevation: 8.0,
                ),
                thumbColor: cardColor,
                showValueIndicator: ShowValueIndicator.never,
                overlayColor: cardColor.withOpacity(0.2),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
                tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 2),
                activeTickMarkColor: cardColor,
              ),
            ),
            child: Slider(
              min: 0.0,
              max: 1000.0,
              value: amount.toDouble(),
              divisions: 12,
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }
}

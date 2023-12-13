import 'package:design_challenge/modules/home/widgets/image_stack.dart';

import 'package:design_challenge/modules/split_now/widgets/separator.dart';
import 'package:design_challenge/shared/global_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplitNowCard extends StatelessWidget {
  const SplitNowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 24),
            width: double.infinity,
            height: 176,
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      'Receipt',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: bgColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28, 28, 50, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Title',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: bgColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Text(
                                'Team Dinner',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: bgColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Bill',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: bgColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Text(
                                '₹ 1000',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: bgColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.fromLTRB(30, 128, 30, 0),
              decoration: BoxDecoration(
                color: darkBg,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    "Splitting With",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ImageStack(
                    imageSource: ImageSource.Asset,
                    imageList: const [man1, man2, woman],
                    totalCount: 5,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 0,
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor,
              ),
            ),
          ),
          const Positioned(
            top: 40,
            child: MySeparator(color: bgColor),
          ),
        ],
      ),
    );
  }
}

import 'package:design_challenge/modules/home/widgets/header.dart';
import 'package:design_challenge/modules/home/widgets/nearby_card.dart';
import 'package:design_challenge/modules/home/widgets/recent_split_card.dart';
import 'package:design_challenge/shared/global_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/spillter_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 56, 16, 0),
        child: Column(
          children: [
            const HeaderWidget(),
            const SplitterCard(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: darkBg,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: bgColor,
                      ),
                      child: Image.asset(
                        info,
                        height: 26,
                        width: 26,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your previous split',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Text(
                          '₹ 200',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  width: double.infinity,
                  height: 305,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff383056),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 120),
                            Text(
                              'Nearby Friends',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'See all',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: lightPink,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 120),
                          NearbyCard(
                            avatarBgColor: bg2,
                            imagePath: woman,
                            name: 'Cony',
                          ),
                          Spacer(),
                          NearbyCard(
                            avatarBgColor: bg3,
                            imagePath: man2,
                            name: 'Ron',
                          ),
                          Spacer(),
                          NearbyCard(
                            avatarBgColor: bg1,
                            imagePath: man3,
                            name: 'Reia',
                          ),
                          Spacer(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                        child: Text(
                          'Recently Split',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            RecentSplitCard(
                              avatarBgColor: bg1,
                              imagePath: man1,
                              name: 'Jonny',
                            ),
                            SizedBox(width: 20),
                            RecentSplitCard(
                              avatarBgColor: bg2,
                              imagePath: man2,
                              name: 'Cony',
                            ),
                            SizedBox(width: 20),
                            RecentSplitCard(
                              avatarBgColor: bg3,
                              imagePath: man3,
                              name: 'Ron',
                            ),
                            SizedBox(width: 20),
                            RecentSplitCard(
                              avatarBgColor: bg4,
                              imagePath: woman,
                              name: 'Reia',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Container(
                      color: bgColor,
                      padding: const EdgeInsets.only(right: 12, bottom: 12),
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(26),
                          child: Image.asset(
                            search,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:design_challenge/modules/split_now/widgets/slider_button.dart';
import 'package:design_challenge/modules/split_now/widgets/split_now_header.dart';
import 'package:design_challenge/shared/global_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/my_slider.dart';
import 'widgets/split_now_card.dart';

class SplitNow extends StatelessWidget {
  const SplitNow({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
        child: Column(
          children: [
            const SplitNowHeader(),
            const SizedBox(height: 24),
            const SplitNowCard(),
            const SizedBox(height: 24),
            const SliderView(
              name: 'Jonny',
              imagePath: man1,
              avatarBgColor: bg1,
              amount: 300,
            ),
            const SliderView(
              name: 'Ron',
              imagePath: man2,
              avatarBgColor: bg2,
              amount: 500,
            ),
            const SliderView(
              name: 'Reia',
              imagePath: woman,
              avatarBgColor: bg3,
              amount: 200,
            ),
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: SwipeButton(
                onChanged: (value) {},
                height: 60,
                thumb: const Center(
                  child: Text(
                    'Confirm Split',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                content: const Center(child: AnimatedSlideUp()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

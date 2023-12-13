import 'package:design_challenge/modules/home/widgets/recent_split_card.dart';
import 'package:design_challenge/shared/global_const.dart';
import 'package:flutter/cupertino.dart';

class NearbyCard extends StatelessWidget {
  final Color avatarBgColor;
  final String imagePath;
  final String name;
  const NearbyCard({super.key, required this.avatarBgColor, required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 54,
          height: 87,
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: CupertinoColors.black.withOpacity(0.24),
                spreadRadius: 1,
                blurRadius: 20,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: RecentSplitCard(
            avatarBgColor: avatarBgColor,
            imagePath: imagePath,
            name: name,
          ),
        ),
        Positioned(
          left: 17,
          top: 76,
          child: Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: cardColor,
              image: DecorationImage(image: AssetImage(add)),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:doc_app/core/theme/color.dart';
import 'package:doc_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomTopBar extends StatelessWidget {
  const HomTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Hi, Fady',
        style: TextStyles.font18DarkBlueBold,
      ),
      subtitle: Text(
        'How Are you Today?',
        style: TextStyles.font12GrayRegular,
      ),
      trailing: CircleAvatar(
        radius: 24,
        backgroundColor: ColorsManager.moreLighterGray,
        child: SvgPicture.asset('assets/svgs/notifications.svg'),
      ) ,
    );
  }
}
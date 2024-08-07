import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsBlueContainer extends StatelessWidget {
  const DoctorsBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        fit: StackFit.passthrough,
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 195.h,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              image: const DecorationImage(
                image: AssetImage('assets/images/home_blue_pattern.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: DocTextButtonBlueContainer(),
          ),
          Positioned(
            right: 2.w,
            top: -40.h,
            bottom: 0.h,
            child: Image.asset(
              'assets/images/omar.png',
              height: 200.h,
              // fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

class DocTextButtonBlueContainer extends StatelessWidget {
  const DocTextButtonBlueContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Book and\nschedule with\nnearest doctor',
          style: TextStyles.font18WhiteMedium,
          textAlign: TextAlign.start,
        ),
        verticalSpace(16),
        Expanded(
          child: SizedBox(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48.0),
                ),
              ),
              child: Text(
                'Find Nearby',
                style: TextStyles.font12BlueRegular,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

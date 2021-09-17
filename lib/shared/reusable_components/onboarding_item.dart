import 'package:bis_commerce_project/models/on_boarding_model.dart';
import 'package:bis_commerce_project/shared/constatns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingItem extends StatelessWidget {
  final BoardingModel? boardingModel;

  OnBoardingItem({this.boardingModel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                boardingModel!.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: kMainColor,
                ),
              ),
            ),
            Expanded(
              child: SvgPicture.asset(
                boardingModel!.image,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                boardingModel!.body,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

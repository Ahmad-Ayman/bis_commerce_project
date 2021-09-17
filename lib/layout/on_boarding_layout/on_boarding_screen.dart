import 'package:bis_commerce_project/layout/home_layout/home_layout.dart';
import 'package:bis_commerce_project/shared/constatns.dart';
import 'package:bis_commerce_project/shared/reusable_components/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  IconData fabIcon = Icons.arrow_forward;
  Text fabTitle = Text('');
  bool isTitleShown = false;
  var boardingController = PageController();
  Color currentBackgroundColor = kBoardingDetails[0].color;
  void changeCurrentColor(selectedColorIndex) {
    setState(() {
      currentBackgroundColor = kBoardingDetails[selectedColorIndex].color;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        color: Theme.of(context).cardColor,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 15.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 1.0,
                    color: kSecondaryColor,
                  ),
                ),
                onPressed: () => finishBoarding(),
                child: Text(
                  'SKIP',
                  style: TextStyle(
                    color: kMainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    changeCurrentColor(index);
                    if (index == kBoardingDetails.length - 1) {
                      setState(() {
                        isLast = true;
                        fabIcon = Icons.done_outline;
                        fabTitle = const Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
                        isTitleShown = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                        fabIcon = Icons.arrow_forward;
                        fabTitle = const Text('');
                        isTitleShown = false;
                      });
                    }
                  },
                  controller: boardingController,
                  itemBuilder: (context, index) => OnBoardingItem(
                    boardingModel: kBoardingDetails[index],
                  ),
                  itemCount: kBoardingDetails.length,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardingController,
                    count: kBoardingDetails.length,
                    textDirection: TextDirection.ltr,
                    effect: ExpandingDotsEffect(
                      dotColor: kSecondaryColor,
                      activeDotColor: kMainColor,
                      dotHeight: 10.0,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5.0,
                    ),
                  ),
                  const Spacer(),
                  FloatingActionButton.extended(
                    backgroundColor: kMainColor,
                    onPressed: () {
                      if (isLast) {
                        finishBoarding();
                      } else {
                        boardingController.nextPage(
                          duration: const Duration(milliseconds: 550),
                          curve: Curves.easeInCirc,
                        );
                      }
                    },
                    icon: Icon(
                      fabIcon,
                      color: Colors.white,
                    ),
                    elevation: 4.0,
                    label: fabTitle,
                    isExtended: isTitleShown,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void finishBoarding() {
    kNavigateAndFinish(context, HomeLayout());
  }
}

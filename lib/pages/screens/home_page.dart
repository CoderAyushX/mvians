import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvians/controller/home_page_cont/qoutes_model_cont.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';
import 'package:mvians/widgets/pages_widgets/home_page/appbar.dart';
import 'package:mvians/widgets/pages_widgets/home_page/courses_widgets.dart';
import 'package:mvians/widgets/pages_widgets/home_page/top_teachers.dart';
import 'package:mvians/widgets/smalltext.dart';

class MainHomePage extends StatelessWidget {
  MainHomePage({Key? key}) : super(key: key);

  final QoutesController _qoutesController = Get.find();

  //? to greet student
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: BaseAppBar(
        title: Text(greeting()),
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //? body
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  BigText(
                    text: "Notice board",
                    size: Dimensions.font12 * 2,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),

                  //*notice board

                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.width10,
                      horizontal: Dimensions.height10,
                    ),
                    height: Dimensions.height150 - Dimensions.height15,
                    decoration: BoxDecoration(
                      color: AppColors.lightDarkColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                    ),
                    child: Row(
                      children: [
                        //? text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(
                                text: "Virtual STEM for class 9th and 12th",
                                size: Dimensions.font12 * 2,
                                fontWeight: FontWeight.w700,
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(50, 30),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft),
                                child: Text(
                                  "Read more",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.lightBlueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //? image

                        Image.network(
                            "https://i.postimg.cc/9fRpMSRf/Teaching-rafiki.png")
                      ],
                    ),
                  ),

                  SizedBox(
                    height: Dimensions.height30,
                  ),

                  //? grid
                  BigText(
                    text: "Explore",
                    size: Dimensions.font12 * 2,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 55,
                    ),
                    shrinkWrap: true,
                    children: [
                      TopButtonCards(
                        name: "events",
                        icon: Icon(
                          Icons.event_available_rounded,
                          color: AppColors.lightBlueColor,
                          size: Dimensions.iconSize16 * 1.8,
                        ),
                      ),
                      TopButtonCards(
                        name: "schedule",
                        icon: Icon(
                          Icons.schedule_rounded,
                          color: AppColors.lightBlueColor,
                          size: Dimensions.iconSize16 * 1.8,
                        ),
                      ),
                      TopButtonCards(
                        name: "peoples",
                        icon: Icon(
                          Icons.people_alt_rounded,
                          color: AppColors.lightBlueColor,
                          size: Dimensions.iconSize16 * 1.8,
                        ),
                      ),
                      TopButtonCards(
                        name: "books",
                        icon: Icon(
                          Icons.menu_book_rounded,
                          color: AppColors.lightBlueColor,
                          size: Dimensions.iconSize16 * 1.8,
                        ),
                      ),
                      TopButtonCards(
                        name: "scholarship",
                        icon: Icon(
                          Icons.school_rounded,
                          color: AppColors.lightBlueColor,
                          size: Dimensions.iconSize16 * 1.8,
                        ),
                      ),
                      TopButtonCards(
                        name: "gallery",
                        icon: Icon(
                          Icons.photo_camera_rounded,
                          color: AppColors.lightBlueColor,
                          size: Dimensions.iconSize16 * 1.8,
                        ),
                      ),
                    ],
                  ),

                  //? teachers

                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: "Top teachers",
                        size: Dimensions.font12 * 2,
                        fontWeight: FontWeight.bold,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.lightDarkColor,
                            fixedSize: const Size(75, 0),
                            padding: const EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text("view all"),
                      ),
                    ],
                  ),

                  //? teachers list

                  SizedBox(
                    height: Dimensions.height150 * 1.1,
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return const TopTeacherWidgets();
                      },
                    ),
                  ),

                  SizedBox(
                    height: Dimensions.height35,
                  ),

                  //? courses
                  BigText(
                    text: "Courses",
                    size: Dimensions.font12 * 2,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),

                  const CoursesWidgets(),

                  SizedBox(
                    height: Dimensions.height35,
                  ),

                  //? motivation
                  BigText(
                    text: "Today's motivation",
                    size: Dimensions.font12 * 2,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),

                  qoutesWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//* qoutes widget
  Widget qoutesWidget() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.height45 / 2, horizontal: Dimensions.width20),
      height: Dimensions.height150,
      decoration: BoxDecoration(
        color: AppColors.lightDarkColor,
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15.0,
            offset: Offset(0.0, 0.75),
          ),
        ],
      ),
      child: Obx(
        () {
          return _qoutesController.isLoding.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    BigText(
                      text: _qoutesController.qoutesList[0].content,
                      overflow: TextOverflow.visible,
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.topRight,
                      child: SmallText(
                          text: _qoutesController.qoutesList[0].author),
                    ),
                    const Spacer(),
                  ],
                );
        },
      ),
    );
  }
}

//* tab buttons
class TopButtonCards extends StatelessWidget {
  const TopButtonCards({Key? key, required this.name, required this.icon})
      : super(key: key);
  final String name;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(Dimensions.radius10),
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.lightDarkColor,
          borderRadius: BorderRadius.circular(Dimensions.radius10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              height: Dimensions.height10 * 0.4,
            ),
            BigText(
              text: name,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
              size: Dimensions.font18,
            )
          ],
        ),
      ),
    );
  }
}

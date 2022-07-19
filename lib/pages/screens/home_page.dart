import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';
import 'package:mvians/widgets/pages_widgets/home_page/appbar.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

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
                      color: Colors.black,
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
                                      color: AppColors.redColor),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //? image

                        Image.network(
                            "https://i.postimg.cc/T2JxRyyK/Back-to-school-pana.png")
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
                          color: AppColors.lightRedColor,
                          size: Dimensions.iconSize16 * 1.8,
                        ),
                      ),
                      TopButtonCards(
                        name: "schedule",
                        icon: Icon(
                          Icons.schedule_rounded,
                          color: AppColors.lightRedColor,
                          size: Dimensions.iconSize16 * 1.8,
                        ),
                      ),
                      TopButtonCards(
                        name: "peoples",
                        icon: Icon(
                          Icons.people_alt_rounded,
                          color: AppColors.lightRedColor,
                          size: Dimensions.iconSize16 * 1.8,
                        ),
                      ),
                      TopButtonCards(
                        name: "books",
                        icon: Icon(
                          Icons.menu_book_rounded,
                          color: AppColors.lightRedColor,
                          size: Dimensions.iconSize16 * 1.8,
                        ),
                      ),
                      TopButtonCards(
                        name: "scholarship",
                        icon: Icon(
                          Icons.school_rounded,
                          color: AppColors.lightRedColor,
                          size: Dimensions.iconSize16 * 1.8,
                        ),
                      ),
                      TopButtonCards(
                        name: "gallery",
                        icon: Icon(
                          Icons.photo_camera_rounded,
                          color: AppColors.lightRedColor,
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
                      itemCount: 1,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: Dimensions.height150 * 1.1,
                          child: Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: Dimensions.height150,
                                  height: Dimensions.height150,
                                  decoration: BoxDecoration(
                                      color: AppColors.black,
                                      border:
                                          Border.all(color: AppColors.redColor),
                                      shape: BoxShape.circle),
                                ),
                                Positioned(
                                  top: 5,
                                  bottom: 5,
                                  left: 5,
                                  right: 5,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://i.postimg.cc/SKyt2Z1P/pijus.jpg'),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 5,
                                  left: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius30 * 5),
                                      color: AppColors.lightRedColor,
                                    ),
                                    height: Dimensions.height20 * 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        BigText(
                                          text: "pijus sir",
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.bgColor,
                                        ),
                                        SizedBox(
                                          width: Dimensions.width10 / 2,
                                        ),
                                        Icon(
                                          CupertinoIcons.checkmark_seal_fill,
                                          color: Colors.blue,
                                          size: Dimensions.iconSize16,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(
                    height: Dimensions.height150,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
          color: AppColors.black,
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

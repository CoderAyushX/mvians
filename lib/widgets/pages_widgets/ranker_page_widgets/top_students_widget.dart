import 'package:flutter/material.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';
import 'package:get/get.dart';

class TopStudentsWidgets extends StatelessWidget {
  TopStudentsWidgets({Key? key, required this.rank, required this.studentsName})
      : super(key: key);
  final String rank, studentsName;

  final RxBool showPercentage = false.obs;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
  
      width: Dimensions.height150- Dimensions.font20,
      child: GestureDetector(
        onTap: () {
          showPercentage(!showPercentage.value);

        },
        child: Center(
          child: Stack(
            children: [
              //? border
              Container(
                width: Dimensions.height150 - Dimensions.height20,
                height: Dimensions.height150 - Dimensions.height20,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  border: Border.all(color: AppColors.blueColor, width: 2),
                  shape: BoxShape.circle,
                ),
              ),
              //? image
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
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHnPmUvFLjjmoYWAbLTEmLLIRCPpV_OgxCVA&usqp=CAU'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              //? percentage
              Obx(() {
                return Positioned(
                  top: 5,
                  bottom: 5,
                  left: 5,
                  right: 5,
                  child: showPercentage.value
                      ? Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(.8)),
                          child: Center(
                            child: BigText(
                              text: "99%",
                              color: AppColors.bgColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Container(),
                );
              }),
              //? which rank
              Positioned(
                top: 1.5,
                right: 30,
                left: 30,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.blueColor,
                  ),
                  height: Dimensions.height20 * 1.2,
                  child: Center(
                    child: BigText(
                      text: rank,
                      fontWeight: FontWeight.w600,
                      color: AppColors.whiteColor,
                      size: Dimensions.font16,
                    ),
                  ),
                ),
              ),
              //? name
              Positioned(
                bottom: 0,
                right: 5,
                left: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius30 * 5),
                    color: AppColors.lightBlueColor,
                  ),
                  height: Dimensions.height20 * 1.5,
                  padding: EdgeInsets.all(Dimensions.width10 / 1.5),
                  child: Center(
                    child: BigText(
                      text: studentsName,
                      fontWeight: FontWeight.w600,
                      color: AppColors.bgColor,
                      size: Dimensions.font16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

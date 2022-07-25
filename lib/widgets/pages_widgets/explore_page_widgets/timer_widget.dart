import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  State<TimerWidget> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<TimerWidget> {
  final DateTime end = DateTime(2023, 03, 20);

  //? use values
  final _second = 1000;
  late final int _minute = _second * 60;
  late final int _hour = _minute * 60;
  late final int _day = _hour * 24;
  late Timer _timer;

//* coming valuse
  String days = "---";
  String hours = "--";
  String minutes = "--";

//* method
  void startTimer() {
    //? refresh time
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (end.difference(DateTime.now()).inHours == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          var now = DateTime.now();
          final Duration duration = end.difference(now);
          int distance = duration.inMilliseconds;
          //? raw data to add zero
          var rawDays = (distance / _day).floor();
          var rawHours = ((distance % _day) / _hour).floor();
          var rawMinutes = ((distance % _hour) / _minute).floor();

          setState(() {
            if (rawDays > 100 || rawDays == 100) {
              days = rawDays.toString();
            } else if (rawDays > 9 && rawDays < 100) {
              days = "0$rawDays";
            } else if (rawDays < 10) {
              days = "00$rawDays";
            }

            hours = rawHours < 10 ? "0$rawHours" : rawHours.toString();
            minutes = rawMinutes < 10 ? "0$rawMinutes" : rawMinutes.toString();
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.height15,
        ),
        BigText(
          text: "Explore",
          size: Dimensions.font26,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: Dimensions.height15,
        ),
        Container(
          height: Dimensions.height150 * 1.4,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColors.blueColor,
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75)),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.height15),
            child: Column(
              children: [
                BigText(
                  text: "Time left to complete the currrent session!",
                  size: Dimensions.font22,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeBoxs(names: "Days", times: days, thirdBox: true),
                    SizedBox(
                      width: Dimensions.width20,
                    ),
                    TimeBoxs(
                      names: "Hours",
                      times: hours,
                    ),
                    SizedBox(
                      width: Dimensions.width20,
                    ),
                    TimeBoxs(
                      names: "Minutes",
                      times: minutes,
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TimeBoxs extends StatefulWidget {
  const TimeBoxs(
      {Key? key,
      required this.names,
      required this.times,
      this.thirdBox = false})
      : super(key: key);

  final String names, times;
  final bool thirdBox;
  @override
  State<TimeBoxs> createState() => _TimeBoxsState();
}

class _TimeBoxsState extends State<TimeBoxs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            //? 1st box
            Container(
              width: Dimensions.width45 * 2,
              height: Dimensions.height45 * 2,
              decoration: BoxDecoration(
                color: AppColors.lightBlueColor,
                borderRadius: BorderRadius.circular(Dimensions.radius10),
              ),
              child: Center(
                  child: BigText(
                text: widget.times[0],
                size: Dimensions.font30,
                fontWeight: FontWeight.w600,
                color: AppColors.lightDarkColor,
              )),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            //? second box
            Container(
              width: Dimensions.width45 * 2,
              height: Dimensions.height45 * 2,
              decoration: BoxDecoration(
                color: AppColors.lightBlueColor,
                borderRadius: BorderRadius.circular(Dimensions.radius10),
              ),
              child: Center(
                child: BigText(
                  text: widget.times[1],
                  size: Dimensions.font30,
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightDarkColor,
                ),
              ),
            ),

            //? third
            widget.thirdBox
                ? Row(
                    children: [
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      Container(
                        width: Dimensions.width45 * 2,
                        height: Dimensions.height45 * 2,
                        decoration: BoxDecoration(
                          color: AppColors.lightBlueColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius10),
                        ),
                        child: Center(
                          child: BigText(
                            text: widget.times[2],
                            size: Dimensions.font30,
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightDarkColor,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),

        //? names
        SizedBox(
          height: Dimensions.height10 / 2,
        ),
        BigText(
          text: widget.names,
          fontWeight: FontWeight.w600,
          size: Dimensions.font18,
        )
      ],
    );
  }
}

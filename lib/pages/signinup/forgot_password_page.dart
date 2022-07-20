import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvians/controller/auth/auth_controller.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';
import 'package:mvians/widgets/singupinWidgets/backbutton_text.dart';
import 'package:mvians/widgets/singupinWidgets/email_textfield_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController _textcontroller;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _textcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),

            //? form 
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BackButtonForAuth(
                      text: "Forgot Password", size: Dimensions.font16 * 1.8),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  Image.asset(
                    "assets/images/forgotpass.png",
                    height: Dimensions.height150 * 1.6,
                  ),
                  BigText(
                    text: "Receive and email to\nreset your password",
                    size: Dimensions.font16 * 1.8,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: Dimensions.height30 * 2,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: BigText(
                      text: "Enter Your Email",
                      size: Dimensions.font22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),

                  EmailTextField(controller: _textcontroller),

                  SizedBox(
                    height: Dimensions.height45,
                  ),
                  //? button
                  InkWell(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        AuthController.instance.resetpass(
                          _textcontroller.text.trim(),
                        );
                      }
                    },
                    child: Ink(
                      height: Dimensions.height45 * 1.25,
                      width: Dimensions.screenWidth - 10,
                      decoration: BoxDecoration(
                  color: AppColors.blueColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius30)),
                      child: Obx(() {
                        return Center(
                          child: AuthController.instance.isNotLoding.value
                              ? Text(
                                  "Forgot password",
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: Dimensions.font26,
                                      fontWeight: FontWeight.bold),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      SizedBox(
                                        height: Dimensions.height30,
                                        width: Dimensions.height30,
                                        child: CircularProgressIndicator(
                                            color: AppColors.whiteColor),
                                      ),
                                      SizedBox(width: Dimensions.width20),
                                      Text(
                                        "Sending",
                                        style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: Dimensions.font26,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ]),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

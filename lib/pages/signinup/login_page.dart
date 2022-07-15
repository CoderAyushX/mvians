import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvians/controller/auth/auth_controller.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';
import 'package:flutter/gestures.dart';
import 'package:mvians/widgets/singupinWidgets/backbutton_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _textcontroller;
  late TextEditingController _passController;
  late bool _passwordVisible;

  @override
  void initState() {
    _textcontroller = TextEditingController();
    _passController = TextEditingController();
    _passwordVisible = false;
    super.initState();
  }

  @override
  void dispose() {
    _textcontroller.dispose();
    _passController.dispose();
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   BackButtonForAuth(text: "Log in", size: Dimensions.font16 * 2),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/login.png",
                        height: Dimensions.height150 * 1.6,
                      )),

                  //? first input
                  BigText(
                    text: "Email",
                    size: Dimensions.font22,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  emailWidget(
                    RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"),
                  ),
                  //? gap
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  //? second input

                  BigText(
                    text: "Password",
                    size: Dimensions.font22,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),

                  passWidget(),
                  //? forgot button
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed("/forgotPass");
                      },
                      child: BigText(
                        text: "Forgot password?",
                        color: AppColors.redColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  //? button
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        AuthController.instance.login(
                          _textcontroller.text.trim(),
                          _passController.text.trim(),
                        );
                      }
                    },
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    child: Ink(
                      height: Dimensions.height45 * 1.25,
                      width: Dimensions.screenWidth - 10,
                      decoration: BoxDecoration(
                          color: AppColors.redColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius30)),
                      child: Obx(() {
                        return Center(
                          child: AuthController.instance.isNotLoding.value
                              ? Text(
                                  "Login",
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
                                        "Please wait",
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

                  SizedBox(
                    height: Dimensions.height35,
                  ),
                  //? to sigin page
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\' have a account?',
                        style: TextStyle(
                            fontSize: Dimensions.font18,
                            color: AppColors.whiteColor),
                        children: [
                          TextSpan(
                              text: 'Register',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.redColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.toNamed("/signin")),
                        ],
                      ),
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

//* widgets
  Widget passWidget() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: _passController,
      obscureText: !_passwordVisible,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.security_outlined,
          color: AppColors.whiteColor,
        ),
        hintText: 'Enter your password',
        suffixIcon: IconButton(
          splashRadius: 20,
          icon: Icon(
            _passwordVisible
                ? Icons.visibility_rounded
                : Icons.visibility_off_rounded,
            color: AppColors.whiteColor,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
        hintStyle: const TextStyle(color: Color.fromARGB(255, 143, 143, 143)),
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 143, 143, 143)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 143, 143, 143),
          ),
        ),
      ),
    );
  }

  Widget emailWidget(RegExp regExp) {
    return TextFormField(
      //? validating user input
      validator: (value) {
        if (value!.isEmpty || !regExp.hasMatch(value)) {
          return "Enter a correct email!";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.text,
      controller: _textcontroller,
      maxLines: 1,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.email_outlined,
          color: AppColors.whiteColor,
        ),
        hintText: "ayushku@gmail.com",
        hintStyle: const TextStyle(color: Color.fromARGB(255, 143, 143, 143)),
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 143, 143, 143)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          borderSide: BorderSide(
            color: AppColors.redColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          borderSide: BorderSide(
            color: AppColors.redColor,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 143, 143, 143),
          ),
        ),
      ),
    );
  }
}

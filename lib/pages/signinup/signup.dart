import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _textcontroller;
  late TextEditingController _passController;
  late TextEditingController _conPassController;
  late bool _passwordVisible;
  @override
  void initState() {
    _textcontroller = TextEditingController();
    _passController = TextEditingController();
    _conPassController = TextEditingController();
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
                  Row(
                    children: [
                      //? back button
                      InkWell(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.height10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.7),
                                width: .8),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                          ),

                          //? back icon
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColors.whiteColor,
                            size: Dimensions.iconSize24 * 1.2,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.width45 * 1.2,
                      ),
                      //? page header
                      BigText(
                        text: "Sign in",
                        size: Dimensions.font16 * 2,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/signup.png",
                        height: Dimensions.height150 * 1.5,
                      )),

                  //? first input
                  BigText(
                    text: "Email",
                    size: Dimensions.font20,
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
                    size: Dimensions.font20,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),

                  passWidget("Enter a password", _passController),

                  //? third input

                  SizedBox(
                    height: Dimensions.height20,
                  ),

                  BigText(
                    text: "Confirm Password",
                    size: Dimensions.font20,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),

                  conpassWidget("Re-enter your password", _conPassController,
                      _passController),
                  SizedBox(
                    height: Dimensions.height35,
                  ),
                  //? button
                  InkWell(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Get.offNamed("/welcome");
                      }
                    },
                    child: Ink(
                      height: Dimensions.height45 * 1.25,
                      width: Dimensions.screenWidth - 10,
                      decoration: BoxDecoration(
                          color: AppColors.redColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius30)),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: Dimensions.font26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  //? to logn page
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have a account?',
                        style: TextStyle(
                            fontSize: Dimensions.font18,
                            color: AppColors.whiteColor),
                        children: [
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.redColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.offAllNamed("/login")),
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
  Widget passWidget(String text, TextEditingController controller) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      obscureText: !_passwordVisible,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.security_outlined,
          color: AppColors.whiteColor,
        ),
        hintText: text,
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

  //* confirm pass
  Widget conpassWidget(
      String text, TextEditingController controller, validator) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty || value != validator.text) {
          return "Password not matching";
        } else {
          return null;
        }
      },
      obscureText: !_passwordVisible,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.security_outlined,
          color: AppColors.whiteColor,
        ),
        hintText: text,
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

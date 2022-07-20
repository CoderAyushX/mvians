import 'package:flutter/material.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';

class EmailTextField extends StatelessWidget {
  
  const EmailTextField({Key? key , required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //? validating user input
      validator: (value) {
        if (value!.isEmpty ||
            !RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                .hasMatch(value)) {
          return "Enter a correct email!";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.text,
      controller: controller,
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
            color: AppColors.blueColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          borderSide: BorderSide(
            color: AppColors.blueColor,
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginController());

  LoginScreen({super.key});

  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 0.35 * h,
                  width: w,
                  // color: Colors.green,
                ),
                Container(
                  height: 0.40 * h,
                  width: w,
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    // color: AppColors.secondaryy,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border(),
                    //Color(0xFF6FCC76)
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1a9E9E9E),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 12.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: controller.emailController,
                          decoration: const InputDecoration(
                              labelText: "Email", border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextField(
                          controller: controller.passwordController,
                          decoration: const InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder()),
                        ),
                        Spacer(),
                        ElevatedButton(
                            onPressed: () async {
                              await controller.signIn();
                              // await FirebaseAuth.instance.signInWithEmailAndPassword(email: controller.emailController.text.toString(), password: controller.passwordController.text.toString());
                            },
                            child: Text("Login")),
                        Spacer(),
                        // GestureDetector(
                        //     onTap: () async{
                        //       print("hfioafhios");
                        //       await controller.signInWithGoogle(context);
                        //     },
                        //     child: SvgPicture.asset('assets/google_icon.svg')),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 0.06 * h,
                  width: w,
                  color: Colors.green,
                  // child: ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//

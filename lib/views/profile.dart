import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quiz/models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel user = UserModel();
  getAddress(String key) {
    try {
      //city
      //state
      //pincode
      return jsonDecode(user.address!)["billing"][key]!.toString();
    } catch (e) {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color bgColor3 = Color(0xFF5170FD);
    const Color bgColor = Color(0xFF4993FA);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: bgColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: double.infinity,
              // color: bgColor3,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                      image: AssetImage('assets/3.jpg'), fit: BoxFit.cover)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CircleAvatar(
                      maxRadius: size.height * .065,
                      backgroundImage: AssetImage('assets/quiz.png'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.orange),
                        borderRadius: BorderRadius.circular(7)),
                    child: Text(
                      "+91${user.phoneNumber ?? "xxxxxxxxxx"}",
                      style: const TextStyle(color: Colors.white, fontSize: 19),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(bottom: 20),
                  //     child: Align(
                  //       alignment: Alignment.bottomCenter,
                  //       child: ElevatedButton(
                  //           onPressed: () {
                  //             Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) =>
                  //                         const MobileNumberScreen()));
                  //           },
                  //           child: Text(
                  //             'Add Account',
                  //             style: TextStyle(
                  //                 color: bgColor3,
                  //                 fontSize: 14,
                  //                 fontWeight: FontWeight.bold),
                  //           )),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

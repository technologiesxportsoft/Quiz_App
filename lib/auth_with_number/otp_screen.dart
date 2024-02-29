// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/views/home_screen.dart';
import 'package:flutter_quiz/views/tabbar.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const OtpScreen(
      {Key? key, required this.verificationId, required this.phoneNumber})
      : super(key: key);

  @override
  State<OtpScreen> createState() =>
      _OtpScreenState(phoneNumber: this.phoneNumber);
}

class _OtpScreenState extends State<OtpScreen> {
  final String phoneNumber;
  _OtpScreenState({required this.phoneNumber});
  final otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isValid = false;
  var code = '';

  bool loading = false;
  bool isLoading = false;
  late Timer countdownTimer;
  int resendTime = 60;

  startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if (resendTime < 1) {
        stopTimer();
      }
    });
  }

  stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  void resendOtp() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        },
        verificationFailed: (FirebaseAuthException e) {
          SnackBar snackBar = const SnackBar(
              content: Text("Something went wrong, pleaes try again later"));
          if (e.code == 'too-many-requests') {
            snackBar = const SnackBar(
              content: Text('Too Many Attempts'),
            );
          } else {
            snackBar = const SnackBar(
              content: Text('Something Went Wrong, Try Again later.'),
            );
          }
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        codeSent: (String verificationId, int? resendToken) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => OtpScreen(
          //       verificationId: verificationId,
          //     ),
          //   ),
          // );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      SnackBar snackBar = const SnackBar(
          content: Text("Something went wrong, pleaes try again later"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    const Color bgColor3 = Color(0xFF5170FD);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor3,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 30),
              child: Row(
                children: [
                  Text(
                    'Enter OTP',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: bgColor3),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Form(
                              key: _formKey,
                              child: Pinput(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '';
                                  } else if (value.length < 6) {
                                    return '';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: otpController,
                                showCursor: false,
                                focusedPinTheme: PinTheme(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            style: BorderStyle.solid,
                                            color: Colors.red),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16)))),
                                defaultPinTheme: PinTheme(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    height: (width - 16) / 8,
                                    width: (width - 16) / 8,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            style: BorderStyle.solid,
                                            color: bgColor3),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)))),
                                length: 6,
                                onChanged: (value) {
                                  code = value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () async {
                          try {
                            // homeProvider.showLoader();
                            setState(() {
                              isLoading = true;
                            });
                            Future.delayed(Duration(seconds: 2), () {
                              setState(() {
                                isLoading = false;
                              });
                            });
                            PhoneAuthCredential cred =
                                PhoneAuthProvider.credential(
                                    verificationId: widget.verificationId,
                                    smsCode: otpController.text.toString());
                            FirebaseAuth.instance
                                .signInWithCredential(cred)
                                .then((value) => {
                                      stopTimer(),
                                      // DatabaseProvider().insertUser(UserModel(
                                      //     name:
                                      //         value.user?.displayName ?? "User",
                                      //     email: value.user?.email ?? "",
                                      //     phoneNumber: phoneNumber)),
                                      // homeProvider.hideLoader(),
                                      setState(() {
                                        isLoading = false;
                                      }),
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const TabBarScreen()))
                                    })
                                .catchError((e) {
                              SnackBar snackBar = const SnackBar(
                                  content:
                                      Text('The OTP you provide is Invalid'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return {false};
                            });
                          } catch (e) {
                            const snackBar = SnackBar(
                              content:
                                  Text('Something went wrong, try again later'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                          // finally {
                          //   setState(() {
                          //     isLoading = false;
                          //   });
                          // }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: const BoxDecoration(
                              color: bgColor3,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: isLoading
                              ? Center(
                                  child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ))
                              : const Text(
                                  'Verify',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ),
                      resendTime == 0
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 15),
                              child: GestureDetector(
                                onTap: () async {
                                  // homeProvider.showLoader();
                                  resendOtp();
                                  // homeProvider.hideLoader();
                                },
                                child: const Text(
                                  'Resend OTP',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.bold,
                                    color: bgColor3,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      resendTime != 0
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                'You can resend OTP after $resendTime second(s)',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Nuntio',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            )
                          : const SizedBox(),
                      // const Padding(
                      //   padding:
                      //       EdgeInsets.symmetric(vertical: 13, horizontal: 32),
                      //   child: Text(
                      //     termsText,
                      //     style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 12,
                      //     ),
                      //     textAlign: TextAlign.center,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

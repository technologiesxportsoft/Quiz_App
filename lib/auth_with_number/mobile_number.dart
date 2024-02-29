import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quiz/auth_with_number/otp_screen.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({super.key});

  static String verify = '';
  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController countryCode = TextEditingController();

  final auth = FirebaseAuth.instance;
  bool loading = false;
  bool isloading = false;
  // final _client = ApiClient();

  // final SmsAutoFill _autoFill = SmsAutoFill();

  final _formKey = GlobalKey<FormState>();

  var phone = '';

  // bool validateAndSave(context) {
  //   final FormState form = _formKey.currentState!;
  //   if (form.validate()) {
  //     // Navigator.push(
  //     //     context, MaterialPageRoute(builder: (context) => OtpScreen()));
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future _sendOtp() async {
    // final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    // homeProvider.showLoader();
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: countryCode.text + _phoneController.text.toString(),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // await DatabaseProvider()
          //     .insertUser(UserModel(phoneNumber: _phoneController.text));
          // final Map response = await _client.callPostAPI(registerEndpoint,
          //     {"email": _phoneController.text, "password": '123456789'});

          // print('response-----------------------------${response}');

          try {
            if (mounted) {
              setState(() {
                // Your setState logic here, if needed
              });
            }

            UserCredential authResult =
                await auth.signInWithCredential(credential);

            // Access the user's phone number
            String phoneNumber = authResult.user?.phoneNumber ?? '';

            // Save the user's phone number to the database
            // await DatabaseProvider().insertUser(
            //   UserModel(
            //     phoneNumber: phoneNumber,
            //   ),
            // );

            // Perform other actions after successful authentication and database update
          } catch (e) {
            print('Error during verificationCompleted: $e');
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          SnackBar snackBar = SnackBar(
              content: Text("Something went wrong, pleaes try again later $e"));
          if (e.code == 'invalid-phone-number') {
            snackBar = const SnackBar(
              content: Text('The provided phone number is not valid.'),
            );
          } else if (e.code == 'too-many-requests') {
            snackBar = const SnackBar(
              content: Text('Too Many Attempts'),
            );
          }
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OtpScreen(
                    verificationId: verificationId,
                    phoneNumber: _phoneController.text)),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      // Handle verification initiation error
      print('Error sending OTP: $e');
    } finally {
      // homeProvider.hideLoader();
    }
  }

  @override
  void initState() {
    countryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const Color bgColor3 = Color(0xFF5170FD);

    // final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: bgColor3,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.transparent,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                borderRadius: BorderRadius.circular(13),
                image: DecorationImage(
                    image: AssetImage('assets/3.jpg'), fit: BoxFit.cover)),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your Quiz App',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/1.jpg',
                        scale: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 30),
                      child: Row(
                        children: [
                          Text(
                            'Enter Your Phone Number',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 152, 201, 245),
                            border: Border.all(width: .4),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2, color: bgColor3),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              SizedBox(
                                                width: 40,
                                                child: TextField(
                                                  controller: countryCode,
                                                  decoration:
                                                      const InputDecoration(
                                                          border:
                                                              InputBorder.none),
                                                ),
                                              ),
                                              const Text(
                                                '|',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: bgColor3),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value!.length != 10)
                                                      return "Invalid phone number";
                                                    return null;
                                                  },
                                                  controller: _phoneController,
                                                  // onTap: () async {
                                                  //   _phoneController.text =
                                                  //       (await _autoFill.hint)!;
                                                  // },
                                                  onChanged: (value) {
                                                    phone = value;
                                                  },
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                    LengthLimitingTextInputFormatter(
                                                        10)
                                                  ],
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText:
                                                        'enter mobile number',
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          isloading = true;
                                        });
                                        Future.delayed(Duration(seconds: 2),
                                            () {
                                          // After the task is complete, reset the loading state
                                          setState(() {
                                            isloading = false;
                                          });
                                        });
                                        _sendOtp();
                                      },
                                      child: isloading
                                          ? Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            )
                                          : const Text(
                                              'Send otp',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(right: 16, bottom: 10),
                    //     child: ElevatedButton(
                    //         onPressed: () {
                    //           Navigator.pushReplacement(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       const TabBarScreen()));
                    //         },
                    //         child: Text(
                    //           'Skip..',
                    //           style: TextStyle(
                    //               color: bgColor3,
                    //               fontSize: 14,
                    //               fontWeight: FontWeight.bold),
                    //         )),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hello_flutter/ui/category/categories.dart';
import 'package:hello_flutter/ui/commonwidget/textfield/logintextfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phone = "";
  String password = "";
  bool isValidInput = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/img_background_splash.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.only(top: 100.0, left: 30.0, right: 30.0),
          color: Colors.black.withOpacity(0.5),
          child: Column(
            children: [
              Text(
                "SIGN IN",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              LoginTextField(
                title: "Phone",
                placeHolder: "Input phone number",
                textInputType: TextInputType.number,
                onChangedCallback: (String value) {
                  updatePhone(value);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              LoginTextField(
                title: "Password",
                placeHolder: "Input password",
                isHiddenInput: true,
                onChangedCallback: (String value) {
                  updatePassword(value);
                },
              ),
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    print("[TODO] Tapped on forgot password button");
                  },
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                width: double.infinity,
                height: 40.0,
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextButton(
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context)
                            .primaryColor
                            .withOpacity(isValidInput ? 1.0 : 0.4)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                    ),
                  ),
                  onPressed: isValidInput ? handleTapLoginButton : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updatePhone(String value) {
    phone = value;
    handleUpdateState();
  }

  void updatePassword(String value) {
    password = value;
    handleUpdateState();
  }

  void handleUpdateState() {
    setState(() {
      isValidInput = phone.isNotEmpty && password.isNotEmpty;
    });
  }

  void handleTapLoginButton() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => CategoriesScreen()));
  }
}

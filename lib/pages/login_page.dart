import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white, // it matches with the inserted image
      child:

          //  Center(
          //   child:
          //    Text(
          //     "Login Page",
          //     style: TextStyle(
          //       color: Colors.blue,
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //     ),
          //     textScaleFactor: 2.0, // it scale the fontsize by fontSize*2.0=16.0
          //   ),
          // )
          Column(
        children: [
          Image.asset(
            "assets/images/login_image.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Welcome",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  obscureText: true, // password text hidden
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(),
                  onPressed: () {
                    print("object");
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

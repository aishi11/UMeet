import 'package:flutter/material.dart';
import 'package:umeet/main.dart';
import 'package:umeet/sign_up.dart';
import 'package:umeet/recruitment_details_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
// Function to handle login
    void _login() {
      String email = emailController.text;
      String password = passwordController.text;

      // Check if email is "user" and password is "1234"
      if (email.isEmpty || password.isEmpty) {
        // Display a message if either field is empty
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: const Text("Please enter both email and password."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              )
            ],
          ),
        );
      } else if (email == "user" && password == "1234") {
        // Successful login
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomePage()), // Navigasi ke halaman berikutnya
        );
      } else {
        // Incorrect email or password
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: const Text("Invalid email or password. Please try again."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              )
            ],
          ),
        );
      }
    }

    Widget _buildEmail() {
      return Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 6,
              color: Colors.grey.shade400,
            ),
          ]),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter your Email";
              }
            },
            controller: emailController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock_outline_rounded),
                hintText: 'Enter your email'),
          ));
    }

    Widget _buildPassword() {
      return Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 6,
              color: Colors.grey.shade400,
            ),
          ]),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter your Password";
              }
            },
            controller: passwordController, // Perbaiki controller di sini
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email_outlined),
                hintText: 'Enter your password'),
          ));
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/loginbg3.png"),
            fit: BoxFit.cover, //
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 300, // Atur tinggi sesuai kebutuhan
              child: Stack(
                children: [
                  Positioned(
                    top: 230,
                    left: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Please sign in to continue.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  _buildEmail(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildPassword(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'FORGET',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFCA148)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: _login, // Jalankan fungsi login ketika di-klik
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(colors: [
                            Color(0xff5C83A3),
                            Color(0xff3470A2),
                          ])),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "LOGIN",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have any account? ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const SignUp()),
                          );
                        },
                        child: const Text(
                          "Sign Up ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFC727)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

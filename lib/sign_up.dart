import 'package:flutter/material.dart';
import 'package:umeet/login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassword = TextEditingController();
  var nameController = TextEditingController();

  Widget _buildName() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 6,
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter your Name";
          }
        },
        controller: nameController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(Icons.person_outline),
          hintText: 'Enter your name',
        ),
      ),
    );
  }

  Widget _buildEmail() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 6,
            color: Colors.grey.shade400,
          ),
        ],
      ),
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
          prefixIcon: Icon(Icons.email_outlined),
          hintText: 'Enter your email',
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 6,
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter your Password";
          }
        },
        controller: passwordController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(Icons.lock_outline_rounded),
          hintText: 'Enter your password',
        ),
      ),
    );
  }

  Widget _buildConfirmPassword() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 6,
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter your Confirm Password";
          }
        },
        controller: confirmPassword,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(Icons.lock_outline_rounded),
          hintText: 'Enter your confirm password',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/loginbg3.png"), // Ganti dengan path gambar Anda
            fit: BoxFit
                .cover, // Menyesuaikan gambar agar sesuai dengan ukuran layar
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.only(top: 220, left: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                        color:
                            Colors.black, // Mengubah warna teks menjadi putih
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Please sign up to continue.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color:
                            Colors.black, // Mengubah warna teks menjadi putih
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildName(),
                  const SizedBox(height: 15),
                  _buildEmail(),
                  const SizedBox(height: 15),
                  _buildPassword(),
                  const SizedBox(height: 15),
                  _buildConfirmPassword(),
                  const SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(colors: [
                        Color(0xff5C83A3),
                        Color(0xff3470A2),
                      ]),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "SIGN UP",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color:
                              Colors.grey, // Mengubah warna teks menjadi putih
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFFC727),
                          ),
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

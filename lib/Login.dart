import 'package:finals/ApiEndpoint.dart';
import 'package:finals/Questionaire.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    ApiEndpoint api = ApiEndpoint();
    // Future<Map<String, dynamic>> data;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        children: [
          Stack(
            children: [
              ClipRect(
                child: Container(
                  width: double.infinity,
                  height: 500,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(860, 300),
                      bottomRight: Radius.elliptical(860, 300),
                    ),
                    color: Color(0xff1DC3A5),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 20,
                child: Image.asset("assets/images/logo.png"),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 45,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "ID No.",
                        prefixIcon: Icon(Icons.perm_identity_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(color: Color(0xff1DC3A5))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 45,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Name",
                        prefixIcon: Icon(Icons.perm_identity_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(color: Color(0xff1DC3A5))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final data = await api.fetchData();
                      print(data);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Questionare()));
                    },
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        backgroundColor: const Color(0xff1DC3A5),
                        minimumSize: const Size(360, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Text("LOG IN"),
                  ),
                  const SizedBox(height: 3),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Forgot Password?",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        decoration: TextDecoration.underline,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text.rich(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 19,
                    ),
                    TextSpan(
                      text: "Don't have an account yet?",
                      children: <TextSpan>[
                        TextSpan(
                          text: " Sign Up!",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xff1DC3A5),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

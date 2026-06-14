import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:licence/helpers/services/user_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool hidePassword = true;
  bool isLoading = false;
  final userService = UserService();
  String erreur = "";

  login() async {

    setState(() {
      isLoading = true;
    });

    try {

      final data = {
        "email": emailController.text,
        "password": passwordController.text
      };

      final response = await userService.login(data);

    } catch (e) {
      Fluttertoast.showToast(msg: "Erreur $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }

  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/logo.png"),
                height: 100,
                width: 100,
              ),
              SizedBox(height: 50,),
              Form(
                key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          prefixIcon: Icon(Icons.email_outlined),
                          hintText: "nom@exemple.com",
                          label: Text(
                            "Adresse email"
                          )
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champ est obligatoire";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            prefixIcon: Icon(Icons.lock_outline),
                            hintText: "*****",
                            label: Text(
                                "Mot de passe"
                            ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(
                                hidePassword ?
                                    Icons.visibility :
                                    Icons.visibility_off
                              )
                          )
                        ),
                        obscureText: hidePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champ est obligatoire";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () async {
                              if (isLoading) return;
                              if (_formKey.currentState!.validate()) {
                                await login();
                              }
                            },
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)
                                )
                            ),
                            child: isLoading ?
                            CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                              padding: EdgeInsets.symmetric(vertical: 5),
                            ) :
                            Text(
                              "Se connecter",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                        ),
                      ),
                    ],
                  )
              )
            ],
        ),
      ),
    );
  }
}

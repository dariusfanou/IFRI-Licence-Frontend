import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:licence/helpers/services/user_service.dart';

import '../helpers/models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool hidePassword = true;
  bool hideConfirmedPassword = true;
  bool isLoading = false;

  final userService = UserService();

  create() async {

    setState(() {
      isLoading = true;
    });

    try {

      final user = RegisterUser(
        firstname: firstnameController.text,
        lastname: lastnameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text
      );

      await userService.register(user);

      Fluttertoast.showToast(msg: "Utilisateur créé avec succès");

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
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: SingleChildScrollView(
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
                        controller: lastnameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            prefixIcon: Icon(Icons.person_outline),
                            hintText: "FANOU",
                            label: Text(
                                "Nom"
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
                        controller: firstnameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            prefixIcon: Icon(Icons.person_outline),
                            hintText: "Darius",
                            label: Text(
                                "Prénom"
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
                        controller: phoneController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            prefixIcon: Icon(Icons.phone_outlined),
                            hintText: "0191633576",
                            label: Text(
                                "Téléphone"
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
                      TextFormField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            prefixIcon: Icon(Icons.lock_outline),
                            hintText: "*****",
                            label: Text(
                                "Confirmer le mot de passe"
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hideConfirmedPassword = !hideConfirmedPassword;
                                  });
                                },
                                icon: Icon(
                                    hideConfirmedPassword ?
                                    Icons.visibility :
                                    Icons.visibility_off
                                )
                            )
                        ),
                        obscureText: hideConfirmedPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champ est obligatoire";
                          }
                          if (value != passwordController.text) {
                            return "Les mots de passe ne correspondent pas";
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
                                await create();
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
                              strokeWidth: 2,
                              padding: EdgeInsets.symmetric(vertical: 2),
                            ) :
                            Text(
                              "S'inscrire",
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
        )
      ),
    );
  }
}

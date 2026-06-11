import 'package:flutter/material.dart';
import 'package:licence/screens/LoginScreen.dart';
import 'package:licence/screens/RegisterScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image(
                  image: AssetImage("assets/images/logo.png"),
                  height: 100,
                  width: 100,
                ),
                SizedBox(height: 10,),
                Text(
                  "EasyClean",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary
                  )
                ),
                SizedBox(height: 10,),
                Text(
                    "Le nettoyage en toute simplicité",
                    style: Theme.of(context).textTheme.bodyLarge
                )
              ],
            ),
            SizedBox(height: 50,),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.push(
                        context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()
                      )
                    ),
                    child: Text(
                        "Se connecter",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.white
                        )
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        )
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()
                        )
                    ),
                    child: Text(
                        "S'inscrire",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary
                        )
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary
                      )
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}

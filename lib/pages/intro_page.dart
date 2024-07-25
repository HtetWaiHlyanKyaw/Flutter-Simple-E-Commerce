import 'package:e_commerce_ui/components/my_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),
            const Text("Jaz Shop",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 10),
            Text("Premium quality products",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary)),
            const SizedBox(height: 25),
            MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )),
          ],
        ),
      ),
    );
  }
}

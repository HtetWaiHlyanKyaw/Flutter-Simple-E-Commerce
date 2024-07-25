import 'package:e_commerce_ui/components/my_drawer.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart"),
      ),
      drawer: MyDrawer(),
      body: const Center(
        child: Text("Cart Page"),
      ),
    );
  }
}

import 'package:e_commerce_ui/components/my_button.dart';
import 'package:e_commerce_ui/components/my_drawer.dart';
import 'package:e_commerce_ui/models/product.dart';
import 'package:e_commerce_ui/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Text("Remove this item from your cart?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },
            child: Text("Yes"),
          )
        ],
      ),
    );
  }

  void pay(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: Text(
                "User wants to pay! Please consider connecting to your backend")));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Cart"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: cart.isEmpty
                  ? Center(child: Text("No items in your cart"))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];

                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toString()),
                          trailing: IconButton(
                            onPressed: () => removeItemFromCart(context, item),
                            icon: Icon(Icons.remove),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child:
                  MyButton(onTap: () => pay(context), child: Text("Pay Now")),
            )
          ],
        ));
  }
}

import 'package:e_commerce_ui/components/my_drawer.dart';
import 'package:e_commerce_ui/components/my_product_tile.dart';
import 'package:e_commerce_ui/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Shop"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: Icon(Icons.shopping_cart),
              )
            ]),
        drawer: MyDrawer(),
        body: ListView(
          children: [
            const SizedBox(height: 25),
            Center(
                child: Text(
              "Shop with pleasure and ease",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            )),
            SizedBox(
              height: 550,
              child: ListView.builder(
                  itemCount: products.length,
                  padding: EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return MyProductTile(product: product);
                  }),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product List",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text("Product List"),
            leading: CircleAvatar(),
            subtitle: Wrap(
              spacing: 10,
              children: [
                Text("Product Code"),
                Text("Quantity"),
                Text("Unit Price", style: TextStyle(color: Colors.amber),),
                Text("Total Price", style: TextStyle(color: Colors.red),),
              ],
            ),
            // trailing: ,
          );
        },
      ),
    );
  }
}

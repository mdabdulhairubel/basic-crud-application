import 'package:flutter/material.dart';
import 'package:ostad/add_new_screen.dart';

enum PopupMenumalmosla { edit, delete }

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
          return ListTile(
            title: const Text("Product List"),
            leading: const CircleAvatar(),
            subtitle: const Wrap(
              spacing: 10,
              children: [
                Text("Product Code"),
                Text("Quantity"),
                Text(
                  "Unit Price",
                  style: TextStyle(color: Colors.amber),
                ),
                Text(
                  "Total Price",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
            trailing: PopupMenuButton<PopupMenumalmosla>(
              itemBuilder: (context) => [
                const PopupMenuItem(
                    value: PopupMenumalmosla.edit,
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        Text("Edit"),
                      ],
                    )),
                const PopupMenuItem(
                    value: PopupMenumalmosla.delete,
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        Text("Delete"),
                      ],
                    )),
              ],
            ),
            // trailing: ,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewScreen()));
      },
          icon: const Icon(Icons.add),
          label: const Text("Add")),
    );
  }
}

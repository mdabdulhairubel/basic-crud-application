import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ostad/add_new_screen.dart';
import 'package:ostad/edit_screen.dart';
import 'package:http/http.dart';
import 'product.dart';

enum PopupMenumalmosla { edit, delete }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <Product> productList=[];
  bool _getInProgress  = false;

  @override
  void initState() {
    super.initState();
    getProductListFormApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product List",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Visibility(
        visible: _getInProgress == false,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(productList[index].productName ?? 'Unknown'),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(productList[index].image?? ''),
              ),
              subtitle:Wrap(
                spacing: 10,
                children: [
                  Text('Code: ${productList[index].productCode ?? 'Unknown'}'),
                  Text('Quantity: ${productList[index].quantity ?? 'Unknown'}'),
                  Text(
                    'Unit Price ${productList[index].unitPrice ?? 'Unknown'}',
                    style: const TextStyle(color: Colors.amber),
                  ),
                  Text(
                    'Total Price ${productList[index].totalPrice ?? 'Unknown'}',
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
              trailing: PopupMenuButton<PopupMenumalmosla>(
                onSelected: ontapPopupMenuButton,
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
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddNewScreen()));
          },
          icon: const Icon(Icons.add),
          label: const Text("Add")),
    );
  }

  void ontapPopupMenuButton(PopupMenumalmosla type) {
    switch (type) {
      case PopupMenumalmosla.edit:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EditScreen(),
          ),
        );
        break;
      case PopupMenumalmosla.delete:
        _showDeleteDialoge();
        break;
    }
  }

  void _showDeleteDialoge() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Dialoug Box"),
          content: const Text("Are you sure? Delete this Product?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel")),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Yes, Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
  Future <void> getProductListFormApi () async {
    _getInProgress =true;
    setState(() {});
    Uri uri = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
    Response response = await get(uri);
    if (response.statusCode == 200) {
      var decodeResponse= jsonDecode(response.body);
      if (decodeResponse ['status']== 'success') {
        var list = decodeResponse['data'];
        for (var item in list ) {
          Product product = Product(
            id: item ['ProductName'],
            productName: item ['ProductName'],
            productCode: item ['ProductCode'],
            image: item ['Img'],
            unitPrice: item ['UnitPrice'],
            quantity: item ['Qty'],
            totalPrice: item ['TotalPrice'],
            createdDate: item ['CreatedDate'],
          );
          productList.add(product);
        }
        setState(() {});
      }

    }
    _getInProgress =false;
    setState(() {});
  }
}

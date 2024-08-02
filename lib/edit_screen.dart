import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<EditScreen> {
  final TextEditingController _titleTEC = TextEditingController();
  final TextEditingController _unitpriceTEC = TextEditingController();
  final TextEditingController _totalpriceTEC = TextEditingController();
  final TextEditingController _quantityTEC = TextEditingController();
  final TextEditingController _productcodeTEC = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New Product",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleTEC,
                  decoration: const InputDecoration(
                    hintText: 'Enter Product Title',
                    labelText: 'Enter Product Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter the Product title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _quantityTEC,
                  decoration: const InputDecoration(
                    hintText: 'Enter Product Quantity',
                    labelText: 'Enter Product Quantity',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter the Product title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _productcodeTEC,
                  decoration: const InputDecoration(
                    hintText: 'Enter Product Code',
                    labelText: 'Enter Product Code',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter the Product title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _unitpriceTEC,
                  decoration: const InputDecoration(
                    hintText: 'Enter Unit Price',
                    labelText: 'Enter Unit Price',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter the Product title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _totalpriceTEC,
                  decoration: const InputDecoration(
                    hintText: 'Enter Total Price',
                    labelText: 'Enter Total Price',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter the Product title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text(
                          "Add",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

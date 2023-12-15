import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StockCheckScreen extends StatefulWidget {
  const StockCheckScreen({super.key});

  @override
  State<StockCheckScreen> createState() => _StockCheckScreenState();
}

class _StockCheckScreenState extends State<StockCheckScreen> {
  TextEditingController priceController = TextEditingController();
  String? selectedModelId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock Check"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Text("Product")),
                Expanded(child: Text("Pease")),
                Expanded(child: Text("Price")),
                Expanded(child: Text("total")),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: selectedProduct.length,
              itemBuilder: (context, index) {
                final data = selectedProduct[index];
                return Row(
                  children: [
                    Expanded(child: Text(data.name)),
                    Expanded(child: Text(data.quenty.toString())),
                    Expanded(child: Text(data.price.toString())),
                    Expanded(child: Text("${data.quenty * data.price}")),
                  ],
                );
              },
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: dropdown(),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      hintText: "Price",
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (selectedModelId == null ||
                          priceController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Select all")));
                      } else if (selectedProduct
                          .any((element) => element.name == selectedModelId)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("All ready add")));
                      } else {
                        if (selectedData!.quenty >=
                            int.parse(priceController.text)) {
                          selectedProduct.add(Product(
                              name: selectedData!.name,
                              price: selectedData!.price,
                              quenty: int.parse(priceController.text)));

                          priceController.clear();
                          selectedModelId = null;
                          setState(() {});
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Out Of Stock ")));
                        }
                      }
                    },
                    child: Text("Submit")),
                SizedBox(
                  width: 15,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget dropdown() {
    final selected = selectedModelId == null
        ? null
        : products.firstWhere((element) => element.name == selectedModelId);

    return Container(
      height: 45,
      child: DropdownButton<Product>(
        isExpanded: true,
        underline: SizedBox(),
        hint: Text("Product"),
        value: selected,
        items: products
            .map((e) => DropdownMenuItem<Product>(
                  child: Text(e.name),
                  value: e,
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedModelId = value!.name;
            selectedData = value;
          });
        },
      ),
    );
  }

  Product? selectedData;
  List<Product> selectedProduct = [];

  final List<Product> products = [
    Product(name: "Computer", price: 120, quenty: 30),
    Product(name: "laptop", price: 10, quenty: 12),
    Product(name: "pc", price: 1200, quenty: 54),
    Product(name: "book", price: 78, quenty: 78),
    Product(name: "chair", price: 456, quenty: 90),
    Product(name: "Google", price: 154, quenty: 56),
    Product(name: "FB", price: 123, quenty: 303),
    Product(name: "Instagram", price: 75, quenty: 123),
    Product(name: "Pensile", price: 120, quenty: 305),
    Product(name: "Pen", price: 12, quenty: 10),
    Product(name: "Erager", price: 190, quenty: 20),
  ];
}

class Product {
  String name;
  int price;
  int quenty;

  Product({
    required this.name,
    required this.price,
    required this.quenty,
  });
}

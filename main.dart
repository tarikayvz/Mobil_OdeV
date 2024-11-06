import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Map<String, dynamic>> products = [
    {
      "name": "Product 1",
      "price": 100,
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Product 2",
      "price": 200,
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Product 3",
      "price": 300,
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Product 4",
      "price": 400,
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Product 5",
      "price": 500,
      "image": "https://via.placeholder.com/150"
    },
  ];

  int selectedIndex = -1;

  void onProductTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: Column(
        children: [
          // Horizontal ListView
          Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onProductTap(index),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text(products[index]["name"])),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          // Grid List
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onProductTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Colors.blueAccent
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color:
                            selectedIndex == index ? Colors.blue : Colors.grey,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          products[index]["image"],
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8),
                        Text(
                          products[index]["name"],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "\$${products[index]["price"]}",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

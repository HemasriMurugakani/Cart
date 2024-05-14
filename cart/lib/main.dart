import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartPage(),
    );
  }
}

class MyCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('My Cart'),
          actions: <Widget>[
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 5, 5, 5),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 10,
                    ),
                    child: Text(
                      '${products.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return CartItemWidget(product: products[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal:', style: TextStyle(fontSize: 16.0)),
                        Text('\$${calculateSubtotal().toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery:', style: TextStyle(fontSize: 16.0)),
                        Text('Free', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tax Fee:', style: TextStyle(fontSize: 16.0)),
                        Text('\$25.00', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                    Divider(height: 32.0, thickness: 2.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total:',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text('\$${calculateTotal().toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 7, 27, 249),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                      ),
                      child: Text(
                        'Proceed to Checkout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateSubtotal() {
    double subtotal = 0.0;
    for (var product in products) {
      subtotal += (product.price * product.quantity);
    }
    return subtotal;
  }

  double calculateTotal() {
    double total = calculateSubtotal() + 25.0;
    return total;
  }
}

class CartItemWidget extends StatelessWidget {
  final Product product;

  CartItemWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Image.network(product.imageUrl),
        title: Row(
          children: [
            Expanded(
              child: Text(
                product.name,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Color: ${product.color}',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 4.0),
            Text(
              'Size: ${product.size}',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity: ${product.quantity}',
                  style: TextStyle(fontSize: 14.0),
                ),
                Text(
                  '\$${(product.price * product.quantity).toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String color;
  final String size;
  final int quantity;
  final double price;
  final String imageUrl;

  Product(
      {required this.name,
      required this.color,
      required this.size,
      required this.quantity,
      required this.price,
      required this.imageUrl});
}

List<Product> products = [
  Product(
      name: 'Navy Pullover Hoodie',
      color: 'Blue',
      size: 'M',
      quantity: 1,
      price: 24.99,
      imageUrl:
          'https://fullyfilmy.in/cdn/shop/files/Navy_7e4fa346-a1b8-4e65-8f99-acfddb84731b.jpg?v=1700722858'),
  Product(
      name: 'Carrito Women Boots',
      color: 'Black',
      size: '6(UK)',
      quantity: 1,
      price: 67.49,
      imageUrl:
          'https://atlas-content-cdn.pixelsquid.com/stock-images/women-s-boots-zeJeQZ8-600.jpg'),
  Product(
      name: 'Fashion Ladies Backpack',
      color: 'Red',
      size: 'Small',
      quantity: 1,
      price: 44.99,
      imageUrl:
          'https://5.imimg.com/data5/GW/IC/MY-7308759/selection_338-500x500.png'),
  Product(
      name: 'Unisex Fedora Hat',
      color: 'Black',
      size: 'M',
      quantity: 1,
      price: 16.49,
      imageUrl:
          'https://contents.mediadecathlon.com/p2233686/e7ce922f782a8474c4082b85eee77000/p2233686.jpg'),
];

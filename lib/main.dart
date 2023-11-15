import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ECommerceScreen(),
    );
  }
}

class ECommerceScreen extends StatefulWidget {
  @override
  _ECommerceScreenState createState() => _ECommerceScreenState();
}

class _ECommerceScreenState extends State<ECommerceScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Godrej'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Promosi'),
              Tab(text: 'Nama Produk'),
              Tab(text: 'Terlaris'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Center(
                child: Text('Content'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Content'),
              ),
            ),
            ProductTab(),
          ],
        ),
      ),
    );
  }
}

class ProductTab extends StatelessWidget {
  final List<Product> products = [
    Product(
        name: 'Product 1',
        price: 24.300,
        imageUrl:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fmitra100.com%2Fproduct%2FGas-Elpiji-3-Kg-Isi-Ulang-nVy2I&psig=AOvVaw0dEhtfJEtub2LvTgypO4lh&ust=1700114650787000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOiix-CqxYIDFQAAAAAdAAAAABAE'),
    Product(
        name: 'Product 2',
        price: 41.500,
        imageUrl:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fmitra100.com%2Fproduct%2FGas-Elpiji-3-Kg-Isi-Ulang-nVy2I&psig=AOvVaw0dEhtfJEtub2LvTgypO4lh&ust=1700114650787000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOiix-CqxYIDFQAAAAAdAAAAABAE'),

    Product(
        name: 'Product 3',
        price: 41.500,
        imageUrl:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fmitra100.com%2Fproduct%2FGas-Elpiji-3-Kg-Isi-Ulang-nVy2I&psig=AOvVaw0dEhtfJEtub2LvTgypO4lh&ust=1700114650787000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOiix-CqxYIDFQAAAAAdAAAAABAE'),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselSlider(
            items: products.map((product) {
              return Container(
                margin: EdgeInsets.all(8.0),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Belanja berdasarkan Kategori',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          Container(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(4.0),
                  child: Image.network(
                    products[index].imageUrl,
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Semua Produk',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 16.0),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            height: 150.0,
          ),
          ListTile(
            title: Text(product.name),
            subtitle: Text('\Rp${product.price.toStringAsFixed(3)}'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('+ Keranjang'),
          ),
        ],
      ),
    );
  }
}

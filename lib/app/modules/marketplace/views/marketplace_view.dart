import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/marketplace_controller.dart';

class MarketplaceView extends GetView<MarketplaceController> {
  const MarketplaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: TabBar(
            tabs: [
              Tab(text: 'Buy'),
              Tab(text: 'Sell'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Buy Tab Content
            BuyTabContent(),
            // Sell Tab Content
            SellTabContent(), // Placeholder for Sell Tab Content
          ],
        ),
      ),
    );
  }
}

class SellTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Upload product data functionality
          },
          child: Text('Upload Product'),
        ),
      ],
    );
  }
}

class BuyTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SearchBar(), // Add the SearchBar widget
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Add onPressed functionality for cart button
              },
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10, // Example count, replace with actual data
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Image.network(
                        'https://www.gardeningknowhow.com/wp-content/uploads/2016/07/wheat-1152x1536.jpg',
                        width: 48, // Adjust width as needed
                        height: 48, // Adjust height as needed
                      ),
                      title: Text('Product ${index + 1}'),
                      subtitle: Text('Description of product ${index + 1}'),
                      trailing: DropdownButton<int>(
                        value: 1, // Default value, change as needed
                        items: [1, 2, 3, 4, 5] // Example quantities, replace with actual data
                            .map((quantity) {
                          return DropdownMenuItem<int>(
                            value: quantity,
                            child: Text('Qty: $quantity'),
                          );
                        }).toList(),
                        onChanged: (int? value) {
                          // Handle quantity change
                        },
                      ),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        TextButton(
                          child: const Text('Add to cart'),
                          onPressed: () {/* Add to cart functionality */},
                        ),
                        TextButton(
                          child: const Text('Save for later'),
                          onPressed: () {/* Save for later functionality */},
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search products...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

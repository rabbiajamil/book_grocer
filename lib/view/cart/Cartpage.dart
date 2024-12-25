import 'package:flutter/material.dart';
import '../../common/color_extenstion.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  CartPage({required this.cartItems});

  double calculateTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(color: TColor.text)),
        backgroundColor: TColor.primary,
      ),
      body: cartItems.isEmpty
          ? Center(
        child: Text(
          'Your cart is empty!',
          style: TextStyle(color: TColor.textSecondary, fontSize: 18),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  color: TColor.primaryLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(item['image']),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: TColor.text,
                                ),
                              ),
                              Text(
                                'Quantity: ${item['quantity']}',
                                style: TextStyle(
                                  color: TColor.textSecondary,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Price: Rs.${item['price'] * item['quantity']}',
                                style: TextStyle(
                                  color: TColor.textSecondary,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Total: Rs.${calculateTotalPrice()}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: TColor.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

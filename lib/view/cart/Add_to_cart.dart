import 'package:flutter/material.dart';
import 'package:book_grocer/common/color_extenstion.dart'; // Make sure to import your TColor class

class AddToCartPage extends StatefulWidget {
  @override
  _AddToCartPageState createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  final List<Map<String, dynamic>> books = [
    {
      'title': 'Man\'s Search for Meaning',
      'image': 'assets/img/20.webp',
      'rating': 4.5,
      'price': 1200,
    },
    {
      'title': 'The Time Travellers Handbook',
      'image': 'assets/img/3.jpg',
      'rating': 4.3,
      'price': 1300,
    },
    {
      'title': 'Dare to Lead',
      'image': 'assets/img/55.png',
      'rating': 4.7,
      'price': 1000,
    },
    {
      'title': 'Grit',
      'image': 'assets/img/56.jpg',
      'rating': 4.6,
      'price': 1100,
    },
    {
      'title': 'Where the Crawdads Sing',
      'image': 'assets/img/99.jpg',
      'rating': 4.8,
      'price': 1300,
    },
    {
      'title': 'It Ends With Us',
      'image': 'assets/img/98.webp',
      'rating': 4.7,
      'price': 900,
    },
    {
      'title': 'Atomic Habits',
      'image': 'assets/img/97.jpg',
      'rating': 4.9,
      'price': 1000,
    },
    {
      'title': 'The Midnight Library',
      'image': 'assets/img/96.jpg',
      'rating': 4.6,
      'price': 1100,
    },
    {
      'title': 'The Alchemist',
      'image': 'assets/img/95.jpg',
      'rating': 4.7,
      'price': 900,
    },
    {
      'title': 'The Four Agreements',
      'image': 'assets/img/94.jpg',
      'rating': 4.5,
      'price': 850,
    },
    {
      'title': 'The 48 Laws of Power',
      'image': 'assets/img/93.png',
      'rating': 4.4,
      'price': 1200,
    },
    {
      'title': 'Becoming',
      'image': 'assets/img/92.jpg',
      'rating': 4.8,
      'price': 1500,
    },
    {
      'title': 'Dune',
      'image': 'assets/img/91.jpg',
      'rating': 4.6,
      'price': 1300,
    },
    {
      'title': 'Educated',
      'image': 'assets/img/80.jpg',
      'rating': 4.7,
      'price': 1400,
    },
    {
      'title': 'The Book Thief',
      'image': 'assets/img/81.jpg',
      'rating': 4.8,
      'price': 1100,
    },
    {
      'title': 'Sapiens: A Brief History of Humankind',
      'image': 'assets/img/82.jpg',
      'rating': 4.8,
      'price': 1300,
    },
    {
      'title': 'The Subtle Art of Not Giving a F*ck',
      'image': 'assets/img/83.png',
      'rating': 4.4,
      'price': 950,
    },
    {
      'title': 'The Seven Husbands of Evelyn Hugo',
      'image': 'assets/img/84.jpg',
      'rating': 4.7,
      'price': 1200,
    },
    {
      'title': 'The Silent Patient',
      'image': 'assets/img/85.jpg',
      'rating': 4.6,
      'price': 1300,
    },
  ];

  List<Map<String, dynamic>> cartItems = [];

  void addToCart(Map<String, dynamic> book) {
    setState(() {
      final index = cartItems.indexWhere((item) => item['title'] == book['title']);
      if (index == -1) {
        cartItems.add({...book, 'quantity': 1});
      } else {
        cartItems[index]['quantity']++;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${book['title']} added to cart!'),
        backgroundColor: TColor.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add to Cart', style: TextStyle(color: Colors.white)),
        backgroundColor: TColor.primary,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(
                        cartItems: cartItems,
                        onUpdate: (updatedItems) {
                          setState(() {
                            cartItems = updatedItems;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${cartItems.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: TColor.primary, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(book['image']),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: TColor.primary, width: 2),
                      color: TColor.primaryLight, // Green background color
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book['title'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            SizedBox(width: 4),
                            Text(
                              '${book['rating']}',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Price: Rs.${book['price']}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: TColor.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () => addToCart(book),
                          child: Text('Add to Cart', style: TextStyle(fontSize: 16)),
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
    );
  }
}


class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(List<Map<String, dynamic>>) onUpdate;

  CartPage({required this.cartItems, required this.onUpdate});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Remove an item from the cart
  void removeItem(int index) {
    setState(() {
      widget.cartItems.removeAt(index); // Remove item from the list
      widget.onUpdate(widget.cartItems); // Notify the parent to update the cart
    });
  }

  // Calculate the total price
  double calculateTotalPrice() {
    return widget.cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  // Increase the quantity of an item
  void increaseQuantity(int index) {
    setState(() {
      widget.cartItems[index]['quantity']++;
      widget.onUpdate(widget.cartItems); // Notify the parent to update the cart
    });
  }

  // Decrease the quantity of an item
  void decreaseQuantity(int index) {
    setState(() {
      if (widget.cartItems[index]['quantity'] > 1) {
        widget.cartItems[index]['quantity']--;
      } else {
        removeItem(index); // If quantity is 1, remove the item from the cart
      }
      widget.onUpdate(widget.cartItems); // Notify the parent to update the cart
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart', style: TextStyle(color: Colors.white)),
        backgroundColor: TColor.primary,  // Using TColor.primary here
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Image.asset(item['image'], width: 50, height: 70),
                    title: Text(item['title'], style: TextStyle(color: Colors.black87)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price: Rs.${item['price']}'),
                        Row(
                          children: [
                            // Decrease quantity
                            IconButton(
                              icon: Icon(Icons.remove, color: Colors.black87),
                              onPressed: () => decreaseQuantity(index),
                            ),
                            Text('${item['quantity']}', style: TextStyle(color: Colors.black87)),
                            // Increase quantity
                            IconButton(
                              icon: Icon(Icons.add, color: Colors.black87),
                              onPressed: () => increaseQuantity(index),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeItem(index), // Remove item on delete
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Total Price Display
                Text(
                  'Total: Rs.${calculateTotalPrice()}',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColor.primary,  // Using TColor.primary here
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckoutPage()),
                    );
                  },
                  child: Text('Proceed to Checkout', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: TColor.primary,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Contact Information
              SectionTitle(title: 'Contact Information'),
              SizedBox(height: 10),
              CustomTextField(
                controller: _emailController,
                label: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),

              // Shipping Address
              SizedBox(height: 20),
              SectionTitle(title: 'Shipping Address'),
              SizedBox(height: 10),
              CustomTextField(controller: _nameController, label: 'Full Name'),
              SizedBox(height: 10),
              CustomTextField(controller: _addressController, label: 'Address'),
              SizedBox(height: 10),
              CustomTextField(controller: _cityController, label: 'City'),
              SizedBox(height: 10),
              CustomTextField(controller: _postalCodeController, label: 'Postal Code'),
              SizedBox(height: 10),
              CustomTextField(controller: _phoneController, label: 'Phone Number (optional)'),

              // Payment Method
              SizedBox(height: 20),
              SectionTitle(title: 'Payment Method'),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem(value: 'Credit Card', child: Text('Credit Card')),
                  DropdownMenuItem(value: 'PayPal', child: Text('PayPal')),
                  DropdownMenuItem(value: 'Shop Pay', child: Text('Shop Pay')),
                ],
                onChanged: (value) {},
                decoration: InputDecoration(
                  labelText: 'Select Payment Method',
                  labelStyle: TextStyle(color: TColor.primary),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: TColor.dColor,
                ),
              ),

              // Place Order Button
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Order placed successfully!'),
                        backgroundColor: TColor.primary,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColor.primary,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Place Order',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: TColor.primary,
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextField({required this.label, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black), // Changed label text color to black
        border: OutlineInputBorder(),
        filled: true,
        fillColor: TColor.dColor,
      ),
      validator: validator,
    );
  }
}
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final int cartCount;
  final double total;

  const CartPage({
    super.key,
    required this.cartCount,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B0F1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Your Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: const Color(0xff151A24),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                children: [
                  Text(
                    "$cartCount item(s)",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "₹${total.toInt()}",
                    style: const TextStyle(
                      fontSize: 34,
                      color: Color(0xff7CFF6B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7CFF6B),
                  padding: const EdgeInsets.all(18),
                ),
                onPressed: () {},
                child: const Text(
                  "Proceed to Checkout",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
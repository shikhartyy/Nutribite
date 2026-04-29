import 'package:flutter/material.dart';

class MealDetailsPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final double price;

  const MealDetailsPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B0F1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff151A24),
                borderRadius: BorderRadius.circular(32),
              ),
              child: const Center(
                child: Icon(
                  Icons.fastfood,
                  size: 90,
                  color: Color(0xff7CFF6B),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              "Freshly prepared premium healthy meal designed for your fitness and nutrition goals.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const Spacer(),

            Row(
              children: [
                Text(
                  "₹${price.toInt()}",
                  style: const TextStyle(
                    fontSize: 30,
                    color: Color(0xff7CFF6B),
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 18),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff7CFF6B),
                      padding: const EdgeInsets.all(18),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
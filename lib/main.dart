import 'package:flutter/material.dart';
import 'meal_builder_page.dart';
import 'cart_page.dart';
import 'meal_details_page.dart';

void main() {
  runApp(const NutriBiteApp());
}

class NutriBiteApp extends StatelessWidget {
  const NutriBiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NutriBite AI",
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff07111F),
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cartCount = 0;
  double total = 0;

  void addToCart(double price) {
    setState(() {
      cartCount++;
      total += price;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Added to cart"),
        duration: Duration(milliseconds: 700),
      ),
    );
  }

  Widget chip(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff132033),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget mealCard(
      String title,
      String subtitle,
      double price,
      String badge,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MealDetailsPage(
              title: title,
              subtitle: subtitle,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xff111B2A),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 16,
              offset: Offset(0, 8),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff7CFF6B),
                    Color(0xff34D399),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.restaurant,
                color: Colors.black,
                size: 34,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange
                          .withOpacity(.15),
                      borderRadius:
                      BorderRadius.circular(18),
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 11,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),

            Column(
              children: [
                Text(
                  "₹${price.toInt()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => addToCart(price),
                  child: Container(
                    padding:
                    const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color:
                      const Color(0xff7CFF6B),
                      borderRadius:
                      BorderRadius.circular(
                          18),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            heroTag: "builder",
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                  const MealBuilderPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.auto_awesome,
              color: Colors.black,
            ),
            label: const Text(
              "Build Meal",
              style:
              TextStyle(color: Colors.black),
            ),
          ),

          const SizedBox(height: 12),

          FloatingActionButton.extended(
            heroTag: "cart",
            backgroundColor:
            const Color(0xff7CFF6B),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartPage(
                    cartCount: cartCount,
                    total: total,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            label: Text(
              "$cartCount | ₹${total.toInt()}",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: ListView(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fuel Your Body",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight:
                            FontWeight.bold,
                            height: 1.1,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Smart meals for stronger results",
                          style: TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color:
                      const Color(0xff132033),
                      borderRadius:
                      BorderRadius.circular(
                          16),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 22),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff132033),
                  borderRadius:
                  BorderRadius.circular(24),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search,
                        color: Colors.white54),
                    SizedBox(width: 12),
                    Text(
                      "Search healthy meals",
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 22),

              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff7CFF6B),
                      Color(0xff34D399),
                    ],
                  ),
                  borderRadius:
                  BorderRadius.circular(30),
                ),
                child: const Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      "AI Nutrition Pick",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "High protein meal under 500 kcal",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 14),
                    Text(
                      "→ Chicken Rice Bowl • 42g protein",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight:
                        FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              SizedBox(
                height: 44,
                child: ListView(
                  scrollDirection:
                  Axis.horizontal,
                  children: [
                    chip("Popular"),
                    chip("Fitness"),
                    chip("Budget"),
                    chip("Vegan"),
                    chip("Protein+"),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              mealCard(
                "Chicken Rice Bowl",
                "480 kcal • 42g protein",
                249,
                "BEST SELLER",
              ),

              mealCard(
                "Paneer Power Meal",
                "430 kcal • 35g protein",
                229,
                "HIGH PROTEIN",
              ),

              mealCard(
                "Student Combo",
                "310 kcal • Affordable",
                149,
                "VALUE",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
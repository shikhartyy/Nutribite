import 'package:flutter/material.dart';

void main() {
  runApp(const NutriBiteApp());
}

class NutriBiteApp extends StatelessWidget {
  const NutriBiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meal Builder",
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff07111F),
      ),
      home: const MealBuilderPage(),
    );
  }
}

class MealBuilderPage extends StatefulWidget {
  const MealBuilderPage({super.key});

  @override
  State<MealBuilderPage> createState() => _MealBuilderPageState();
}

class _MealBuilderPageState extends State<MealBuilderPage> {
  String base = "Rice";
  String protein = "Chicken";
  String spice = "Medium";

  bool sauce = false;
  bool salad = false;
  bool cheese = false;

  String mealName = "Chicken Rice Bowl";
  int kcal = 480;
  int price = 249;

  void generateMeal() {
    int calories = 0;
    int total = 149;

    if (base == "Rice") calories += 180;
    if (base == "Roti") calories += 120;
    if (base == "Quinoa") calories += 160;

    if (protein == "Chicken") calories += 220;
    if (protein == "Paneer") calories += 250;
    if (protein == "Tofu") calories += 190;

    if (spice == "High") calories += 20;

    if (sauce) {
      calories += 40;
      total += 20;
    }

    if (salad) {
      calories += 20;
      total += 15;
    }

    if (cheese) {
      calories += 60;
      total += 25;
    }

    total += calories ~/ 8;

    setState(() {
      mealName = "$protein $base Bowl";
      kcal = calories;
      price = total;
    });
  }

  Widget chip(
      String title,
      String current,
      Function(String) onTap,
      ) {
    bool active = current == title;

    return GestureDetector(
      onTap: () => onTap(title),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(
          right: 10,
          bottom: 10,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: active
              ? const Color(0xff7CFF6B)
              : const Color(0xff132033),
          borderRadius:
          BorderRadius.circular(22),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: active
                ? Colors.black
                : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget extraTile(
      String title,
      bool value,
      Function(bool) onChanged,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xff111B2A),
        borderRadius:
        BorderRadius.circular(20),
      ),
      child: SwitchListTile(
        activeColor:
        const Color(0xff7CFF6B),
        title: Text(title),
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
        top: 10,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
      FloatingActionButton.extended(
        backgroundColor:
        const Color(0xff7CFF6B),
        onPressed: generateMeal,
        icon: const Icon(
          Icons.auto_awesome,
          color: Colors.black,
        ),
        label: const Text(
          "Generate",
          style:
          TextStyle(color: Colors.black),
        ),
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(22),
          children: [
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      Text(
                        "Build Your Meal",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight:
                          FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Personalized nutrition in seconds",
                        style: TextStyle(
                          color:
                          Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 48,
                  width: 48,
                  decoration:
                  BoxDecoration(
                    color:
                    const Color(
                        0xff132033),
                    borderRadius:
                    BorderRadius
                        .circular(
                        16),
                  ),
                  child: const Icon(
                    Icons.restaurant,
                  ),
                )
              ],
            ),

            const SizedBox(height: 24),

            Container(
              padding:
              const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient:
                const LinearGradient(
                  colors: [
                    Color(0xff7CFF6B),
                    Color(0xff34D399),
                  ],
                ),
                borderRadius:
                BorderRadius.circular(
                    28),
              ),
              child: const Column(
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,
                children: [
                  Text(
                    "AI Tip",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Choose high protein + low extras for lean goals",
                    style: TextStyle(
                      color:
                      Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            sectionTitle("Choose Base"),
            Wrap(
              children: [
                chip("Rice", base,
                        (v) => setState(
                            () => base = v)),
                chip("Roti", base,
                        (v) => setState(
                            () => base = v)),
                chip("Quinoa", base,
                        (v) => setState(
                            () => base = v)),
              ],
            ),

            sectionTitle("Choose Protein"),
            Wrap(
              children: [
                chip(
                    "Chicken",
                    protein,
                        (v) => setState(() =>
                    protein = v)),
                chip(
                    "Paneer",
                    protein,
                        (v) => setState(() =>
                    protein = v)),
                chip("Tofu", protein,
                        (v) => setState(
                            () => protein = v)),
              ],
            ),

            sectionTitle("Spice Level"),
            Wrap(
              children: [
                chip("Low", spice,
                        (v) => setState(
                            () => spice = v)),
                chip(
                    "Medium",
                    spice,
                        (v) => setState(() =>
                    spice = v)),
                chip("High", spice,
                        (v) => setState(
                            () => spice = v)),
              ],
            ),

            sectionTitle("Extras"),

            extraTile("Sauce", sauce,
                    (v) => setState(
                        () => sauce = v)),

            extraTile("Salad", salad,
                    (v) => setState(
                        () => salad = v)),

            extraTile("Cheese", cheese,
                    (v) => setState(
                        () => cheese = v)),

            const SizedBox(height: 20),

            Container(
              padding:
              const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color:
                const Color(0xff111B2A),
                borderRadius:
                BorderRadius.circular(
                    28),
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,
                children: [
                  const Text(
                    "Generated Result",
                    style: TextStyle(
                      color:
                      Colors.white60,
                    ),
                  ),
                  const SizedBox(
                      height: 10),
                  Text(
                    mealName,
                    style:
                    const TextStyle(
                      fontSize: 26,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                      height: 10),
                  Row(
                    children: [
                      Text(
                        "$kcal kcal",
                        style:
                        const TextStyle(
                          color: Color(
                              0xff7CFF6B),
                          fontWeight:
                          FontWeight
                              .bold,
                        ),
                      ),
                      const SizedBox(
                          width: 16),
                      Text(
                        "₹$price",
                        style:
                        const TextStyle(
                          color: Colors
                              .orange,
                          fontWeight:
                          FontWeight
                              .bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 12),
                  const Text(
                    "Custom meal generated for your goals.",
                    style: TextStyle(
                      color:
                      Colors.white60,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
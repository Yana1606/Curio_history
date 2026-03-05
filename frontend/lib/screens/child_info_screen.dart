import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChildInfoScreen extends StatefulWidget {
  const ChildInfoScreen({super.key});

  @override
  State<ChildInfoScreen> createState() => _ChildInfoScreenState();
}

class _ChildInfoScreenState extends State<ChildInfoScreen> {
  String selectedGender = "";
  final TextEditingController nameController = TextEditingController();
  final Random random = Random();

  List<Widget> backgroundLogos = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;

      setState(() {
        backgroundLogos = buildBackgroundLogos(size, 5, 5);
      });
    });
  }

  Widget genderIcon(String gender, String image, Color fillColor) {
    bool isSelected = selectedGender == gender;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: SvgPicture.asset(
        image,
        width: 90,
        colorFilter: ColorFilter.mode(
          isSelected ? fillColor : const Color(0xFFF68B3C),
          BlendMode.srcIn,
        ),
      ),
    );
  }

  List<Widget> buildBackgroundLogos(Size size, int rows, int cols) {
    double cellWidth = size.width / cols;
    double cellHeight = size.height / rows;

    List<Widget> logos = [];

    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        double centerX = col * cellWidth + cellWidth / 2;
        double centerY = row * cellHeight + cellHeight / 2;

        double rotation = (random.nextDouble() * pi / 3) - (pi / 6);
        double scale = 0.2 + random.nextDouble() * 0.25;

        logos.add(
          Positioned(
            left: centerX - 40,
            top: centerY - 40,
            child: IgnorePointer(
              child: Transform.rotate(
                angle: rotation,
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    'assets/images/Star.svg',
                    width: 300 * scale,
                    height: 300 * scale,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }

    return logos;
  }

  Widget buildButton() {
    return GestureDetector(
      onTap: () {
        print(nameController.text);
        print(selectedGender);
      },
      child: SizedBox(
        width: 240,
        height: 60,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [

            /// нижняя тёмная часть (объём)
            Positioned(
              bottom: 0,
              child: Container(
                width: 240,
                height: 30,
                decoration: const BoxDecoration(
                  color: Color(0xFFD96F25),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(85),
                  ),
                ),
              ),
            ),

            /// основная кнопка
            Container(
              width: 240,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF68B3C),
                borderRadius: BorderRadius.circular(85),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Продолжить",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// фон
          Container(color: const Color(0xFFFFFCE1)),

          /// логотипы
          ...backgroundLogos,

          /// основной интерфейс
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Имя ребенка",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D0000),
                  ),
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 400),
                  child: TextField(
                    controller: nameController,
                    style: const TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      hintText: "Имя",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(85),
                        borderSide: const BorderSide(
                          color: Color(0xFFF68B3C),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(85),
                        borderSide: const BorderSide(
                          color: Color(0xFFF68B3C),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                const Text(
                  "Пол",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D0000),
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    genderIcon(
                      "boy",
                      "assets/images/boy.svg",
                      Colors.blue,
                    ),

                    const SizedBox(width: 40),

                    genderIcon(
                      "girl",
                      "assets/images/girl.svg",
                      Colors.pink,
                    ),
                  ],
                ),

                const SizedBox(height: 60),

                buildButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
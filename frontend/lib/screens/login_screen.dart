import 'package:flutter/material.dart';
import 'child_info_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [

          /// Фоновая картинка
          Positioned.fill(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset("assets/images/forest.png"),
            ),
          ),

          /// Контент
          SafeArea(
            child: Column(
              children: [

                SizedBox(height: screenHeight * 0.12),

                /// Заголовок
                const Center(
                  child: Text(
                    "Читаем с Кьюрио",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 6,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(),

                /// Кнопка Google
                Center(
                  child: SizedBox(
                    width: 380,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {

                        /// Переход на экран данных ребенка
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChildInfoScreen(),
                          ),
                        );

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.zero,
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          /// Иконка Google
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              "assets/images/google_icon.png",
                            ),
                          ),

                          const SizedBox(width: 12),

                          /// Текст
                          const Text(
                            "Войти через Google",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
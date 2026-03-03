import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Center(
      child: ElevatedButton.icon(

        onPressed: () {},

        icon: Image.network(
          "https://cdn-icons-png.flaticon.com/512/300/300221.png",
          height: 24,
        ),

        label: Text(
          "Войти через Google",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
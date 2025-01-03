import 'package:cots/modules/main/pages/pesanan_page.dart';
import 'package:cots/modules/main/pages/promo_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Find services, food, or places",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // Feature Grid
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(8.0),
              children: [
                _buildFeatureTile("GoRide", Icons.motorcycle, context),
                _buildFeatureTile("GoCar", Icons.car_rental, context),
                _buildFeatureTile("GoFood", Icons.restaurant, context),
                _buildFeatureTile("More", Icons.more_horiz, context),
              ],
            ),
          ),
          // Promo Section
          Expanded(
            child: ListView(
              children: [
                _buildPromoTile("Promo menarik buat kamu", "Diskon hingga 50%", "assets/promo1.png"),
                _buildPromoTile("Belanja hemat", "Voucher cashback hingga Rp10.000", "assets/promo2.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureTile(String title, IconData icon, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.green.shade100,
          child: Icon(icon, color: Colors.green, size: 30),
        ),
        SizedBox(height: 8),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildPromoTile(String title, String subtitle, String imagePath) {
    return ListTile(
      leading: Image.asset(imagePath, width: 50, height: 50),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:frontend/utils/code/appbar_code.dart';
import 'package:frontend/utils/space_utils.dart';
import 'package:frontend/utils/text_utils.dart';

class ReserveAccount extends StatelessWidget {
  const ReserveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCode(),
      endDrawer: endDrawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildEarningsGrid(),
          sizedBoxH8(),
          _buildTabs(),
          sizedBoxH20(),
          _buildNoDataSection(),
        ],
      ),
    );
  }
}

Widget _earningsCard(String title, String value, Color color) {
  return Container(
    width: 160,
    height: 70,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
    ),
    child: Row(
      children: [
        Container(width: 5, color: color), // Colored Side Border
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              SizedBox(height: 5),
              Text(value,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildEarningsGrid() {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _earningsCard("Today Earnings", "0", Colors.blue),
        _earningsCard("Cumulative Income", "12.56", Colors.green),
        _earningsCard("Team Benefits", "0", Colors.grey),
        _earningsCard("Reservation range", "1 ~ 1,000", Colors.orange),
        _earningsCard("Wallet Balance", "12.57", Colors.cyan),
        _earningsCard("Balance for Reservation", "12.57", Colors.black),
      ],
    ),
  );
}

Widget _buildTabs() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _tabButton("Today's", isSelected: true),
        _tabButton("Reserve"),
        _tabButton("Collection"),
      ],
    ),
  );
}

Widget _tabButton(String label, {bool isSelected = false}) {
  return Column(
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      SizedBox(height: 5),
      if (isSelected)
        Container(
          width: 40,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
    ],
  );
}

Widget _buildNoDataSection() {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        Image.asset("assets/icons/empty.png", height: 120),
        SizedBox(height: 10),
        googleText("No Data Available", fontSize: 18),
        SizedBox(height: 5),
        googleText("GMT+05:30 2025-02-18 01:29:49",
            fontSize: 16, color: Colors.grey),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:frontend/utils/code/appbar_code.dart';
import 'package:frontend/utils/space_utils.dart';
import 'package:frontend/utils/text_utils.dart';

class ReserveAccount extends StatefulWidget {
  const ReserveAccount({super.key});

  @override
  State<ReserveAccount> createState() => _ReserveAccountState();
}

class _ReserveAccountState extends State<ReserveAccount> {
  int _selectedTabIndex = 0; // Tracks the active tab index
  String? _dropdownValue1;
  String? _dropdownValue2;

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
          _buildTabs(context),
          sizedBoxH20(),
          _selectedTabIndex == 1
              ? _buildReserveSection()
              : _buildNoDataSection(),
        ],
      ),
    );
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
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                SizedBox(height: 5),
                Text(value,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color)),
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

  Widget _buildTabs(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.height * 0.06,
        vertical: MediaQuery.of(context).size.width * 0.01,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _tabButton("Today's", 0),
          _tabButton("Reserve", 1),
          _tabButton("Collection", 2),
        ],
      ),
    );
  }

  Widget _tabButton(String label, int index) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Column(
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
      ),
    );
  }

  Widget _buildReserveSection() {
    Map<String, List<String>> levelOptions = {
      "LVL 1": ["5", "10"],
      "LVL 2": ["100", "200"],
      "LVL 3": ["500", "1000"],
    };

    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _dropdownButton(
                "LVL 1",
                ["LVL 1", "LVL 2", "LVL 3"],
                (String? newValue) {
                  setState(() {
                    _dropdownValue1 = newValue;
                    _dropdownValue2 =
                        null; // Reset second dropdown when first changes
                  });
                },
                _dropdownValue1,
              ),
              _dropdownButton(
                "Select Option",
                levelOptions[_dropdownValue1] ?? [],
                (String? newValue) {
                  setState(() {
                    _dropdownValue2 = newValue;
                  });
                },
                _dropdownValue2,
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_dropdownValue1 != null && _dropdownValue2 != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "Reserved with $_dropdownValue1 & $_dropdownValue2"),
                  ),
                );
              }
            },
            child: Text("Confirm"),
          ),
        ],
      ),
    );
  }

  Widget _dropdownButton(
    String hint,
    List<String> items,
    Function(String?) onChanged,
    String? value,
  ) {
    return SizedBox(
      width: 150,
      height: 40,
      child: OutlinedButton(
        onPressed: null, // Dropdown won't open via button click
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 10),
          side: BorderSide(color: Colors.black), // Border styling
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: googleText(hint, fontSize: 12),
            value: value,
            icon: Icon(Icons.arrow_drop_down, color: Colors.black),
            onChanged: onChanged,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: googleText(item, fontSize: 12),
              );
            }).toList(),
          ),
        ),
      ),
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
}

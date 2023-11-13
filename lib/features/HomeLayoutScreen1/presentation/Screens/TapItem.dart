import 'package:flutter/material.dart';

class TapItem extends StatelessWidget {
  // const TapItem({super.key});
  bool Selected = true;
  String Name;

  TapItem(this.Selected, this.Name);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        Name,
        style: TextStyle(color: Selected ? Colors.white : Colors.green),
      ),
      decoration: BoxDecoration(
          color: Selected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.green)),
    );
  }
}

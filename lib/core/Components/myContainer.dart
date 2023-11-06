import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  // const MyContainer({super.key});
  Color? ContColor;
  double? topright;
  double? topleft;
  double? bottomright;
  double? bottomleft;
  String? Imagepath;
  String? text;

  MyContainer(this.ContColor, this.topright, this.topleft, this.bottomright,
      this.bottomleft, this.Imagepath, this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 148,
        height: 171,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Imagepath!),
            Text(
              "${text}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: ContColor,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(bottomright!),
                topLeft: Radius.circular(topleft!),
                topRight: Radius.circular(topright!),
                bottomLeft: Radius.circular(bottomleft!))),
      ),
    );
  }
}

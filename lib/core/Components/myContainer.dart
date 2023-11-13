import 'package:flutter/material.dart';
import 'package:news/features/HomeLayoutScreen1/data/models/CatModel.dart';

class MyContainer extends StatelessWidget {
  // const MyContainer({super.key});
  // Color? ContColor;
  // double? topright;
  // double? topleft;
  // double? bottomright;
  // double? bottomleft;
  // String? Imagepath;
  // String? text;
  //
  // MyContainer(this.ContColor, this.topright, this.topleft, this.bottomright,
  //     this.bottomleft, this.Imagepath, this.text);
  CategoryModel categorymodel;

  MyContainer(this.categorymodel);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 148,
        height: 171,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset(categorymodel.Image ?? "")),
            Text(
              "${categorymodel.name}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: categorymodel.catColor,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(25))),
      ),
    );
  }
}

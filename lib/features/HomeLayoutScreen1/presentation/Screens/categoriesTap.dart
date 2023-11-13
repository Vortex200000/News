import 'package:flutter/material.dart';
import 'package:news/core/Components/myContainer.dart';

import '../../data/models/CatModel.dart';

class CatTap extends StatelessWidget {
  // const CatTap({super.key});

  List<CategoryModel> Categoryes;
  Function onClick;

  CatTap(this.Categoryes, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick your category of interest",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
              children: Categoryes.map((CAT) => InkWell(
                  onTap: () {
                    onClick(CAT);
                  },
                  child: MyContainer(CAT))).toList(),
            ),
          )
        ],
      ),
    );
  }
}

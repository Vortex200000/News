import 'package:flutter/material.dart';

import '../../../../core/Api/ApiManager.dart';
import 'TapControllers.dart';

class NewsTap extends StatelessWidget {
  // const NewsTap({super.key});
  String q = "";
  String catid;

  NewsTap(this.catid);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiRecource.Resource(catid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("An Error Occured"));
        }
        var sourceList = snapshot.data?.sources ?? [];
        return TappControllers(sourceList, q);
      },
    );
  }
}

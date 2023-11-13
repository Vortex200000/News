import 'package:flutter/material.dart';
import 'package:news/features/HomeLayoutScreen1/data/models/SourcesResp.dart';
import 'package:news/features/HomeLayoutScreen1/presentation/Screens/TapItem.dart';

import '../../../../core/Api/ApiManager.dart';
import 'news_card_item.dart';

class TappControllers extends StatefulWidget {
  // const TappControllers({super.key});
  List<Sources> sources;
  String q;

  TappControllers(this.sources, this.q);

  @override
  State<TappControllers> createState() => _TappControllersState();
}

class _TappControllersState extends State<TappControllers> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sources
                    .map(
                      (source) => Tab(
                          child: TapItem(
                              widget.sources.indexOf(source) == selectedIndex,
                              source.name ?? "")),
                    )
                    .toList())),
        FutureBuilder(
          future: ApiRecource.getNewsData(
              widget.sources[selectedIndex].id ?? "", widget.q),
          // ??"" replaces the function .toString()
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("An Error Occured"),
              );
            }

            var newsList = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return NewsCardItem(newsList[index]);
                },
              ),
            );
          },
        )
      ],
    );
  }
}

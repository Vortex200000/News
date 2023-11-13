import 'package:flutter/material.dart';
import 'package:news/core/Api/ApiManager.dart';
import 'package:news/features/HomeLayoutScreen1/data/models/CatModel.dart';
import 'package:news/features/HomeLayoutScreen1/presentation/Screens/News.dart';
import 'package:news/features/HomeLayoutScreen1/presentation/Screens/TapControllers.dart';

import 'categoriesTap.dart';

class Home extends StatefulWidget {
  // const Home({super.key});
  static const String routeName = 'Home';
  bool searchBar = false;
  String? q;

  List<CategoryModel> cats = CategoryModel.getCategories();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: !widget.searchBar
              ? [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.searchBar = true;
                          });
                        },
                        icon: Icon(Icons.search)),
                  )
                ]
              : [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.searchBar = false;
                          });
                        },
                        icon: Icon(Icons.clear)),
                  )
                ],
          toolbarHeight: 97,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50))),
          centerTitle: true,
          backgroundColor: Color(0xff39A552),
          title: !widget.searchBar
              ? Text('News')
              : SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: TextField(
                    onSubmitted: (value) {
                      widget.q = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        fillColor: Colors.white,
                        filled: true,
                        focusColor: Colors.black87,
                        prefixIcon: IconButton(
                            onPressed: () {}, icon: Icon(Icons.clear))),
                  ),
                ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 110,
                color: Colors.green,
                child: Center(
                    child: Text(
                  "News App!",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 29),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        ondrawerclick();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.menu,
                            color: Colors.black87,
                            size: 30,
                          ),
                          SizedBox(
                            width: 16.5,
                          ),
                          Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings_rounded,
                            color: Colors.black87,
                            size: 30,
                          ),
                          SizedBox(
                            width: 16.5,
                          ),
                          Text("Settings",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: categoryModel == null
            ? CatTap(widget.cats, oncatclicked)
            : NewsTap(categoryModel!.id ?? ""),
        // body: FutureBuilder(future: ApiRecource.Resource(), builder: (context, snapshot) {
        //   if(snapshot.connectionState == ConnectionState.waiting)
        //     {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //   if(snapshot.hasError)
        //     {
        //       return Center(child: Text("An Error Occured"));
        //     }
        //   var sourceList = snapshot.data?.sources??[];
        //       return  TappControllers(sourceList, widget.q);
        //
        // },),
      ),
    );
  }

  CategoryModel? categoryModel = null;

  oncatclicked(category) {
    categoryModel = category;
    setState(() {});
  }

  ondrawerclick() {
    categoryModel = null;
    setState(() {});
    Navigator.pop(context);
  }
}

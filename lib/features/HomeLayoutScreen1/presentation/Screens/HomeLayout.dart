import 'package:flutter/material.dart';
import 'package:news/core/Api/ApiManager.dart';
import 'package:news/core/Components/myContainer.dart';

class Home extends StatefulWidget {
  // const Home({super.key});
  static const String routeName = 'Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 97,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50))),
          centerTitle: true,
          backgroundColor: Color(0xff39A552),
          title: Text('News'),
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
                      onTap: () {},
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
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/pattern.png"),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 36, right: 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pick Your Category ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                            fontSize: 22),
                      ),
                      Text("Of Interest",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                              fontSize: 22))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 37, vertical: 29),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyContainer(Color(0xffC91C22), 25, 25, 25, 0,
                              "assets/images/ball.png", "Sports"),
                          SizedBox(
                            width: 25,
                          ),
                          MyContainer(Color(0xff003E90), 25, 25, 0, 25,
                              "assets/images/Politics.png", "Politics"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          MyContainer(Color(0xffED1E79), 25, 25, 0, 25,
                              "assets/images/health.png", "Health"),
                          SizedBox(
                            width: 25,
                          ),
                          MyContainer(Color(0xffCF7E48), 25, 25, 0, 25,
                              "assets/images/bussines.png", "Business"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          MyContainer(Color(0xff4882CF), 25, 25, 25, 0,
                              "assets/images/environment.png", "Environment"),
                          SizedBox(
                            width: 25,
                          ),
                          MyContainer(Color(0xffF2D352), 25, 25, 0, 25,
                              "assets/images/science.png", "Science"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        // FutureBuilder(
        //   future: ApiRecource.Resource(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //     if (snapshot.hasError) {
        //       return Center(child: Text("Error Occured"));
        //     }
        //     var source = snapshot.data?.sources ?? [];
        //     return ListView.builder(
        //       itemBuilder: (context, index) {
        //         return Text(source[index].name ?? "");
        //       },
        //       itemCount: source.length,
        //     );
        //   },
        // ),

        );
  }
}

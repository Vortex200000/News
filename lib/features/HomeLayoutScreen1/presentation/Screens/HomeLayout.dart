import 'package:flutter/material.dart';
import 'package:news/core/Api/ApiManager.dart';

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
      extendBodyBehindAppBar: true,
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
      drawer: Drawer(),
      body: Stack(
        children: [
          Image.asset("assets/images/pattern.png"),
          FutureBuilder(
            future: ApiRecource.Resource(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Error Occured"));
              }
              var source = snapshot.data?.sources ?? [];
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Text(source[index].name ?? "");
                },
                itemCount: source.length,
              );
            },
          ),
        ],
      ),
    );
  }
}

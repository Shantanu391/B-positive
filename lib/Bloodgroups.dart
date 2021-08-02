import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'abo.dart';


class Bloodgroups extends StatelessWidget{
  String body;
  Bloodgroups(String a){
    this.body=a;
  }

  int selectedPos = 0;
  double bottomNavBarHeight = 0;

  List<String> nameslist = ["AB", "A", "B","O","AB-","A-","B-","O-"];
  List<String> imageslist = [
    "assets/gene.png",
    "assets/gene.png",
    "assets/gene.png",
    "assets/gene.png",
    "assets/gene.png",
    "assets/gene.png",
    "assets/gene.png",
    "assets/gene.png"

  ];

  List<String> nameslist2 = ["Platelets", "Plasmas", "Thanos"];
  List<String> imageslist2 = [
    "assets/gene.png",
    "assets/gene.png",
    "assets/gene.png"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch(body){
      case "ABO":
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("Blood Groups"),
              actions: <Widget>[
                IconButton(
                    icon: Icon(FontAwesomeIcons.home),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
            body: Stack(
              children: <Widget>[
                Padding(
                  child: bodyContainer(),
                  padding: EdgeInsets.only(bottom: bottomNavBarHeight),
                ),
                Align(alignment: Alignment.bottomCenter)
              ],
            )
        );
      case "RH":
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("Blood Groups"),
              actions: <Widget>[
                IconButton(
                    icon: Icon(FontAwesomeIcons.home),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
            body: Stack(

            )
        );
      case "H-Anitgen":
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("Blood Groups"),
              actions: <Widget>[
                IconButton(
                    icon: Icon(FontAwesomeIcons.home),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
            body: Stack(
            )
        );

      case "Kell":
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("Blood Groups"),
              actions: <Widget>[
                IconButton(
                    icon: Icon(FontAwesomeIcons.home),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
            body: Stack(
            )
        );

      case "Dutty":
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("Blood Groups"),
              actions: <Widget>[
                IconButton(
                    icon: Icon(FontAwesomeIcons.home),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
            body: Stack(
            )
        );

    }
  }

  Widget bodyContainer() {

    return mygridview(nameslist, imageslist, 2, Colors.red);


  }

  Widget bodyContainer2() {

    return mygridview(nameslist2, imageslist2, 2, Colors.red);


  }
}

class mygridview extends StatelessWidget {
  List<String> nameslist, imageslist;
  int grid_count = 3;
  Color bgcolor;
  mygridview(nlist, ilist, gridcount, bcolor) {
    this.nameslist = nlist;
    this.imageslist = ilist;
    this.grid_count = gridcount;
    this.bgcolor = bcolor;
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> Cardlist = new List<Widget>();
    for (int i = 0; i < nameslist.length; i++) {
      Cardlist.add(getCard(nameslist[i], imageslist[i], bgcolor, context));
    }
    return GridView.count(
      crossAxisCount: grid_count,
      scrollDirection: Axis.vertical,
      children: Cardlist,
      mainAxisSpacing: 25,
      crossAxisSpacing: 1,
      padding: EdgeInsets.all(1),
    );
  }
}

Widget getCard(String name, String image, Color bcolor, BuildContext context) {
  return Padding(
      padding: EdgeInsets.all(1),
      child: Card(
          color: Color.fromRGBO(253, 234 ,220, 100),
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  30))), //RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
          //color: bcolor,
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  GestureDetector(
                    child: Image.asset(
                      image,
                    ),
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => abo(name)));

                    },
                  ),
//                  Text(
//                    name,
//                    style: TextStyle(color: Colors.red),
//                  ),
//                  Text(
//                    name,
//                    style: TextStyle(color: Colors.red),
//                  ),
                ],
              ))));
}


import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class abo extends StatelessWidget{
  String body;
  abo(String a){
    this.body=a;
  }

  int selectedPos = 0;
  double bottomNavBarHeight = 0;

  List<String> nameslist = ["AB", "A", "B","O","AB-","A-"];
  List<String> imageslist = [
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
      case "AB":
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("Be+ve"),
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
      case "A":
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("Be+ve"),
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
      case "B":
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("Be+ve"),
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

      case "O":
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("Be+ve"),
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

      case "AB-":
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("Be+ve"),
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

      case "A-":
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("Be+ve"),
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

      case "B-":
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("Be+ve"),
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

      case "O-":
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("Be+ve"),
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

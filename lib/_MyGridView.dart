import 'package:flutter/material.dart';

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
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      padding: EdgeInsets.all(1),
    );
  }
}


Widget getCard(String name, String image, Color bcolor, BuildContext context) {
  double maxWidth = MediaQuery.of(context).size.width;
  double maxHeight = MediaQuery.of(context).size.height;
  return Padding(
      padding: EdgeInsets.all(1),
      child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  30))), //RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
          //color: bcolor,
          child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                   verticalDirection: VerticalDirection.down,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Image.asset(
                        image,
                      ),
                      Text(
                        name,
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        name,
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ))));
}

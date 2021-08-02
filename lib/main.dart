import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'BloodComponents.dart';
import 'dark.dart';
import 'CustomTheme.dart';
import 'themes.dart';

void main() {
  runApp(
    CustomTheme(
      initialThemeKey: MyThemeKeys.LIGHT,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'B+ve',
      theme:CustomTheme.of(context),
      home: MyHomePage(title: 'circular_bottom_navigation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPos = 0;
  String a;
  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Blood Basics", Colors.blue,
        labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
    new TabItem(Icons.search, "Blood Donation", Colors.orange,
        labelStyle: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
    new TabItem(Icons.settings, "Settings", Colors.red,
        labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
  ]);

  CircularBottomNavigationController _navigationController;
  List<String> nameslist = ["Im Ironman", "Spiderman", "Thanos"];
  List<String> imageslist = [
    "assets/Blood Groups.png",
    "assets/Blood Components.png",
    "assets/Hematological Terms.png"
  ];

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        leading: Padding(
//          padding: EdgeInsets.only(left: 12),
//          child: IconButton(
//            icon: Icon(Icons.search),
//            onPressed: () {}, // omitting onPressed makes the button disabled
//          ),
//        ), // 1
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // centers horizontally
          crossAxisAlignment: CrossAxisAlignment.center, // centers vertically
          children: <Widget>[
            Text("B+ve"),
            //Image.asset("assets/im1.jpg", width: 70),
          ],
        ), // 2
        centerTitle: true,
        actions: <Widget>[], // 3
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  final emailField = TextField(
    obscureText: true,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final passwordField = TextField(
    obscureText: true,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final loginButon = Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Colors.red,
    child: MaterialButton(
      minWidth: 10.0,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () {},
      child: Text("Login",
          textAlign: TextAlign.center,
           ),
    ),
  );

  Widget bodyContainer() {
    Color selectedColor = tabItems[selectedPos].circleColor;
    String slogan;
    switch (selectedPos) {
      case 0:
        return mygridview(nameslist, imageslist, 2, Colors.red);
      case 1:
        return Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 155.0,
                          child: Image.asset(
                            "assets/icon.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 45.0),
                        emailField,
                        SizedBox(height: 25.0),
                        passwordField,
                        SizedBox(
                          height: 35.0,
                        ),
                        loginButon,
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
        );
        break;
      case 2:
        return mygridview2(nameslist, imageslist, 2, Colors.red);
        break;
    }

    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: selectedColor,
        child: Center(
          child: Text(
            slogan,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      onTap: () {
        if (_navigationController.value == tabItems.length - 1) {
          _navigationController.value = 0;
        } else {
          _navigationController.value++;
        }
      },
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
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

class mygridview2 extends StatelessWidget {
  List<String> nameslist, imageslist;
  int grid_count = 3;
  Color bgcolor;
  mygridview2(nlist, ilist, gridcount, bcolor) {
    this.nameslist = nlist;
    this.imageslist = ilist;
    this.grid_count = gridcount;
    this.bgcolor = bcolor;
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> Cardlist = new List<Widget>();
    for (int i = 0; i < nameslist.length; i++) {
      Cardlist.add(getCard2(nameslist[i], imageslist[i], bgcolor, context));
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BloodComponents(name)));
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

Widget getCard2(String name, String image, Color bcolor, BuildContext context) {
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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


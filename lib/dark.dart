import 'CustomTheme.dart';
import 'themes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Homepage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  _changeTheme(context, MyThemeKeys.LIGHT);
                },
                child: Text("Light!"),
              ),
              RaisedButton(
                onPressed: () {
                  _changeTheme(context, MyThemeKeys.DARKER);
                },
                child: Text("Darker!"),
              ),
              Divider(height: 100,),

            ],
          ),
        ),
      ),
    );
  }
}
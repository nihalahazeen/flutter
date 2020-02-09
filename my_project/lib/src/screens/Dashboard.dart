import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../shared/colors.dart';
import '../shared/app_icons.dart';
import '../shared/Product.dart';
import '../shared/partials.dart';
import './About.dart';

class Dashboard extends StatefulWidget {
  final String pageTitle;

  Dashboard({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    final _tabs = [
      storeTab(context),
      Text('Store'),
      Text('My Cart'),
      Text('Tab5'),
    ];

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          title:
              Text('My App', textAlign: TextAlign.center),
        ),
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text('ABC'),
                accountEmail: new Text('abc@abc.com'),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
                ),
                ),
                new ListTile(
                  title: new Text('About Page'),
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new AboutPage())
                      );
                  }
                )
            ],)
        ),
        body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(App.home),
                title: Text(
                  'Home',
                  
                )),
            BottomNavigationBarItem(
                icon: Icon(App.shop),
                title: Text(
                  'Store',
                  
                )),
            BottomNavigationBarItem(
                icon: Icon(App.cart),
                title: Text(
                  'My Cart',
                  
                )),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green[600],
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
Widget storeTab(BuildContext context) {
  List <Product> category = [
    Product(
        name: "Fresh Food",
        image: "images/img1.jpeg"
    ),
    Product(
        name: "Grocery",
        image: "images/img2.jpeg"
    )
  ];
  return ListView(children: <Widget>[
    categories('Categories',onViewMore: () {}, items: <Widget>[
                shopItem(category[0], onTapped: () {}),
                shopItem(category[1], onTapped: () {})
                ])
              ],
          );
}


Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: FlatButton(
          onPressed: onViewMore,
          child: Text('View all ›')
        ),
      )
    ],
  );
}

Widget categories(String dealTitle, {onViewMore, List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('No items available at this moment.')
                    )
                  ],
          ),
        )
      ],
    ),
  );
}
                
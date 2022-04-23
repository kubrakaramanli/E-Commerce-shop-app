import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//my own imports
import 'package:shopapp/compnents/horizontal_listview.dart';
import 'package:shopapp/compnents/products.dart';
import 'package:shopapp/pages/cart.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget image_carousel = new Container(
      height: 150.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/kapak.jpg'),
          AssetImage('images/kapak2.jpg'),
          AssetImage('images/kapak3.jpg')

        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000 ),

        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotColor: Colors.transparent,
      ),
    );


    return Scaffold(
      appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.red,
          title: Text('ELEGANCE '),
          actions: <Widget>[
            new IconButton( icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
            new IconButton( icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>new Cart()));

            }),
          ]
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            // header
            new UserAccountsDrawerHeader(
              accountName: Text('kübra karamanlı'),
              accountEmail: Text('karamanlikubra@gmail.com'),
              currentAccountPicture:GestureDetector(
                  child: new CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      child: Icon(Icons.person, color: Colors.white)
                  )
              ),
              decoration: new BoxDecoration(
                  color: Colors.red
              ),
            ),
// body
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket, color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));

              },
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.dashboard, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favorites'),
                leading: Icon(Icons.favorite, color: Colors.red,),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.blueGrey,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.blueGrey,),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          //image carousel begin here
          image_carousel,
          // padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
            child:  Container(
                alignment: Alignment.centerLeft,
                child: new Text('Categories')),),

          //Horizontal list view begin here
          HorizontalList(),
          // padding widget
          new Padding(padding: const EdgeInsets.all(20.0),
            child:  Container(
                alignment: Alignment.centerLeft,
                child: new Text('Recent Product')),),

          // grid view
          Flexible(child: Products()),
        ],
      ),
    );


  }
}

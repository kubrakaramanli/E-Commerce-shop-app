import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name":"Academic Agenda",
      "picture": "images/products/akajanda4.jpg",
     // "old_price": 60.00,
      "price":39.99,
      "size": "17x24",
      "color":"Green",
      "quantity": 1
    },
    {
      "name":"Women Dress",
      "picture": "images/products/tülelbise.jpg",
      //"old_price": 150.00,
      "price":89.00,
      "size": "S",
      "color":"Black",
      "quantity": 1
    },


  ];


  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemCount: Products_on_the_cart.length,
      itemBuilder: (context, index){
      return Single_cart_product(
        cart_product_name: Products_on_the_cart[index]["name"],
        cart_product_color: Products_on_the_cart[index]["color"],
        cart_product_qty: Products_on_the_cart[index]["quantity"],
        cart_product_size: Products_on_the_cart[index]["size"],
        cart_product_price: Products_on_the_cart[index]["price"],
        cart_product_picture: Products_on_the_cart[index]["picture"],
      );
      },
    );
  }
}


class Single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_product_price;
  final cart_product_size;
  final cart_product_color;
  final cart_product_qty;

  Single_cart_product({
    this.cart_product_name,
    this.cart_product_picture,
    this.cart_product_price,
    this.cart_product_size,
    this.cart_product_color,
    this.cart_product_qty
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //-------Leading section -------
        leading: new Image.asset(
         cart_product_picture, width: 80.0,height: 80.0,),
        //---------title section--------
        title: new Text(cart_product_name),
        //--Subtitle Section-------
        subtitle: new Row(
          children: <Widget>[
        new Column(
          children: <Widget>[
            //row inside the column
            new Row(
              children: <Widget>[
                // this section is for the size of the product

                    Padding(padding: const EdgeInsets.all(0.0),
                      child: new Text("size"),
                    ),
                    Padding(padding: const EdgeInsets.all(4.0),
                      child: new Text(cart_product_size),
                    ),
                //-------this section of for the product color----
                new Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 10.0, 10.0, 10.0),
                  child: new Text("color"),),
                Padding(padding: const EdgeInsets.all(20.0),
                  child: new Text(cart_product_color),
                ),
    ]
            ),
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "${cart_product_price}\TL", style: TextStyle(fontSize: 15.0,
                  fontWeight: FontWeight.bold, color: Colors.red,),),
            ),
          ],
        ),
            new Column(
                  //verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
                    new Text("$cart_product_qty"),
                    new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){})
                  ],
                ),
              ],
            ),
        ),
    );
  }
}
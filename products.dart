import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}
class _ProductsState extends State<Products> {
  var products_List=[
    {
      "name":"Academic Agenda",
      "picture": "images/products/akajanda4.jpg",
      "old_price": 60.00,
      "price":39.99,
    },
    {
      "name":"Women Dress",
      "picture": "images/products/tülelbise.jpg",
      "old_price": 150.00,
      "price":89.00,
    },
    {
      "name":"Women Dress",
      "picture": "images/products/lacielbise.jpg",
      "old_price": 300.00,
      "price":189.99,
    },
    {
      "name":"Men Shirts",
      "picture": "images/products/ergomlek.jpg",
      "old_price": 150.00,
      "price":100.00,
    },
   {
      "name":"Men Trousers",
      "picture": "images/products/erpant1.jpg",
      "old_price": 280.00,
      "price":129.99,
    },
    {
      "name":"Women Heeled Shoes",
      "picture": "images/products/kadstil.jpg",
      "old_price": 299.99,
      "price":149.99,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products_List.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(4.0),
           child: single_products(
           product_name: products_List[index]['name'],
            product_picture: products_List[index]['picture'],
            product_oldprice: products_List[index]['old_price'],
            product_price: products_List[index]['price'],
          ),
          );
        }) ;
  }
}
 class single_products extends StatelessWidget {
   final product_name;
   final product_picture;
   final product_oldprice;
   final product_price;
   single_products({
   this.product_name,
   this.product_picture,
   this.product_oldprice,
   this.product_price,
   }
       );
   @override
   Widget build(BuildContext context) {
     return Card(
       child: Hero(
         tag: new Text("hero 1 "),
         child: Material(
           child: InkWell(
             onTap: ()=>
                 Navigator.of(context).push(
                     new MaterialPageRoute(
                     //here we are passing the values of the product to the product details page
                         builder: (context)=>new ProductDetails(
                       product_detail_name:product_name,
                       product_detail_newprice: product_price,
                       product_detail_oldprice: product_oldprice,
                       product_detail_picture: product_picture,


                     ))),

              child: GridTile(
                 footer:Container(color: Colors.white70,
                 child: new Row(children : <Widget>[
                   Expanded(
                     child: Text(product_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                 ),
                   new Text("${product_price} \TL", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                   ],
                 )
                 ),
                   child: Image.asset(product_picture,
                   fit: BoxFit.cover,
           )),
       ),
     ),
       ),
     );
   }
}




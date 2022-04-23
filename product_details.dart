import 'package:flutter/material.dart';
import 'package:shopapp/main.dart';
//import 'package:shopapp/pages/home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_newprice;
  final product_detail_oldprice;
  final product_detail_picture;
  ProductDetails({
    this.product_detail_name,
    this.product_detail_newprice,
    this.product_detail_oldprice,
    this.product_detail_picture
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.red,
          title: InkWell(onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new HomePage()));
          },
            child: Text('ELEGANCE '),),
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.search, color: Colors.white,),
                onPressed: () {}),
            //new IconButton( icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: (){}),
          ]
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(widget.product_detail_name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("${widget.product_detail_oldprice}\TL",
                          style: TextStyle(color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),

                      Expanded(
                          child: new Text(
                            "${widget.product_detail_newprice}\TL",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.red),
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //---------the first botton-------

          Row(
            children: <Widget>[

              //-------the size button----------
              Expanded(
                child: MaterialButton(onPressed: () {
                  showDialog(context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Size"),
                          content: new Text("Choose size"),
                          actions: <Widget>[
                            new MaterialButton(onPressed: () {
                              Navigator.of(context).pop(context);
                            },
                              child: new Text("Close"),)
                          ],
                        );
                      });
                },

                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text("Size")
                      ),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(onPressed: () {
                  showDialog(context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Color"),
                          content: new Text("choose the Color"),
                          actions: <Widget>[
                            new MaterialButton(onPressed: () {
                              Navigator.of(context).pop(context);
                            },
                              child: new Text(" Close"),)
                          ],
                        );
                      });
                },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text("Color")
                      ),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(onPressed: () {
                  showDialog(context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Quantity"),
                          content: new Text("Quantity"),
                          actions: <Widget>[
                            new MaterialButton(onPressed: () {
                              Navigator.of(context).pop(context);
                            },
                              child: new Text("Close"),)
                          ],
                        );
                      });
                },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text("Quantity")
                      ),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

            ],
          ),

          //--------the second button------

          Row(
            children: <Widget>[

              //-------the size button----------
              Expanded(
                child: MaterialButton(onPressed: () {
                  showDialog(context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Buy now"),
                          content: new Text(" "),
                          actions: <Widget>[
                            new MaterialButton(onPressed: () {
                              Navigator.of(context).pop(context);
                            },
                              child: new Text("Close"),)
                          ],
                        );
                      });
                },
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Buy Now"),
                ),
              ),

              new IconButton(
                  icon: Icon(Icons.add_shopping_cart), onPressed: () {}),
              new IconButton(icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () {}),
            ],
          ),

          Divider(
          ),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text(
                "15 gün içinde ücretsiz iade.Modelin Ölçüleri: Boy: 1.72, Göğüs: 76, Bel: 56, Kalça: 85Mankenin üzerindeki ürün S/36 bedendir. %100 Polyester, Dokuma KumaşOmuzdan Boy: 90 cm."),
          ),
          Divider(),
          new Row(children: <Widget>[
            Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text(
                "Product Name", style: TextStyle(color: Colors.grey),),),
            Padding(padding: EdgeInsets.all(5.0),
              child: new Text(widget.product_detail_name),)
          ],),

          new Row(children: <Widget>[
            Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text(
                "Product Brand", style: TextStyle(color: Colors.grey),),),

            // remember to create the product brand
            Padding(padding: EdgeInsets.all(5.0),
              child: new Text("Brand X"),)
          ],),

          //add the product condition
          new Row(children: <Widget>[
            Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text(
                "Product Condition", style: TextStyle(color: Colors.grey),),),
            Padding(padding: EdgeInsets.all(5.0),
              child: new Text("New"),)
          ],),

          Divider(),
          Padding(padding: const EdgeInsets.all(8.0),
          child: new Text("Similar products"),
          ),
      




          //--------similar product section
          Container(
            height: 360.0,
            child: Similar_Product(),
          )

        ],
      ),
    );
  }}
  
  class Similar_Product extends StatefulWidget {
    @override
    _Similar_ProductState createState() => _Similar_ProductState();
  }
  
  class _Similar_ProductState extends State<Similar_Product> {
    var products_List=[
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
            return Similar_single_products(
              product_name: products_List[index]['name'],
              product_picture: products_List[index]['picture'],
              product_oldprice: products_List[index]['old_price'],
              product_price: products_List[index]['price'],
            );
          }) ;
    }
  }

class Similar_single_products extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_oldprice;
  final product_price;
  Similar_single_products({
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

  

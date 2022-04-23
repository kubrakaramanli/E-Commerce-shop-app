import'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget> [
          Category(
            image_location: 'images/categories/akajandasem.png',
            image_caption: 'Agenda',
          ),
          Category(
            image_location: 'images/categories/cantasem.jpg',
            image_caption: 'Bag',
          ),
          Category(
            image_location: 'images/categories/elbisesem.jpg',
            image_caption: 'Dress',
          ),
         Category(
            image_location: 'images/categories/kadgomsem1.jpg',
            image_caption: 'Shirt',
          ),
        Category(
            image_location: 'images/categories/kadpant1.jpg',
            image_caption: 'Pant',
          ),
          Category(
            image_location: 'images/categories/kadtopuksem1.jpg',
            image_caption: 'Shoes',
          ),
          Category(
            image_location: 'images/categories/ergomsem.jpg',
            image_caption: 'Shirt',
          ),
          Category(
            image_location: 'images/categories/erpantsem.jpg',
            image_caption: 'Pants',
          ),
          Category(
            image_location: 'images/categories/erayakkasem.jpg',
            image_caption: 'Shoes',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(image_location, width: 100.0, height: 80.0,),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption, style: new TextStyle(fontSize: 12.0), ),
            )

          ),
        ),
      ),
    );
  }
}

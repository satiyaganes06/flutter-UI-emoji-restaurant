import 'package:emoji_restaurant/Pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';


class ListDownFoodItem extends StatefulWidget {

  String imgPath;
  String foodName;
  int discountFoodPrice;
  int foodPrice;
  double starCounts;
  int i;

  ListDownFoodItem(this.imgPath, this.foodName, this.discountFoodPrice, 
        this.foodPrice, this.starCounts, this.i);

  @override
  _ListDownFoodItemState createState() => _ListDownFoodItemState();
}

class _ListDownFoodItemState extends State<ListDownFoodItem> {
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductPage(
             'btnS${widget.i}', 
             widget.foodName,  
             widget.discountFoodPrice, 
             widget.imgPath
          )
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                padding: const EdgeInsets.all(15),
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Hero(
                  tag: 'btnS${widget.i}',
                  child: Image.asset(widget.imgPath, height:50.0, width:50.0)
                )
            ),

            Container(
              padding: const EdgeInsets.all(10),
              width: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.foodName, style: GoogleFonts.notoSans(
                    fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                    RatingStars(
                    value: widget.starCounts,
                    starCount: 5,
                    starSize: 13,
                    starColor: Colors.orangeAccent,
                    starSpacing: 1,
                    valueLabelVisibility: false,
                  ),
                    RichText(
                    text: TextSpan(
                      children: [
                          TextSpan(
                            text: '\$${widget.discountFoodPrice}', style: TextStyle(fontSize: 18, color: Colors.redAccent)
                          ),
                          TextSpan(
                          text: ' \$${widget.foodPrice}', style: TextStyle(
                            fontSize: 12, 
                            color: Colors.grey.withOpacity(0.5),
                            decoration: TextDecoration.lineThrough,
                          )
                        ),
                      ]
                    )
                  )
                  
                ],
              ),
            ),
            
            FloatingActionButton(
              onPressed: (){
                
              },
              heroTag: null,
              backgroundColor: Colors.red[200],
              child: const Icon(Icons.add, size: 30),
              mini: true,
            )
          ]
        )
      )
    );
  }
}
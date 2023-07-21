import 'package:emoji_restaurant/Pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class RecomItemCard extends StatefulWidget {
  var bgColor;
  var wordBgColor;
  String imgPath;
  String foodName;
  int foodPrice;
  int i;

  RecomItemCard(this.bgColor, this.wordBgColor, this.imgPath, this.foodName, this.foodPrice, this.i);
  
  @override
  _RecomItemCardState createState() => _RecomItemCardState();
}

class _RecomItemCardState extends State<RecomItemCard> {
  String symbol_price = "\$" ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right:15),
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => 
            ProductPage(
             'btn${widget.i}', 
             widget.foodName,  
             widget.foodPrice, 
             widget.imgPath,
          )));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'btn${widget.i}',
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                child: Image.asset(widget.imgPath, height: 55),
              ),
            ),
            
            const SizedBox(height:25),
              Text(widget.foodName, 
              style: GoogleFonts.ubuntu(
                fontSize: 18,
                letterSpacing: 1,
                color: widget.wordBgColor
              )
            ),
              Text(symbol_price + widget.foodPrice.toString(), 
              style: GoogleFonts.ubuntu(
                fontSize: 18,
                letterSpacing: 1,
                color:  widget.wordBgColor
              )
            )
          ],
        )
      )
    );
  }
}
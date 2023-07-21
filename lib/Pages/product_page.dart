import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {

   String imgPath;
   String foodName;
   String heroTag;
   int discountFoodPrice;

   ProductPage(this.heroTag, this.foodName, this.discountFoodPrice, this.imgPath);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  var counter = 1;
  var cartCount = 1;

  void productCountCalc(String opt){
    
    if(opt == 'add'){
      setState(() {
        counter++;
      });
    }else if(opt == 'minus'){
      if(counter != 1){
        setState(() {
          counter--;
        });
      }else{
        Fluttertoast.showToast(msg: 'Minimum is 1 !!!');
      }
    }

  }

  void cartProductCalc(){
    setState(() {
      cartCount += counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                    InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(50),
                      child: const Center(
                        child: Icon(Icons.arrow_back_rounded, size:30),
                      ),
                    ),

                  Stack(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.transparent,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              boxShadow:  [
                                BoxShadow(
                                  color: const Color(0xFFFE7D6A).withOpacity(0.3),
                                  offset: const Offset(
                                      0.0, // Move to right 10  horizontally
                                      4.0, // Move to bottom 10 Vertically
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 3.0,
                                )
                              ],
                            shape: BoxShape.circle,
                            color: Colors.red[300]
                          ),
                          child: const Center(
                            child:  Icon(
                              Icons.local_grocery_store_rounded, 
                              size:28,
                              color: Colors.white,
                            )
                          )
                        ),
                           
                      ),
                        Positioned(
                        top: 0.0,
                        right:4.0,
                        child: Container(
                          height: 14,
                          width: 14,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Text('$cartCount', 
                            style: TextStyle(
                              color: Colors.red[200],
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                            ), textAlign: TextAlign.center,
                          )
                        )
                      )
                    ]
                  ),
                  ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(right:20, left:20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SUPER', style: GoogleFonts.merriweatherSans(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  )),
                    Text(widget.foodName.toUpperCase(), style: GoogleFonts.merriweatherSans(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ), overflow: TextOverflow.clip,)
                ]
              ), 
            ),

            const SizedBox(height:40),

            Padding(
              padding: const EdgeInsets.only(right:20, left:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   
                  Hero(
                    tag: widget.heroTag,
                    child: Container(
                      width: 230,
                      height: 230,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.imgPath),
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                  ),
                  
                  
                  Container(
                    width: 60,
                    height: 250,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color : const Color(0xFFFE7D6A).withOpacity(0.2),
                                offset : const Offset(0.0, 6.0),
                                blurRadius : 15.0,
                                spreadRadius : 1.0,
                              )
                            ]
                          ),
                            child: const Center(
                            child: Icon(Icons.favorite_border, 
                              color: Colors.redAccent, size: 30,),
                          ),
                        ),
                          const SizedBox(height:40),
                          Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color : const Color(0xFFFE7D6A).withOpacity(0.2),
                                offset : const Offset(0.0, 6.0),
                                blurRadius : 15.0,
                                spreadRadius : 1.0,
                              )
                            ]
                          ),
                            child: const Center(
                            child: Icon(Icons.history, 
                              color: Colors.redAccent, size: 30,),
                          ),
                        )
                        ]
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height:10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height:70,
                    color: Colors.white,
                    child: FittedBox(
                      child: Text('\$${widget.discountFoodPrice}',
                      style: TextStyle(
                        color: Colors.grey[700]
                      ))
                    ),
                  ),
                ),

                Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.red[300],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10), 
                        bottomLeft: Radius.circular(10)
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow:  [
                              BoxShadow(
                                color : Colors.grey.withOpacity(0.4),
                                offset : const Offset(0.0, 2.0),
                                blurRadius : 1.0,
                                spreadRadius : 1.0,
                              )
                            ]
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                flex:3,
                                fit: FlexFit.tight,
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  child: InkWell(
                                    onTap: (){
                                      productCountCalc('minus');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.transparent
                                      ),
                                      child: Center(
                                        child: Icon(Icons.remove, size: 20, color: Colors.red[300])
                                      )
                                    )
                                  )
                                )
                              ),
                                Flexible(
                                flex:1,
                                fit: FlexFit.tight,
                                child: Container(
                                  color: Colors.transparent,
                                  child: Text('$counter', style: TextStyle(
                                    color: Colors.red[300]
                                  ), textAlign: TextAlign.center),
                                )
                              ),
                                Flexible(
                                flex:3,
                                fit: FlexFit.tight,
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  child: InkWell(
                                    onTap: (){
                                      productCountCalc('add');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Icon(Icons.add, size: 20, color: Colors.red[300])
                                      )
                                    )
                                  )
                                )
                              ),
                            ]
                          )
                        ),

                        InkWell(
                          onTap: (){
                            cartProductCalc();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 15),
                            width: 100,
                            child: const FittedBox(
                              child: Text('Add to cart',
                                style: TextStyle(
                                  color: Colors.white
                                )
                              ),
                            ),
                          )
                        )
                      ]
                    )
                  ),
                ),
              ]
            ),
          
            const SizedBox(height:20),

            Padding(
              padding: const EdgeInsets.only(right:20, left:20),
              child: Text('FEATURED', style: GoogleFonts.notoSans(
                    fontSize: 18.0, 
                    fontWeight: FontWeight.bold
              ))
            ),


          ],
        )
      )
    );
  }
}


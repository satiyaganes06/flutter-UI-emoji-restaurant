import 'package:emoji_restaurant/Database/database.dart';
import 'package:emoji_restaurant/Widgets/foodtab.dart';
import 'package:emoji_restaurant/Widgets/listdown_fooditem.dart';
import 'package:emoji_restaurant/Widgets/recom_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({ Key? key }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> 
  with SingleTickerProviderStateMixin{

  var tabController;

  var database = Database();
  var searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children:[
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu_rounded, size:30),
                    Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                        image: AssetImage('assets/tuxedo.png'), 
                        fit: BoxFit.fill
                      ),
                        boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20.0, // soften the shadow
                          spreadRadius: 3.0, //extend the shadow
                          offset: Offset(
                            1.0, // Move to right 10  horizontally
                            1.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ]
                    ),
                  ),
                ],
            ),
            
            Container(
              margin: const EdgeInsets.only(top:10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SEARCH FOR ',
                    style: GoogleFonts.bebasNeue(
                      fontSize:40,
                      letterSpacing: 2
                    )
                  ),
                  Text('RECIPES',
                    style: GoogleFonts.bebasNeue(
                      fontSize:40,
                      letterSpacing: 2
                    )
                  )
                ]
              )
            ),

            const SizedBox(height: 25.0),
            
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)
              ),
              child: TextFormField(
                controller: searchTextController,
                decoration: const InputDecoration(
                  border:  InputBorder.none,
                  prefixIcon: Icon(Icons.search, size:25),
                  hintText: 'Search',
                ),
                cursorColor: Colors.black,
              ),
            ),

            const SizedBox(height:20),

            Padding(
              padding: const EdgeInsets.only(top:10, bottom: 10),
              child: Text('Recommended',
              style: GoogleFonts.nunitoSans(
                fontSize: 20,
                letterSpacing:1
              ))
            ),

            Container(
              padding: const EdgeInsets.only(top:10),
              height: 200,
              child: ListView.builder(
                itemBuilder: (bCtx, i){
                  return RecomItemCard(
                    database.recomFoodList[i].bgColor,
                    database.recomFoodList[i].wordBgColor,
                    database.recomFoodList[i].imgPath,
                    database.recomFoodList[i].foodName,
                    database.recomFoodList[i].foodPrice,
                    i
                  );
                }, 
                itemCount: database.recomFoodList.length,
                scrollDirection: Axis.horizontal,
              )
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TabBar(
                controller: tabController,
                isScrollable: true,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.withOpacity(0.5),
                labelStyle: GoogleFonts.notoSans(
                  fontSize: 16.0, 
                  fontWeight: FontWeight.bold
                ),
                unselectedLabelStyle: GoogleFonts.notoSans(
                  fontSize: 12.0, 
                  fontWeight: FontWeight.normal
                ),
                tabs: const [
                  Tab(child:Text('FEATURED')),
                  Tab(child:Text('COMBO')),
                  Tab(child:Text('FAVORITES')),
                  Tab(child:Text('RECOMMENDED')),
                ],
              )
            ),

            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height - 150.0,
              child: TabBarView(
                controller: tabController,
                children: [
                  FoodTab(database),
                  FoodTab(database),
                  FoodTab(database),
                  FoodTab(database),
                ]
              ),
            )
 
          ]
          
        ),
      ),
      
    );
  }
}
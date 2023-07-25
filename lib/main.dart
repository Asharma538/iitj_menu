
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("IITJ MENU"),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.restaurant_menu),
              ),
            ),
          ],
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: Column(
                children: [
                  Meal(context,"Breakfast", "Pav Bhaji","", "7:00 AM", "10:00 AM"),
                  Meal(context,"Lunch", "Pav Bhaji","", "12:15 PM", "2:30 PM"),
                  Meal(context,"Snacks", "Pav Bhaji","", "5:30 PM", "6:30 PM"),
                  Meal(context,"Dinner", "Pav Bhaji","", "8:00 PM", "10:00 PM"),
                ],
              ),
          ),
        )
    );
  }
}

Widget Meal(
    BuildContext context, String Name, String Items,String SideItems, String start, String end) {
  return TimelineTile(
    alignment: TimelineAlign.start,
    indicatorStyle: IndicatorStyle(
      width: 2,
      indicatorXY: 0.5,
      iconStyle: IconStyle(
        iconData: Icons.circle,fontSize: 20,
      )
    ),
    endChild: Container(
      constraints: BoxConstraints(
        minHeight: 120,
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(" ${Name}",style: TextStyle(fontSize: 16),),
                Text("${start} - ${end}  ",style: TextStyle(fontSize: 14),),
              ],
            ),
            Container(height: 1,color: Colors.grey[600],),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Text(Items),
            ),
            SizedBox(height: 5,),
            Padding(
              child: Text(SideItems),
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            ),
            SizedBox(height: 25,)
          ],
        ),
      ),
    ),
  );
}

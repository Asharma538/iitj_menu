import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:menu_app/firebase_options.dart';
import 'package:timeline_tile/timeline_tile.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  static Map<int,String> weekday_name = {
    0:"Sunday",
    1:"Monday",
    2:"Tuesday",
    3:"Wednesday",
    4:"Thursday",
    5:"Friday",
    6:"Saturday",
  };
  static List<dynamic> Breakfast=[];
  static List<dynamic> Lunch=[];
  static List<dynamic> Snacks=[];
  static List<dynamic> Dinner=[];
  static String msg="";
  static List WeekDays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  String? selectedItem = '';


  fetchMenu(day_today) async{
    var instance = FirebaseFirestore.instance;
    // var day_today = Home.weekday_name[DateTime.now().weekday];
    final docRef = instance.collection("Menu").doc(day_today);
    await docRef.get().then((DocumentSnapshot snapshot)  {
      final data = snapshot.data() as Map<String,dynamic>;
      Home.Breakfast = data["Breakfast"]!;
      Home.Lunch = data["Lunch"]!;
      Home.Snacks = data["Snacks"]!;
      Home.Dinner = data["Dinner"]!;
      Home.msg = data["Message"]!;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(selectedItem==''){
      selectedItem = Home.weekday_name[DateTime.now().weekday];
    }
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("IITJ MENU"),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: IconButton(
                onPressed: () async {
                  var ref  = FirebaseStorage.instance.ref("Menu.png");
                  var getDownloadUrl = await ref.getDownloadURL();
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                      return Container(
                        child: PhotoView(
                          imageProvider: CachedNetworkImageProvider(getDownloadUrl),
                          basePosition: Alignment.center,
                          minScale: PhotoViewComputedScale.contained*0.8,
                          maxScale: PhotoViewComputedScale.covered*3,
                        ),
                      );
                    }),
                  );
                },
                icon: Icon(Icons.restaurant_menu),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 15 , 0, 15),
                  padding: const EdgeInsets.fromLTRB(10, 0 , 5, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(6)
                  ),
                    child: DropdownButton(
                      value: selectedItem,
                      underline: SizedBox(),
                      onChanged: (newval){
                        setState(() {
                          selectedItem = newval as String?;
                        });
                      },
                      items: Home.WeekDays.map((valueItem){
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem,style: TextStyle(fontSize: 19)),
                          );
                      }).toList(),
                    ),
                  ),
                FutureBuilder<dynamic>(
                future: fetchMenu(selectedItem),
                builder: (context,snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(0, 100, 0, 100),
                      child: CircularProgressIndicator(),
                    );
                  }
                  else{
                    return Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(15, 20, 25, 0),
                        child: Column(
                          children: [
                            Meal(context,"Breakfast", Home.Breakfast[0],Home.Breakfast[1], "7:00 AM", "10:00 AM",TimeOfDay(hour: 7, minute: 0),TimeOfDay(hour: 10, minute: 0)),
                            Meal(context,"Lunch", Home.Lunch[0],Home.Lunch[1], "12:15 PM", "2:30 PM",TimeOfDay(hour: 12, minute: 15),TimeOfDay(hour: 14, minute: 30)),
                            Meal(context,"Snacks", Home.Snacks[0],Home.Snacks[1], "5:30 PM", "6:30 PM",TimeOfDay(hour: 17, minute: 30),TimeOfDay(hour: 18, minute: 30)),
                            Meal(context,"Dinner", Home.Dinner[0],Home.Dinner[1], "8:00 PM", "10:00 PM",TimeOfDay(hour: 20, minute: 0),TimeOfDay(hour: 22, minute: 0)),
                            SizedBox(height: 30,),
                            Text("${Home.msg}",style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                      ),
                    );
                  }
                  },
                ),
                SizedBox(height: 15,),
                Center(
                    child: TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return Scaffold(
                                body: Center(
                                  child: Text(
                                    "Developed by Naman Goyal and Anadi Sharma",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            })
                          );
                        },
                        child: Text("About Us"))),
              ],
            ),
          ),
        )

    );
  }
}

Widget Meal(
  BuildContext context, String Name, String Items,String SideItems, String start, String end,TimeOfDay meal_start_time,TimeOfDay meal_end_time) {
  var start_dt = new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,meal_start_time.hour,meal_start_time.minute);
  var end_dt = new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,meal_end_time.hour,meal_end_time.minute);

  Color? active = Colors.orange[600];

  if (DateTime.now().isAfter(start_dt) && DateTime.now().isBefore(end_dt)){
    active = Colors.teal;
  }

  return TimelineTile(
    beforeLineStyle: LineStyle(
      color: active!,
    ),
    afterLineStyle: LineStyle(
      color: active,
    ),
    alignment: TimelineAlign.start,
    indicatorStyle: IndicatorStyle(
      color: active,
      width: 20,
      indicatorXY: 0.5,
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

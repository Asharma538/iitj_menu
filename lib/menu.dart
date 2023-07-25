// import 'package:cloud_firestore/cloud_firestore.dart';

// class Menu{
//   //july
//   static Map<String,List<String>> sunday={
//     "Breakfast":["Masala dosa, sambhar, coconut chutney","Banana, Boiled Eggs, Bread, Butter, Jam, Milk, Sugar,Cornflakes, Chana, Bournvita, Tea, Coffee"],
//     "Lunch":["Birista rice (onion rice), moong-masoor dal, dry aloo masala, navrattan korma, flavouredlassi","Butter/ Ghee Chapati, Green Salad ,pickle"],
//     "Snacks":["Pani poori with mashed aloo and chana","Tea, Coffee"],
//     "Dinner":["Jeera rice, Amritsari dal, kadhai chicken/kadhai paneer, aloo soyabean (in veg only),gulab jamun","Butter/ Ghee chapati, Green Salad,Salad, pickle"],
//   };
//   static Map<String,List<String>> monday={
//     "Breakfast":["Chole Kulche, onion, lemon","Banana, Boiled Eggs, Bread, Butter, Jam, Milk, Sugar,Cornflakes, Chana, Bournvita, Tea, Coffee"],
//     "Lunch":["Jeera rice, panchratni dal, lauki chane ki sabji, dahi masala aloo, mixed fruits (min 3types)","Butter Chapati, Green Salad, pickle"],
//     "Snacks":["Corn chat, chat masala, nimbu","Tea, Coffee"],
//     "Dinner":["Plain rice, dal fry, shahi paneer / egg bhurji, chatpata kaddu ki sabji","Butter/ Ghee Chapati, Green Salad, pickle"],
//   };
//   static Map<String,List<String>> tuesday={
//     "Breakfast":["Methi paratha and sabzi","Bread, Butter, Jam, Milk, Sugar, Cornflakes, chana, Bournvita,Tea, Coffee,"],
//     "Lunch":["Veg fried rice, dal makhni, manchurian, nutri mattar ki sabji, lassi","Butter/ Ghee Chapati, Green Salad, pickle"],
//     "Snacks":["Grilled veg sandwich alternate Grilled aloo sandwich, ketup","Tea, Coffee"],
//     "Dinner":["Plain rice, masoor dal, chole bhature, aloo matar, ice-cream (vanilla/chocolate 1 scoop)","Butter/ Ghee Chapati, Green Salad, pickle"],
//   };
//   static Map<String,List<String>> wednesday={
//     "Breakfast":["Idli (both fried and normal idli), sambhar, nariyal chutney","Banana, Boiled eggs, Bread, Butter, Jam, Milk, Sugar,Cornflakes, Chana, Bournvita, Tea, Coffee"],
//     "Lunch":["Plain rice, mix veg dal, veg kofta, crispy potato, jeera dahi","Butter/ Ghee Chapati, Green Salad, pickle"],
//     "Snacks":["Aloo tikki, green chutney, red chutney","Tea, Coffee"],
//     "Dinner":["Veg biryani, arhar dal (only veg), matar mushroom, chicken biryani, veg raita, dum aloo(veg only)","Butter/ Ghee Chapati, Green Salad, pickle"],
//   };
//   static Map<String,List<String>> thursday={
//     "Breakfast":["Hing aloo and flavored poori (plain or masala poori), pickle","Bread, Butter, Jam, Milk, Sugar, Cornflakes, Chana, Bournvita,Tea, Coffee,"],
//     "Lunch":["Plain rice, mix dal, rajma masala, veg kolhapuri , masala chaas","Butter/ Ghee Chapati, Green Salad, pickle"],
//     "Snacks":["Samosa, green chutney, and red chutney","Tea, Coffee"],
//     "Dinner":["Plain rice, dal tadka, bhindi masala, sev tamatar, sewai kheer","Butter/ Ghee Chapati, Green Salad, pickle"],
//   };
//   static Map<String,List<String>> friday={
//     "Breakfast":["Sev poha and sambhar, jalebi","Banana, Boiled Egg, Bread, Butter, Jam, Milk, Sugar,Cornflakes, Chana, Bournvita, Tea, Coffee"],
//     "Lunch":["Jira rice, kadhi pakoda, papad ki sabji, cabbage mutter, mixed fruits (min 3 types)","Butter/ Ghee Chapati, Green Salad, pickle"],
//     "Snacks":["Kala chana chat, chat masala, chopped onion and green chilli","Tea, Coffee"],
//     "Dinner":["Plain rice, sambhar, veg korma, egg butter masala / paneer butter masala","Butter/ Ghee Chapati, Green Salad, pickle"],
//   };
//   static Map<String,List<String>> saturday={
//     "Breakfast":["Aloo paratha, curd, pickle","Bread, Butter, Jam, Milk, Sugar, Cornflakes, Chana, Bournvita,Tea, Coffee"],
//     "Lunch":["Veg tehri pulau, moong dal, mix veg sabji (dry), boondi raita, papad","Butter/ Ghee Chapati, Green Salad, pickle"],
//     "Snacks":["Kachori alternate moong dal pakodas, green chutney, and red chutney","Tea, Coffee"],
//     "Dinner":["Plain rice, chana dal, bhindi do pyazz, dahi aloo, jalebi","Green Salad, pickle"],
//   };
//   var _db = FirebaseFirestore.instance;
//   void uploadmenu()async{
//   _db.collection("Menu").doc("Sunday").set(sunday);
//   _db.collection("Menu").doc("Monday").set(monday);
//   _db.collection("Menu").doc("Tuesday").set(tuesday);
//   _db.collection("Menu").doc("Wednesday").set(wednesday);
//   _db.collection("Menu").doc("Thursday").set(thursday);
//   _db.collection("Menu").doc("Friday").set(friday);
//   _db.collection("Menu").doc("Saturday").set(saturday);
//   }
  

// }
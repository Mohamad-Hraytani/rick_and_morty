import 'dart:io';

import 'package:flutter/material.dart';


import 'package:rick_and_morty/screens/character_details_screen.dart';
import 'package:rick_and_morty/services/ApiServiceProvider.dart';


import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rick_and_morty/widgets/filterButton.dart';
class CharacterListScreen extends StatefulWidget {
  @override

  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
 
 var loading = false;
Color buttonColor_dead = Color.fromRGBO(255, 255, 255, 0.05);
Color buttonColor_Alive = Color.fromRGBO(255, 255, 255, 0.05);
Color buttonColor_unknown = Color.fromRGBO(255, 255, 255, 0.05);

bool get State_button_Dead => buttonColor_dead == Color.fromRGBO(255, 255, 255, 0.05)? false : true ;
bool get State_button_Alive => buttonColor_Alive == Color.fromRGBO(255, 255, 255, 0.05)? false : true ;
bool get State_button_unknown => buttonColor_unknown == Color.fromRGBO(255, 255, 255, 0.05)? false : true ;



  bool getIsPhone() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
  return data.size.shortestSide < 500 ? true : false;
}



List k= [];
  @override
  void initState() {
    super.initState();
    
Provider.of<ApiServiceProvider>(context , listen: false ).fetchCharacters().then((characters) {

Provider.of<ApiServiceProvider>(context , listen: false).addItemCharacters(characters.where((element) => element.origin["name"]==Provider.of<ApiServiceProvider>(context , listen: false).location_value  ).toList());

setState(() {loading = true; });
}); 

}



  @override
  Widget build(BuildContext context) {
var size = MediaQuery.of(context).size;


    return Scaffold(
      appBar: AppBar(
toolbarHeight: 119,
backgroundColor: Colors.white,
     
     flexibleSpace:Center( child: Image.asset("assets/logo.png" , height: 50,)) ,
 leading: GestureDetector(
  onTap: (){Navigator.of(context).pop();},
  child: Image.asset("assets/cu.png" , height: 25,)) 
      ),



 body: Consumer<ApiServiceProvider>(
   builder: (context, providerValue, _) => 
   loading ? Container(
    height:size.height ,
          width: double.infinity,
 child: SingleChildScrollView(
   child: Column(
   crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text("Filter by status: " , style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
        ),
   
       Container(
      height: 50,
      width: double.infinity,
      child:  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
       SizedBox(width: 5,),

 filterbutton(
  BorderColor: Color(0xFFB90000),
   CircleColor: Color(0xFFB90000),
    activeColor: Color.fromRGBO(185, 0, 0, 0.05),
     buttonColor: providerValue.buttonColor_dead,
      disabledColor: Color.fromRGBO(255, 255, 255, 0.05),
       hoveredColor: Color.fromRGBO(185, 0, 0, 0.2),
        nameButton:"Dead",
         pressedColor: Color.fromRGBO(185, 0, 0, 0.5),),


         
             

/*  OutlinedButton(
   style: ButtonStyle(
   fixedSize:MaterialStateProperty.resolveWith((states) {return Size(120, 40);}),
   shape:MaterialStateProperty.resolveWith((states) {return RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),side: BorderSide(color: Color(0xFFB90000),  width: 1,));}) ,
   backgroundColor:MaterialStateProperty.resolveWith((states) {
     if(states.contains(MaterialState.hovered)) {
       return Color.fromRGBO(185, 0, 0, 0.2) ;
     } else if(states.contains(MaterialState.disabled)) {
       return Color.fromRGBO(255, 255, 255, 0.05) ;
     }else if(states.contains(MaterialState.pressed)) {
       return Color.fromRGBO(185, 0, 0, 0.5) ;
     }
     
      else {
       return  buttonColor_dead;
     }
        }),),
   onPressed: () {
 
    if(State_button_Dead == false)
    {
 providerValue.fetchCharacters(status:"Dead").then((charr) => providerValue.addItemCharacters(charr.where((element) => element.origin["name"]==Provider.of<ApiServiceProvider>(context , listen: false).location_value  ).toList()));
 
    } 
     
    else
 {providerValue.fetchCharacters().then((charr) => providerValue.addItemCharacters(charr.where((element) => element.origin["name"]==Provider.of<ApiServiceProvider>(context , listen: false).location_value  ).toList()));}
 
 
   setState(() {
      buttonColor_dead = State_button_Dead==false?Color.fromRGBO(185, 0, 0, 0.05):Color.fromRGBO(255, 255, 255, 0.05);
 
   buttonColor_Alive = Color.fromRGBO(255, 255, 255, 0.05);
   buttonColor_unknown = Color.fromRGBO(255, 255, 255, 0.05);
   
   });},
   child:
   
     Row(
      
      children: [
        Container(
   width: 12,
   height: 12,
   decoration: BoxDecoration(
      color:Color(0xFFB90000),
      shape: BoxShape.circle),
   
        ),
   
   SizedBox(width: 2,),
   
            Text("Dead" ,style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
      ],
   ),
      ), */
       SizedBox(width: 5,),

 filterbutton(
  BorderColor: Color(0xFF98CD4D),
   CircleColor: Color(0xFF98CD4D),
    activeColor: Color.fromRGBO(152, 205, 77, 0.05),
     buttonColor: providerValue.buttonColor_Alive,
      disabledColor: Color.fromRGBO(255, 255, 255, 0.05) ,
       hoveredColor: Color.fromRGBO(152, 205, 77, 0.2) ,
        nameButton:"Alive",
         pressedColor: Color.fromRGBO(152, 205, 77, 0.5),),
/*  OutlinedButton(
   style: ButtonStyle(
   fixedSize:MaterialStateProperty.resolveWith((states) {return Size(120, 40);}),
   shape:MaterialStateProperty.resolveWith((states) {return RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),side: BorderSide(color: Color(0xFF98CD4D),  width: 1,));}) ,
   backgroundColor:MaterialStateProperty.resolveWith((states) {
     if(states.contains(MaterialState.hovered)) {
       return Color.fromRGBO(152, 205, 77, 0.2) ;
     } else if(states.contains(MaterialState.disabled)) {
       return Color.fromRGBO(255, 255, 255, 0.05) ;
     } else if(states.contains(MaterialState.pressed)) {
       return Color.fromRGBO(152, 205, 77, 0.5) ;
     } 
     
     
     else {
       return buttonColor_Alive;
     }
        }),),
   onPressed: () { 
 
    if(State_button_Alive == false)
    {
 providerValue.fetchCharacters(status:"Alive").then(
  (charr) => providerValue.addItemCharacters(charr.where((element) => element.origin["name"]==Provider.of<ApiServiceProvider>(context , listen: false).location_value ).toList()));
 
    } 
     
    else
 {providerValue.fetchCharacters().then((charr) => providerValue.addItemCharacters(charr.where((element) => element.origin["name"]==Provider.of<ApiServiceProvider>(context , listen: false).location_value  ).toList()));}
 
 
 
 
 
 
 
   setState(() {
      buttonColor_Alive = State_button_Alive==false?Color.fromRGBO(152, 205, 77, 0.05):Color.fromRGBO(255, 255, 255, 0.05);
   buttonColor_dead = Color.fromRGBO(255, 255, 255, 0.05);
 
   buttonColor_unknown = Color.fromRGBO(255, 255, 255, 0.05);
   
   });},
   child: Row(
      children: [
        Container(
   width: 12,
   height: 12,
   decoration: BoxDecoration(
      color:Color(0xFF98CD4D),
      shape: BoxShape.circle),
   
        ),
   
   SizedBox(width: 2,),
   
            Text("Alive" ,style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
      ],
   ),
      ), */


        SizedBox(width: 5,),   

 filterbutton(
  BorderColor: Color.fromRGBO(184, 184, 184, 0.5),
   CircleColor: Color(0xFFB8B8B8),
    activeColor: Color.fromRGBO(184, 184, 184, 0.05),
     buttonColor: providerValue.buttonColor_unknown,
      disabledColor: Color.fromRGBO(255, 255, 255, 0.05),
       hoveredColor: Color.fromRGBO(184, 184, 184, 0.2) ,
        nameButton:"unknown",
         pressedColor: Color.fromRGBO(184, 184, 184, 0.5) ,),


/*  OutlinedButton(
   style: ButtonStyle(
   fixedSize:MaterialStateProperty.resolveWith((states) {return Size(120, 40);}),
   shape:MaterialStateProperty.resolveWith((states) {return RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),side: BorderSide(color: Color.fromRGBO(184, 184, 184, 0.5),  width: 1,));}) ,
   backgroundColor:MaterialStateProperty.resolveWith((states) {
     if(states.contains(MaterialState.hovered)) {
       return Color.fromRGBO(184, 184, 184, 0.2) ;
     }else if(states.contains(MaterialState.disabled)) {
       return Color.fromRGBO(255, 255, 255, 0.05) ;}
       else if(states.contains(MaterialState.pressed)) {
       return Color.fromRGBO(184, 184, 184, 0.5) ;
     }else {return buttonColor_unknown;}
        }),),
   onPressed: () { 
    if(State_button_unknown == false  )
    {
 providerValue.fetchCharacters(status:"unknown").then((charr) => providerValue.addItemCharacters(charr.where((element) => element.origin["name"]==Provider.of<ApiServiceProvider>(context , listen: false).location_value  ).toList()));
    }   
    else
    {
 providerValue.fetchCharacters().then((charr) => providerValue.addItemCharacters(charr.where((element) => element.origin["name"]==Provider.of<ApiServiceProvider>(context , listen: false).location_value  ).toList()));}
 
 
 
   setState(() {
 buttonColor_unknown = State_button_unknown==false?Color.fromRGBO(184, 184, 184, 0.05):Color.fromRGBO(255, 255, 255, 0.05);
 buttonColor_dead = Color.fromRGBO(255, 255, 255, 0.05);
 buttonColor_Alive = Color.fromRGBO(255, 255, 255, 0.05);});},
   
   child: Row(
      children: [
        Container(
   width: 12,
   height: 12,
   decoration: BoxDecoration(
      color:Color(0xFFB8B8B8),
      shape: BoxShape.circle),
        ),
   SizedBox(width: 2,),
        Text("Unknown" ,style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
      ],
   ),
      ), */
        ],),
      )
   ),
  getIsPhone()?
  Container(
      width: size.width,
      height: size.height , 
      margin: EdgeInsets.all(20),
      child:            
         ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: providerValue.charactersList.length,
                 itemBuilder:(context, index) {
                 return  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               GestureDetector(
                                 onTap: (){
                              Navigator.push(context,
                                PageTransition( ctx: context,
                       duration: Duration(seconds: 2),
                        child: CharacterDetailsScreen(character:providerValue.charactersList[index]),
                        type: PageTransitionType.theme,
                        childCurrent: CharacterListScreen(),
                        reverseDuration: Duration(seconds: 2),  ));   },
                              child: Container(
                                   width:  345,
                                   height: 345,
                                   decoration: BoxDecoration(             
                 image:DecorationImage(             
                 image:NetworkImage(providerValue.charactersList[index].imageUrl),fit: BoxFit.cover ) ,
                  borderRadius: BorderRadius.all(Radius.circular(15)))),),
                              Container(
                               height: 30,
                               width: 345,
                               child: Text(providerValue.charactersList[index].name , style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.w600,fontFamily: 'Poppins'),)),
                               Container(
                 height: 22,
                 child: Row(
                             children: [
                               Container(
                             height: 16,
                             width: 16,
                 decoration: BoxDecoration(
                             color:providerValue.charactersList[index].status == "Alive" ?Color(0xFF98CD4D)  :providerValue.charactersList[index].status == "Dead" ?Color(0xFFB90000) :Color(0xFFB8B8B8),
                             shape: BoxShape.circle),
                               ),
                 SizedBox(width: 2,),
                            
                 Container(
                             height: 22,
                          //   width: 116,
                             child: Row(
                               children: [
                                 Text(providerValue.charactersList[index].status ,style: TextStyle(color: Colors.black ,fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
                                   Text(" - ${providerValue.charactersList[index].species}" ,style: TextStyle(color: Colors.black ,fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),],
                             ),
                 ), ],),),SizedBox(width: 10,)],  );}),  )                         
                 
                                    
     :Container(
      width: size.width ,
      height: size.height , 
      margin: EdgeInsets.all(size.width * 0.02),
      child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:   size.width > 600? 4:1,
                  mainAxisExtent: size.width > 600? 400: 550,
                  mainAxisSpacing:  size.width > 600? 50:10,
                    ),
                itemCount: providerValue.charactersList.length,
                itemBuilder: (BuildContext ctx, index) {           
                  return Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               GestureDetector(
                                 onTap: (){
                              Navigator.push(context,
                                PageTransition( ctx: context,
                       duration: Duration(seconds: 2),
                        child: CharacterDetailsScreen(character:providerValue.charactersList[index]),
                        type: PageTransitionType.theme,
                        childCurrent: CharacterListScreen(),
                        reverseDuration: Duration(seconds: 2),  ));   },
                              child: Container(
                                   width:size.width > 600? size.width *0.225 :  size.width *0.8 ,
                                   height:size.width > 600? size.width *0.225 :  size.width *0.8 ,
                                   decoration: BoxDecoration(             
                                 image:DecorationImage(             
                                 image:NetworkImage(providerValue.charactersList[index].imageUrl),fit: BoxFit.cover ) ,
                  borderRadius: BorderRadius.all(Radius.circular(15)))),),
                              Container(
                               height: 30,
                               width: 363,
                               child: Text(providerValue.charactersList[index].name , style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.w600,fontFamily: 'Poppins'),)),
                               Container(
                                 height: 22,
                                 child: Row(
                             children: [
                               Container(
                             height: 16,
                             width: 16,
                                 decoration: BoxDecoration(
                             color:providerValue.charactersList[index].status == "Alive" ?Color(0xFF98CD4D)  :providerValue.charactersList[index].status == "Dead" ?Color(0xFFB90000) :Color(0xFFB8B8B8),
                             shape: BoxShape.circle),
                               ),
                                 SizedBox(width: 2,),
                                 Container(
                             height: 22,
                             child: Row(
                               children: [
                                 Text(providerValue.charactersList[index].status ,style: TextStyle(color: Colors.black ,fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
                                   Text(" - ${providerValue.charactersList[index].species}" ,style: TextStyle(color: Colors.black ,fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
                               ],
                             ),
                                 ),
                             ],
                                 ),
                               ),        
                             ],
                                 );
                }),
      ),
   ],),
 ),
 ):Center(child: CircularProgressIndicator()),
 )
);
  }
}

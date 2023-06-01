// character_card.dart

import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/%20location.dart';
import 'package:rick_and_morty/models/character.dart';




class loactionItems extends StatelessWidget {

Location locationObject ; 
  loactionItems({required this.locationObject});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Card(
    
        margin: EdgeInsets.all(10),
        
    shape: RoundedRectangleBorder(
    
                              borderRadius: BorderRadius.all(Radius.circular(15))),
        color: Color(0xFFEFE04B),       
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
           Text(locationObject.name, style: TextStyle(fontSize:locationObject.name.length>35 ?13 : 18,fontWeight: FontWeight.w500,fontFamily: 'Poppins',),),
           SizedBox(height: 10,),
           Wrap(
             children:[ Row(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
             Flexible(flex: 1,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: const [
               Text("Type" ,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,fontFamily: 'Poppins',),),
               Text("Dimension",style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,fontFamily: 'Poppins',)),
               Text("Resident Count",style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,fontFamily: 'Poppins',)),
                 ],
               
                 
               ),
             ),
             SizedBox(width: 30,),
             Flexible(flex: 1,
               child: Column(
                 
                      mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
               Text( locationObject.type,style: TextStyle(    fontSize:locationObject.type.length>20 ?10 : 13,fontWeight: FontWeight.w500,fontFamily: 'Poppins',)),
               Text(locationObject.dimension,style: TextStyle(fontSize:locationObject.dimension.length>19 ?10 : 13,fontWeight: FontWeight.w500,fontFamily: 'Poppins',)),
               Text(locationObject.resident.length.toString(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,fontFamily: 'Poppins',)),
               
               ],),
             ),
             
             ],),]
           ),
           
         //  
           
           
           
           /* 
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
           
           Text(locationObject.type),
           SizedBox()
           
           ],),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
           Text("Dimension"),
           Text(locationObject.dimension),
           SizedBox()
           
           ],),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
           Text("Resident Count"),
           Text(locationObject.resident.length.toString()),
           SizedBox()
           
           ],) */
           
         ]),
       ),
      ),
    );
  }
}

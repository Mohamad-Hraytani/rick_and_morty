import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/services/ApiServiceProvider.dart';
import 'package:provider/provider.dart';





class CharacterDetailsScreen extends StatelessWidget {
  final Character character;


  CharacterDetailsScreen({required this.character});

  bool getIsPhone() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
  return data.size.shortestSide < 500 ? true : false;
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
  onTap: (){Navigator.of(context).pop(); },
 child: Image.asset("assets/cu.png" , height: 25,)) ),
      


 body: getIsPhone()?
 SingleChildScrollView(
   child: Container(
    width: double.infinity,
    child: Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
  Container(
      height: 465,
      margin: EdgeInsets.all(20),
      child: 
     Column(
 crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 345,
            height: 345,
            decoration: BoxDecoration(
             image:DecorationImage(             
              image:NetworkImage(character.imageUrl),fit: BoxFit.cover ) ,
              borderRadius: BorderRadius.all(Radius.circular(15)))),
 Wrap(children:[ Text(character.name , style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600,fontFamily: 'Poppins'),)]),
   Row(
      children: [
        Container(
   width: 12,
   height: 12,
   decoration: BoxDecoration(
      color:character.status == "Alive" ?Color(0xFF98CD4D)  :character.status == "Dead" ?Color(0xFFB90000) :Color(0xFFB8B8B8),
      shape: BoxShape.circle),),
       SizedBox(width: 2,),
   
            Text("${character.status} - ",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
               Text(character.species ,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
      ],
   ),
 Wrap(
   children:[ Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
   
              Flexible(flex: 2,child: Text(character.origin["name"] ,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'Poppins'),)),
   Flexible(
    flex: 1,
     child: Wrap(
       children: [Row(
          children: [
          Flexible(flex: 1, child: Text(character.type,style: TextStyle(color: Color(0xFF818181),fontSize: 16,fontFamily: 'Poppins',fontWeight: FontWeight.w300,fontStyle: FontStyle.italic),)),
         character.type==""?Text(""):Text(" - ",style: TextStyle(color: Color(0xFF818181),fontSize: 16,fontFamily: 'Poppins',fontWeight: FontWeight.w300,fontStyle: FontStyle.italic),),
          Flexible(flex: 1, child: Text(character.gender ,style: TextStyle(color: Color(0xFF818181),fontSize: 16,fontFamily: 'Poppins',fontWeight: FontWeight.w300,fontStyle: FontStyle.italic),)),
       
       
       ],),]
     ),
   )
   
   ],)],
 ),
        ],
      )
      
 
    ),   
      const Padding( 
        padding: EdgeInsets.only(left: 5),
        child: Text("Other Characters " , style: TextStyle(fontSize: 24 , fontWeight: FontWeight.w600,fontFamily: 'Poppins'),),
        ),

  SingleChildScrollView(
   child: Consumer<ApiServiceProvider>(
   builder: (context, providerValue, _) => 
   Container(
     width: double.infinity,
     height: 400,
     margin: EdgeInsets.only(left: 5),
     child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: providerValue.charactersList.length,
      itemBuilder:(context, index) {
      return  Column(
      children: [
        Wrap(
          children:[ Row(
         crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(flex: 1,
                child: GestureDetector(
                  onTap: (){
                       Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => CharacterDetailsScreen(character:providerValue.charactersList[index])));  },
                  child: Container(       
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(                    
                     image:DecorationImage(                      
                      image:NetworkImage(providerValue.charactersList[index].imageUrl),fit: BoxFit.cover ) ,
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
                ),
              ),
           SizedBox(width: 10,),
           Flexible(
            flex: 2,
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(providerValue.charactersList[index].name , style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,fontFamily: 'Poppins'),maxLines: 3,softWrap: true,),
              Text(providerValue.charactersList[index].origin["name"] ,style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: 'Poppins', fontWeight: FontWeight.w400 ,),),
              Row(
              children: [
              Text(providerValue.charactersList[index].type,style: TextStyle(color: Color(0xFF818181),fontSize: 16, fontWeight: FontWeight.w300 ,fontFamily: 'Poppins' ,fontStyle: FontStyle.italic),),
             providerValue.charactersList[index].type==""?Text(""):Text(" - ",style: TextStyle(color: Color(0xFF818181),fontSize: 16, fontWeight: FontWeight.w300,fontFamily: 'Poppins',fontStyle: FontStyle.italic),),
              Text(providerValue.charactersList[index].gender ,style: TextStyle(color: Color(0xFF818181),fontSize: 16, fontWeight: FontWeight.w300,fontFamily: 'Poppins',fontStyle: FontStyle.italic),),                          
              ],)     
                ],),
           ),   
            ],
          ),]
        ),
         const SizedBox(height: 10,)
      ],
    );}),
    )
   ),
 )
   ],),
          ),
 ):SingleChildScrollView(
   child: Container(   
   child: Wrap(
     children:[ Row(
     crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       Flexible(
        flex: size.width > 600?1:2,
         child: Container(
          height: 465,
          margin: EdgeInsets.all(20),
          child: 
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 345,
                height: 345,
                decoration: BoxDecoration(
                 image:DecorationImage(             
                  image:NetworkImage(character.imageUrl),fit: BoxFit.cover ) ,
                  borderRadius: BorderRadius.all(Radius.circular(15)))),
           Wrap(children:[ Text(character.name , style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600,fontFamily: 'Poppins'),)]),
            Row(
          children: [
            Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
          color:character.status == "Alive" ?Color(0xFF98CD4D)  :character.status == "Dead" ?Color(0xFFB90000) :Color(0xFFB8B8B8),
          shape: BoxShape.circle),),
           SizedBox(width: 2,),
            
                Text("${character.status} - ",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
                   Text(character.species ,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
          ],
            ),
           Wrap(
            children:[ Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
                  Flexible(flex: 2,child: Text(character.origin["name"] ,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'Poppins'),)),
            Flexible(
             flex: 1,
         child: Wrap(
           children: [Row(
              children: [
              Flexible(flex: 1, child: Text(character.type,style: TextStyle(color: Color(0xFF818181),fontSize: 16,fontFamily: 'Poppins',fontWeight: FontWeight.w300,fontStyle: FontStyle.italic),)),
             character.type==""?Text(""):Text(" - ",style: TextStyle(color: Color(0xFF818181),fontSize: 16,fontFamily: 'Poppins',fontWeight: FontWeight.w300,fontStyle: FontStyle.italic),),
              Flexible(flex: 1, child: Text(character.gender ,style: TextStyle(color: Color(0xFF818181),fontSize: 16,fontFamily: 'Poppins',fontWeight: FontWeight.w300,fontStyle: FontStyle.italic),)),
           
           
           ],),]
         ),
            )
            
            ],)],
           ),
            ],
          )
          
           
             ),
       ),
      
   Flexible(
    flex:size.width > 600? 2:1,
     child: Column(
  
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Padding(
              padding: const EdgeInsets.only(left: 5 , top: 20),
              child: Text("Other Characters " , style: TextStyle(fontSize: 24 , fontWeight: FontWeight.w600,fontFamily: 'Poppins'),),
            ),
       SingleChildScrollView(
       child: Consumer<ApiServiceProvider>(
      builder: (context, providerValue, _) => 
       Container(
       //   width: double.infinity,
        height: 350,
      margin: EdgeInsets.only(left: 5),
        child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:   size.width > 600? 2:1,
                  mainAxisExtent: size.width > 600? 100: 130,
                  mainAxisSpacing:  size.width > 600? 12.5:2,
                    ),
                itemCount: providerValue.charactersList.length,
                itemBuilder: (BuildContext ctx, index) {    
        return  Column(
          children: [
            Wrap(
              children:[ Row(
             crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(flex: 1,
                    child: GestureDetector(
                      onTap: (){
                           Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => CharacterDetailsScreen(character:providerValue.charactersList[index])));  },
                      child: Container(       
              width:size.width > 600? size.width *0.05625 :  size.width *0.2 ,
              height:size.width > 600? size.width *0.05625 :  size.width *0.2 ,
                        decoration: BoxDecoration(                    
                         image:DecorationImage(                      
                          image:NetworkImage(providerValue.charactersList[index].imageUrl),fit: BoxFit.cover ) ,
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                    ),
                  ),
                SizedBox(width: 10,),
               Flexible(
                flex: 2,
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(providerValue.charactersList[index].name , style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,fontFamily: 'Poppins'),maxLines: 3,softWrap: true,),
                  Text(providerValue.charactersList[index].origin["name"] ,style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: 'Poppins', fontWeight: FontWeight.w400 ,),),
                  Row(
                  children: [
                  Text(providerValue.charactersList[index].type,style: TextStyle(color: Color(0xFF818181),fontSize: 16, fontWeight: FontWeight.w300 ,fontFamily: 'Poppins' ,fontStyle: FontStyle.italic),),
                 providerValue.charactersList[index].type==""?Text(""):Text(" - ",style: TextStyle(color: Color(0xFF818181),fontSize: 16, fontWeight: FontWeight.w300,fontFamily: 'Poppins',fontStyle: FontStyle.italic),),
                  Text(providerValue.charactersList[index].gender ,style: TextStyle(color: Color(0xFF818181),fontSize: 16, fontWeight: FontWeight.w300,fontFamily: 'Poppins',fontStyle: FontStyle.italic),),                          
                  ],)     
                    ],),
               ),   
                ],
              ),]
            ),
             const SizedBox(height: 10,)
          ],
        );}),
        )
       ),
      )
     
     
     ],),
   ),
   
   
     ],),]
   ),
          ),
 )

    );
  }
}

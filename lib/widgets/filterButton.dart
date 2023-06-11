import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rick_and_morty/services/ApiServiceProvider.dart';
import 'package:provider/provider.dart';
class filterbutton extends StatefulWidget {
Color BorderColor;
Color hoveredColor;
Color disabledColor;
Color pressedColor;
Color buttonColor;
String nameButton;
Color activeColor;
Color CircleColor;
 filterbutton({required this.BorderColor ,required this.hoveredColor, required this.disabledColor,required this.pressedColor,required this.buttonColor,required this.nameButton,required this.activeColor,required this.CircleColor});


  @override
  State<filterbutton> createState() => _filterbuttonState();
}

class _filterbuttonState extends State<filterbutton> {

late bool  State_button_Alive;
late bool  State_button_Dead;
late bool  State_button_unknown;
late bool State_button;
  @override
  void initState() {
    super.initState();
    
    widget.nameButton == "Alive"?
 State_button= widget.buttonColor == Color.fromRGBO(255, 255, 255, 0.05)? false : true :
    widget.nameButton == "Dead"?
State_button = widget.buttonColor  == Color.fromRGBO(255, 255, 255, 0.05)? false : true :
State_button = widget.buttonColor  == Color.fromRGBO(255, 255, 255, 0.05)? false : true ;
    
    }

  @override
  Widget build(BuildContext context) {
    return
    Consumer<ApiServiceProvider>(
   builder: (context, providerValue, _) => OutlinedButton(
   style: ButtonStyle(
   fixedSize:MaterialStateProperty.resolveWith((states) {return Size(120, 40);}),
   shape:MaterialStateProperty.resolveWith((states) {return RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),side: BorderSide(color: widget.BorderColor,  width: 1,));}) ,
   backgroundColor:MaterialStateProperty.resolveWith((states) {
     if(states.contains(MaterialState.hovered)) {
       return widget.hoveredColor ;
     } else if(states.contains(MaterialState.disabled)) {
       return widget.disabledColor;
     }else if(states.contains(MaterialState.pressed)) {
       return widget.pressedColor ;
     }else {
       return  widget.buttonColor;
     }
        }),),
   onPressed: () {
 
    if(State_button == false)
    {
 providerValue.fetchCharacters(status:widget.nameButton).then((charr) => providerValue.addItemCharacters(charr.where((element) => element.origin["name"]==Provider.of<ApiServiceProvider>(context , listen: false).location_value  ).toList()));
 
    } 
     
    else
 {providerValue.fetchCharacters().then((charr) => providerValue.addItemCharacters(charr.where((element) => element.origin["name"]==Provider.of<ApiServiceProvider>(context , listen: false).location_value  ).toList()));}
 
 
   setState(() {
    
    if(widget.nameButton=="Dead")    
{providerValue.buttonColor_dead = State_button==false?widget.activeColor:widget.disabledColor;
  
 providerValue. buttonColor_Alive = widget.disabledColor;
 providerValue. buttonColor_unknown = widget.disabledColor;}

else if(widget.nameButton=="Alive")
{providerValue.buttonColor_Alive = State_button==false?widget.activeColor:widget.disabledColor;
  
 providerValue.buttonColor_dead = widget.disabledColor;
 providerValue.buttonColor_unknown = widget.disabledColor;}
    
else
{providerValue. buttonColor_unknown = State_button==false?widget.activeColor:widget.disabledColor;

 providerValue.buttonColor_Alive = widget.disabledColor;
 providerValue.buttonColor_dead = widget.disabledColor;

}

   });},
child:
   
     Row( 
      children: [
        Container(
   width: 12,
   height: 12,
   decoration: BoxDecoration(
      color:widget.CircleColor,
      shape: BoxShape.circle),
   
        ),
   
   SizedBox(width: 2,),
   
            Text(widget.nameButton ,style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
      ],
   ),
      ) );
    
    
    
  }
}
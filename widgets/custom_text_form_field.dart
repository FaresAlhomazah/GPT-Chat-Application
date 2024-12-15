import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
 CustomTextFormField({this.hintText, this.TextFieldControl, this.FieldIcon,this.onChanged,this.obsecureText=false});
  final String? hintText;
  final Icon? FieldIcon;
   bool?  obsecureText;
  TextEditingController? TextFieldControl = new TextEditingController();
  Function(String)? onChanged; // save the chamghes in the txt field
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
      child: TextFormField(
        obscureText:obsecureText!,
        validator:(String? value) {
          if(value!.isEmpty)
          {
            return 'please enter some text';
          }
          return null;
        },
        
        onChanged:onChanged ,
        onTapOutside: ((event) {
          // if click in screen not focus in the field
          FocusManager.instance.primaryFocus?.unfocus();
        }),

        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(8, 114, 194, 1),
          prefixIcon:Icon(FieldIcon!.icon,color: Colors.white,),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),

           border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          // Color.fromARGB(255,3, 230, 255),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        controller: TextFieldControl,
      ),
    );
  }
}

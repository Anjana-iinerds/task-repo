import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  late File _image;
  final imagePicker = ImagePicker();
  Future getImage() async{
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }
  
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      appBar: AppBar(title: Text('Register Page')),
       body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height *0.9,
    // ignore: sized_box_for_whitespace
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Register Here",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          height: 3,
        ),
        ),
      
        SizedBox(height: 13,),
        Stack(    
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child:CircleAvatar(
                radius: 68,
                backgroundColor: Colors.purple[600],
                
              child: CircleAvatar(
                child: ClipOval(),
                radius: 62,
                backgroundColor: Colors.white70,
                backgroundImage: FileImage(_image)
                    
                ) ,
              ),
              ),
            
                  
              Positioned(  
                bottom: 10,
                left: 70,
                child: RawMaterialButton(
                  fillColor: Colors.purple[600],
                child: Icon(Icons.add_a_photo_outlined,
                color: Colors.white,),    
                shape: CircleBorder(),
                  onPressed: (){showDialog(context: context, builder: (BuildContext context) {
                   return AlertDialog(
                     title: Text('Choose an option',
                     style: TextStyle(fontWeight: FontWeight.w500,color: Colors.purple[800]),
                     ),
                     content: SingleChildScrollView(
                       child: ListBody(children: [
                         InkWell(
                           onTap: () {
                             },
                           splashColor: Colors.purpleAccent,
                           child: Row(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Icon(Icons.camera_alt,color: Colors.purpleAccent,),
                               ),
                               Text('Camera',
                               style: TextStyle(
                                 fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500
                               ),)
                             ],
                           ),
                         ),
                         InkWell(
                           onTap: () {       
                           },
                           splashColor: Colors.purpleAccent,
                           child: Row(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Icon(Icons.image,color: Colors.purpleAccent,),
                               ),
                               Text('Gallery',
                               style: TextStyle(
                                 fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500
                               ),)
                             ],
                           ),
                         ),
                       ]),
                     ),
                   ); 
                  });
                  
                },
                
                ),),
          ],
            ),
            
            SizedBox(height: 15),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                labelText: 'Username',
              ),
            ),
          
        ),
        SizedBox(height: 23,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: _formKey,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                labelText: 'Email'
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'This field is required';
                }
                return null;
              }
            ),
          ),
        ),
        SizedBox(height: 23,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: _formKey1,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
                labelText: 'Phone'
              ),
              validator: (value){
                if (value!.isEmpty){
                  return 'This field is required';
                }
                return null;
              }
            ),
          ),
        ),

        SizedBox(height: 27,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(onPressed: () {
            _formKey.currentState!.validate();
          },
          height: 53,
          minWidth: 790,
          color: Colors.deepPurple,
          child: Text('Register',
          style: TextStyle(color: Colors.white,fontSize: 20),
          
          )
          ),
        ),

 
      
      ]  
       ),
       ),
       );
        
        
              
      
  }
}
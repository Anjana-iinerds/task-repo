import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
class Registerpage extends StatelessWidget {
   Registerpage({super.key});
  final _formKey = GlobalKey<FormState>();

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
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          height: 3,
        ),
        ),
        SizedBox(height: 15,),
        Stack(    
          children: [
            Container(
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.purple[400],
              
              child: Positioned(
                child: MaterialButton(onPressed: (){},
                elevation: 1.0,
                child: Icon(Icons.add_a_photo_outlined,
                color: Colors.white,),
                padding:EdgeInsets.all(10),
                shape: CircleBorder(),
                ),)
            )
            )
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
        SizedBox(height: 25,),
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
                  return 'Enter valid email';
                }
                return null;
              }
            ),
          ),
        ),
        SizedBox(height: 25,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: _formKey,
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
                  return 'Enter valid phone number';
                }
                return null;
              }
            ),
          ),
        ),
        SizedBox(height: 30,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(onPressed: () {
            _formKey.currentState!.validate();
          },
          height: 55,
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
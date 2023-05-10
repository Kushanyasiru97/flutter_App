import 'package:flutter/material.dart';
import 'package:silverlineit_app/screens/displayStudent)Screen.dart';

import '../services/validate_Service.dart';

class addStudent extends StatefulWidget {
  const addStudent({Key? key}) : super(key: key);



  @override
  State<addStudent> createState() => _addStudentState();
}

class _addStudentState extends State<addStudent> {

  final _formKey = GlobalKey<FormState>();

  late TextEditingController _controllerName = TextEditingController();
  late TextEditingController _controllerIndex = TextEditingController();

  final ValidateService _validateService = ValidateService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Students"),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextFormField(
              controller: _controllerName,
              decoration: InputDecoration(
                labelText: "Student Name",
                hintText: "Enter Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 18),
                prefixIcon: Icon(Icons.person_2_outlined),
              ),
              validator: (value) => _validateService.isEmptyField(value!),
            ),
                SizedBox(height: 20.0,),

                TextFormField(
                  controller: _controllerIndex,
                  decoration: InputDecoration(
                    labelText: "Student Index No",
                    hintText: "Enter Index No",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 18),
                    prefixIcon: Icon(Icons.confirmation_num),
                  ),
                  validator: (value) => _validateService.isEmptyField(value!),
                ),
                SizedBox(height: 20.0,),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const displayStudents()));
              },
              child: Text('Register'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.all(10.0),
                fixedSize: Size(MediaQuery.of(context).size.width / 2, 50),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // side: BorderSide(color: Color.fromRGBO(235, 83, 83, 1), width: 1),
              ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

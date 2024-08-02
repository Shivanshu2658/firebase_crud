import 'package:firebase_crud/service/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Add New Employee"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Name",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Age",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Location",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: locationController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        print("sjdifo");
                        String id = randomAlphaNumeric(10);
                        Map<String,dynamic> employeeInfoMap = {
                          "Name" : nameController.text,
                          "Age" : ageController.text,
                          "Location" : locationController.text,

                        };
                        await DatabaseMethods().addEmployeeDetails(employeeInfoMap, id).then((value) => Fluttertoast.showToast(
                            msg: "Added Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0
                        ));

                        Navigator.pop(context);
                      },
                      child: Text("Add")))
            ],
          ),
        ),
      ),
    );
  }
}

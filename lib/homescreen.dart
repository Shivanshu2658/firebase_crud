import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/add_employee.dart';
import 'package:firebase_crud/service/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream? EmployeeStream;

  getOnTheLoad() async {
    EmployeeStream = await DatabaseMethods().getEmployeeDetails();
    print(EmployeeStream);
  }

  @override
  void initState() {
    // TODO: implement initState
    getOnTheLoad();
    super.initState();
  }

  Widget allEmployeeDetails() {
    return StreamBuilder(
        stream: EmployeeStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    print(ds);
                    return Card(
                        elevation: 1.0,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 10,
                                right: 10,
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.black54,
                                      ),
                                      onPressed: () {
                                        print("edit $index");
                                        // Show the AlertDialog
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              TextEditingController
                                                  nameController =
                                                  new TextEditingController();
                                              TextEditingController
                                                  ageController =
                                                  new TextEditingController();
                                              TextEditingController
                                                  locationController =
                                                  new TextEditingController();

                                              nameController.text =
                                                  ds["Name"] ?? "";
                                              ageController.text =
                                                  ds["Age"] ?? "";
                                              locationController.text =
                                                  ds["Location"] ?? "";
                                              String id = ds.id;
                                              return AlertDialog(
                                                title: Center(
                                                    child: Text("Update")),
                                                content: Container(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      TextField(
                                                        controller:
                                                            nameController,
                                                        decoration:
                                                            const InputDecoration(
                                                                labelText:
                                                                    "Name",
                                                                border:
                                                                    OutlineInputBorder()),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      TextField(
                                                        controller:
                                                            ageController,
                                                        decoration:
                                                            const InputDecoration(
                                                                labelText:
                                                                    "Age",
                                                                border:
                                                                    OutlineInputBorder()),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      TextField(
                                                        controller:
                                                            locationController,
                                                        decoration:
                                                            const InputDecoration(
                                                                labelText:
                                                                    "Location",
                                                                border:
                                                                    OutlineInputBorder()),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Center(
                                                          child: ElevatedButton(
                                                              onPressed:
                                                                  () async {
                                                                print("sjdifo");

                                                                Map<String,
                                                                        dynamic>
                                                                    employeeInfoMap =
                                                                    {
                                                                  "Name":
                                                                      nameController
                                                                          .text,
                                                                  "Age":
                                                                      ageController
                                                                          .text,
                                                                  "Location":
                                                                      locationController
                                                                          .text,
                                                                };
                                                                await DatabaseMethods().updateEmployeeDetails(employeeInfoMap, id).then((value) => Fluttertoast.showToast(
                                                                    msg:
                                                                        "Update Successfully",
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_SHORT,
                                                                    gravity: ToastGravity
                                                                        .BOTTOM,
                                                                    timeInSecForIosWeb:
                                                                        1,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .green,
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                    fontSize:
                                                                        16.0));

                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                  "Update")))
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () async {
                                        print("delete $index");
                                        String id = ds.id;
                                        await DatabaseMethods()
                                            .deleteEmployee(id)
                                            .then((value) =>
                                                Fluttertoast.showToast(
                                                    msg: "Delete Successfully",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0));
                                      },
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "Name : ${ds["Name"]}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Age : ${ds["Age"]}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.orange,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("Location : ${ds["Location"]}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.green,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ));
                  })
              : Container();
        });
  }

  TextStyle customTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black, // You can specify other properties as needed
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cloud Firestore"),
      ),
      body: Column(
        children: [
          Expanded(
            child: allEmployeeDetails(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddEmployeeScreen()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

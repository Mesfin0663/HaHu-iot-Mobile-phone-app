import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:new_iot/home/home.dart';
import 'package:new_iot/iotScreens/device1.dart';

class EmailSignUp extends StatefulWidget {
  @override
  _EmailSignUpState createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("users");
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sign Up")),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Enter User Name",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter User Name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter an Email Address';
                    } else if (!value.contains('@')) {
                      return 'Pleas enter a valid email address';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                    labelText: "Enter Age",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Age';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Password';
                    } else if (value.length < 6) {
                      return 'Password must be atleast 6 characters!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.lightBlue)),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            registerToFb();
                          }
                        },
                        child: Text('Submit'),
                      ),
              )
            ]))));
  }

  void registerToFb() {
    firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      dbRef.child(result.user.uid).set({
        "email": emailController.text,
        "age": ageController.text,
        "name": nameController.text,
        "Devices": {
          "Device_1": {
            "State": 0,
            "Sensors": {
              "Sensor_1": 25,
              "Sensor_2": 25,
              "Sensor_3": 25,
              "Sensor_4": 25,
              "Sensor_5": 25,
              "Sensor_6": 25
            },
            "Storage": {
              "Sensor_1": 0,
              "Sensor_2": 0,
              "Sensor_3": 0,
              "Sensor_4": 0,
              "Sensor_5": 0,
              "Sensor_6": 0
            },
            "Buttons": {
              "Button_1": false,
              "Button_2": false,
              "Button_3": false,
              "Button_4": false,
              "Button_5": false,
              "Button_6": false,
              "Button_7": false,
              "Button_8": false,
              "Button_9": false
            }
          },
          "Device_2": {
            "State": 0,
            "Sensors": {
              "Sensor_1": 25,
              "Sensor_2": 25,
              "Sensor_3": 25,
              "Sensor_4": 25,
              "Sensor_5": 25,
              "Sensor_6": 25
            },
            "Storage": {
              "Sensor_1": 0,
              "Sensor_2": 0,
              "Sensor_3": 0,
              "Sensor_4": 0,
              "Sensor_5": 0,
              "Sensor_6": 0
            },
            "Buttons": {
              "Button_1": false,
              "Button_2": false,
              "Button_3": false,
              "Button_4": false,
              "Button_5": false,
              "Button_6": false,
              "Button_7": false,
              "Button_8": false,
              "Button_9": false
            }
          },
          "Device_3": {
            "State": 0,
            "Sensors": {
              "Sensor_1": 25,
              "Sensor_2": 25,
              "Sensor_3": 25,
              "Sensor_4": 25,
              "Sensor_5": 25,
              "Sensor_6": 25
            },
            "Storage": {
              "Sensor_1": 0,
              "Sensor_2": 0,
              "Sensor_3": 0,
              "Sensor_4": 0,
              "Sensor_5": 0,
              "Sensor_6": 0
            },
            "Buttons": {
              "Button_1": false,
              "Button_2": false,
              "Button_3": false,
              "Button_4": false,
              "Button_5": false,
              "Button_6": false,
              "Button_7": false,
              "Button_8": false,
              "Button_9": false
            }
          },
          "Device_4": {
            "State": 0,
            "Sensors": {
              "Sensor_1": 25,
              "Sensor_2": 25,
              "Sensor_3": 25,
              "Sensor_4": 25,
              "Sensor_5": 25,
              "Sensor_6": 25,
            },
            "Storage": {
              "Sensor_1": 0,
              "Sensor_2": 0,
              "Sensor_3": 0,
              "Sensor_4": 0,
              "Sensor_5": 0,
              "Sensor_6": 0,
            },
            "Buttons": {
              "Button_1": false,
              "Button_2": false,
              "Button_3": false,
              "Button_4": false,
              "Button_5": false,
              "Button_6": false,
              "Button_7": false,
              "Button_8": false,
              "Button_9": false
            }
          },
          "Device_5": {
            "State": 0,
            "Sensors": {
              "Sensor_1": 25,
              "Sensor_2": 25,
              "Sensor_3": 25,
              "Sensor_4": 25,
              "Sensor_5": 25,
              "Sensor_6": 25
            },
            "Storage": {
              "Sensor_1": 0,
              "Sensor_2": 0,
              "Sensor_3": 0,
              "Sensor_4": 0,
              "Sensor_5": 0,
              "Sensor_6": 0
            },
            "Buttons": {
              "Button_1": false,
              "Button_2": false,
              "Button_3": false,
              "Button_4": false,
              "Button_5": false,
              "Button_6": false,
              "Button_7": false,
              "Button_8": false,
              "Button_9": false
            }
          }
        }
      }).then((res) {
        isLoading = false;
        FirebaseAuth.instance.currentUser
            .updateDisplayName(nameController.text);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                    uid: result.user.uid,
                    uname: nameController.text,
                    uemail: emailController.text,
                  )),
        );
      });
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    ageController.dispose();
  }
}

import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/models/lat_long_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ContactModel> contacts = [
    ContactModel(
        name: "name 1",
        phoneNumber: "9811",
        image:
            "https://images.pexels.com/photos/6716572/pexels-photo-6716572.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        position: LatLngModel(lattitude: 27.7172, longitude: 85.3240)),
    ContactModel(
        name: "name 2",
        phoneNumber: "9811",
        image:
            "https://images.pexels.com/photos/6716572/pexels-photo-6716572.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        position: LatLngModel(lattitude: 27.7172, longitude: 85.3240)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: const Icon(Icons.back_hand),
        title: const Text(
          "Contacts",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    // isDismissible: false,
                    builder: (_) => BottomSheet(
                        onClosing: () {},
                        builder: (context) => Container(
                              padding: EdgeInsets.all(40),
                              // height: 400,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text("Add Contact"),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Enter Name"),
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Enter Phone Number"),
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Enter Image URL"),
                                  ),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      children: [
                                        const Text("Map"),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          contacts.add(ContactModel(
                                              name: "name 2",
                                              phoneNumber: "9811",
                                              image:
                                                  "https://images.pexels.com/photos/6716572/pexels-photo-6716572.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                              position: LatLngModel(
                                                  lattitude: 27.7172,
                                                  longitude: 85.3240)));
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Add Contact"))
                                ],
                              ),
                            )));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 35,
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {},
              leading: CircleAvatar(
                backgroundImage: NetworkImage(contacts[index].image),
              ),
              title: Text(contacts[index].name),
              subtitle: Text(contacts[index].phoneNumber),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call,
                    color: Colors.green,
                  )),
            );
          }),
    );
  }
}

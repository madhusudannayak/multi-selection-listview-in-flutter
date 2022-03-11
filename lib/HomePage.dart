import 'package:flutter/material.dart';
import 'package:multi_selection_listview/ContactModule.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ContactModule> contacts = [
    ContactModule("Madhusudan", "956244575", false),
    ContactModule("Amit", "956743939", false),
    ContactModule("Ajay", "599542939", false),
    ContactModule("Madhusudan", "5569542939", false),
    ContactModule("Amit", "566542939", false),
    ContactModule("Ajay", "554542939", false),
    ContactModule("Subhadeep", "554542939", false),
    ContactModule("Ajay", "545429839", false),
    ContactModule("Subhadeep", "554245939", false),
    ContactModule("Palash", "5542939545", false)
  ];
  List<ContactModule> selectedContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Selection ListView"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return contactItem(
                      contacts[index].name,
                      contacts[index].phoneNumber,
                      contacts[index].isSelected,
                      index);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {},
                color: Colors.green[700],
                child: Text("Delete (${selectedContacts.length})"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget contactItem(
      String name, String phoneNumber, bool isSelected, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green[700],
        child: const Icon(Icons.person),
      ),
      title: Text(name),
      subtitle: Text(phoneNumber),
      trailing: isSelected
          ? const Icon(Icons.check_circle)
          : const Icon(Icons.check_circle_outline),
      onTap: () {
        setState(() {
          contacts[index].isSelected = !contacts[index].isSelected;
          if (contacts[index].isSelected == true) {
            selectedContacts.add(ContactModule(name, phoneNumber, true));
          } else if (contacts[index].isSelected == false) {
            // selectedContacts.removeAt(index);
            selectedContacts
                .removeWhere((element) => element.name == contacts[index].name);
          }
        });
      },
    );
  }
}

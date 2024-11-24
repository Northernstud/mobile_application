import 'package:flutter/material.dart';
import 'package:mobile_application/ui/login/api.dart';
import 'package:mobile_application/ui/login/user_model.dart';

class FetchUser extends StatelessWidget {
  
  const FetchUser({super.key});

  @override
  
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: Api.getUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              List<User> udata = snapshot.data;
              return ListView.builder(
                itemCount: udata.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.storage),
                    title: Text("${udata[index].name}"),
                    subtitle: Text("${udata[index].email}"),
                    );
                },
              );
            }
          }
        ),
      );  
    }
  
}
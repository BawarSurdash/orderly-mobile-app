import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Snack extends StatefulWidget {
  const Snack({super.key});

  @override
  State<Snack> createState() => _SnackState();
}

class _SnackState extends State<Snack> {
  Future<List<dynamic>> getdata() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Parse response as a List<dynamic>
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Snack',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 202, 252),
        ),
        body: FutureBuilder<List<dynamic>>(
            future: getdata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data != null) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(snapshot.data![i]['title']),
                          subtitle: Text(snapshot.data![i]['body']),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error ${snapshot.error}",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  return const Center(child: Text('No data available'));
                }
              } else {
                return const Center(child: Text('Something went wrong'));
              }
            }));
  }
}

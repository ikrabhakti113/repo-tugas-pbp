import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/dataWatchlist.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/lihatBudget.dart';
import 'package:counter_7/page/tambahBudget.dart';
import 'package:counter_7/page/lihatDetailWatchlist.dart';


import 'package:flutter/material.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({Key? key}) : super(key: key);

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  Future<List<Watchlist>> fetchToDo() async {
    var url = Uri.parse(
        'http://tugas2pbpikra.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<Watchlist> listWatchlist = [];
    for (var d in data) {
      if (d != null) {
        listWatchlist.add(Watchlist.fromJson(d));
      }
    }

    return listWatchlist;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watchlist'),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              // Menambahkan clickable menu
              ListTile(
                title: const Text('counter_7'),
                onTap: () {
                  // Route menu ke halaman utama
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MyHomePage(title: "counter_7")),
                  );
                },
              ),
              ListTile(
                title: const Text('Tambah Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyFormPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Data Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const showBudget()),
                  );
                },
              ),
              ListTile(
                title: const Text('My Watchlist'),
                onTap: () {
                  // Route menu ke halaman to do
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const WatchlistPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: FutureBuilder(
            future: fetchToDo(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada watchlist :(",
                        style:
                        TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => ListTile(
                
                        title : GestureDetector(
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WatchlistDetail(
                                        watchlist: snapshot.data![index])));
                                    
                        },

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].movieTitle}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),  

                        )
                        
                      ));
                }
              }
            }));
  }
}

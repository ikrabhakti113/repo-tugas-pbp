import 'package:counter_7/model/dataWatchlist.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/lihatBudget.dart';
import 'package:counter_7/page/tambahBudget.dart';
import 'package:counter_7/page/lihatWatchlist.dart';
import 'package:flutter/material.dart';



class WatchlistDetail extends StatelessWidget{
    final Watchlist watchlist;
    const WatchlistDetail({super.key, required this.watchlist});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Detail Watchlist'),
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
        body: Container(
            margin: new EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
                children: [
                    Center(
                        child: Text(watchlist.fields.movieTitle,)
                    ),
                    Row(
                        children: [
                            Text("Release Date : "),
                            Text(watchlist.fields.releaseDate.toString())
                        ]
                    ),
                    Row(
                        children: [
                            Text("Rating : "),
                            Text(watchlist.fields.movieRate.toString())
                        ]
                    ),
                    Row(
                        children: [
                            Text("Status : "),
                            if(watchlist.fields.watchedMovie == WatchedMovie.SUDAH)
                                Text("Sudah"),
                            if(watchlist.fields.watchedMovie == WatchedMovie.BELUM)
                                Text("Belum")
                        ]
                    ),
                    Row(
                        children: [
                            Text("Review : "),
                            Text(watchlist.fields.movieReview)
                        ]
                    ),

                ],
            ),
    
        ),
        persistentFooterButtons: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size.fromHeight(40),
                    ),
                    onPressed: () {
                        Navigator.pop(context);
                    },
                    child: const Text(
                        'Back',
                        style: TextStyle(fontSize : 12),
                    ),
                ),
            ],
        );
    }
}
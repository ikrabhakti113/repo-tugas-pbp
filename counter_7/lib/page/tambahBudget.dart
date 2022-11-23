import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:counter_7/main.dart';
import 'package:counter_7/page/lihatBudget.dart';
import 'package:counter_7/page/tambahBudget.dart';
import 'package:counter_7/page/lihatWatchlist.dart';


class dataBudget {
  static List<dataBudget> databudget = [];
  String judul;
  int nominal;
  String jenis;

  dataBudget({
    required this.judul,
    required this.nominal,
    required this.jenis,
  });

  static void addBudget({
    required judul,
    required nominal,
    required jenis,
  }) {
    databudget.add(dataBudget(
      judul: judul,
      nominal: nominal,
      jenis: jenis,
    ));
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int _nominal = 0;
  String? _select;
  List<String> __jenis = ["Pengeluaran", "Pemasukan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form Budget'),
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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Judul contoh: beli mcd",
                        // Menambahkan icon agar lebih intuitif
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          _judul = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          _judul = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Judul tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Nominal, contoh: 10000",
                        // Menambahkan icon agar lebih intuitif
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik
                      keyboardType: TextInputType.number,
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          _nominal = value! as int;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Nominal tidak boleh kosong';
                        }
                        _nominal = int.parse(value);
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    // Input Jenis
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: DropdownButton(
                        value: _select,
                        hint: const Text("Pilih Jenis"),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: __jenis
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _select = value ?? "";
                          });
                        },
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        dataBudget.addBudget(
                            judul: _judul,
                            nominal: _nominal,
                            jenis: _select,
                            );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyFormPage()),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
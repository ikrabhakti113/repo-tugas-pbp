import 'package:counter_7/tambahBudget.dart';
import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';

class showBudget extends StatefulWidget {
  const showBudget({super.key});

  @override
  State<showBudget> createState() => _showBudgetState();
}

class _showBudgetState extends State<showBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Budget'),
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
                title: const Text('Show Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const showBudget()),
                  );
                },
              ),
            ],
          ),
),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dataBudget.databudget[index].judul,
                    style: const TextStyle(fontSize: 24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dataBudget.databudget[index].nominal.toString(),
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        dataBudget.databudget[index].jenis,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: dataBudget.databudget.length,
      ),
    );
  }
}
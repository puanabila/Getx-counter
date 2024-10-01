import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Contoh Kode GetX',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),  // Halaman pertama (Home)
      debugShowCheckedModeBanner: false,
    );
  }
}

// Controller untuk mengelola state (counter)
class CounterController extends GetxController {
  var counter = 0.obs; // Variabel untuk menyimpan nilai counter
  void increment() {
    counter++;  // Fungsi untuk menambah nilai counter
  }
}

class HomePage extends StatelessWidget {
  // Mendapatkan instance controller
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan nilai counter
            Obx(() => Text(
              'Counter: ${counterController.counter}',
              style: TextStyle(fontSize: 30),
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Pindah ke halaman kedua (SecondPage)
                Get.to(SecondPage());
              },
              child: Text('Pergi Ke Halaman Ke Dua'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambah nilai counter
                counterController.increment();
              },
              child: Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  // Mendapatkan instance controller
  final CounterController counterController = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Kedua'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan nilai counter dari controller yang sama
            Obx(() => Text(
              'Counter: ${counterController.counter}',
              style: TextStyle(fontSize: 30),
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Kembali ke halaman sebelumnya (HomePage)
                Get.back();
              },
              child: Text('Kembali Ke Halaman Utama'),
            ),
          ],
        ),
      ),
    );
  }
}

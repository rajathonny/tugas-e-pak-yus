import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() {
  

  String namaBarang = "Buku Tulis";
  double hargaAnggota = 3000.0;
  double hargaUmum = 3500.0;
  int jumlahStok = 3;
  int jumlahBeli = 3;

  // Variabel bool untuk status anggota
  bool anggota = true;

  // Kategori barang koperasi
  String kategori = "atk";
  
  // Switch-case untuk menentukan lokasi rak berdasarkan kategori
  // Switch-case lebih rapi dibanding banyak if karena:
  // 1. Lebih mudah dibaca dan dipahami
  // 2. Struktur yang jelas dengan case-case terpisah
  // 3. Tidak perlu nested if-else yang rumit
  // 4. Lebih efisien untuk multiple kondisi dengan nilai spesifik
  late String lokasi;
  switch (kategori) {
    case "atk":
      lokasi = "Rak 1";
      break;
    case "makanan":
      lokasi = "Rak 2";
      break;
    case "minuman":
      lokasi = "Rak 3";
      break;
    default:
      lokasi = "Rak lain";
  }

  bool tersedia = jumlahStok != 0;

  // Perhitungan
  double hargaSatuan;
  if (anggota) {
    hargaSatuan = hargaAnggota;
  } else {
    hargaSatuan = hargaUmum;
  }

  double totalAnggota = jumlahBeli * hargaAnggota;
  double totalUmum = jumlahBeli * hargaUmum;
  double total = jumlahBeli * hargaSatuan;

  // Perhitungan diskon berdasarkan total pembelian
  double diskon = 0;
  if (total > 200000) {
    diskon = total * 0.10; // Diskon 10% untuk total > 200000
  } else if (total > 100000) {
    diskon = total * 0.05; // Diskon 5% untuk total > 100000
  } else {
    diskon = 0; // Tanpa diskon
  }

  double hargaAkhir = total - diskon;
  double selisih = totalUmum - totalAnggota;

  // Format harga dengan pemisah ribuan menggunakan NumberFormat dari package intl
  // Referensi: https://pub.dev/packages/intl
  final formatter = NumberFormat('#,##0', 'id_ID');

  debugPrint("=== KARTU DATA BARANG ===");
  debugPrint("Nama : $namaBarang");
  debugPrint("Kategori : $kategori");
  debugPrint("Lokasi Rak : $lokasi");
  debugPrint("Harga Anggota : Rp${formatter.format(hargaAnggota.toInt())}");
  debugPrint("Harga Umum : Rp${formatter.format(hargaUmum.toInt())}");
  debugPrint("Stok : $jumlahStok");
  debugPrint("Tersedia : $tersedia");
  debugPrint("Status Anggota : $anggota");
  debugPrint("Harga Satuan : Rp${formatter.format(hargaSatuan.toInt())}");
  debugPrint("Total (anggota) $jumlahBeli pcs: Rp${formatter.format(totalAnggota.toInt())}");
  debugPrint("Total (umum) $jumlahBeli pcs: Rp${formatter.format(totalUmum.toInt())}");
  debugPrint("Total Sebelum Diskon : Rp${formatter.format(total.toInt())}");
  debugPrint("Diskon : Rp${formatter.format(diskon.toInt())}");
  debugPrint("Harga Akhir : Rp${formatter.format(hargaAkhir.toInt())}");
  debugPrint("Selisih vs umum : Rp${formatter.format(selisih.toInt())}");

  // Daftar barang bernomor untuk koperasi
  // List<String> untuk nama barang dengan minimal 4 item
  List<String> namaBarangList = [
    "Buku Tulis",
    "Pulpen",
    "Penghapus",
    "Roti",
    "RTX 5060"
    "semen 3 roda",
    "paracetamol",
    "susu",
    "sapu lidi",
    "tiang lampu",
    "kabel listrik",
    "iwak peyek",

  ];

  // List<double> untuk harga yang bersesuaian dengan nama barang
  List<double> hargaBarangList = [
    3000.0,
    2500.0,
    1500.0,
    5000.0
  ];

  debugPrint("\n=== DAFTAR BARANG ===\n");

  // Menggunakan for loop untuk menampilkan setiap barang dengan nomor urutannya
  // Iterate safely using the length of the price list to avoid index errors
  for (int i = 0; i < hargaBarangList.length; i++) {
    int nomorUrut = i + 1;
    String nama = i < namaBarangList.length ? namaBarangList[i] : 'Item $nomorUrut';
    double harga = hargaBarangList[i];

    debugPrint("$nomorUrut. $nama - Rp${formatter.format(harga.toInt())}");
  }

  // Fitur: Proses penjualan menggunakan while sampai stok habis
  debugPrint("\n---Penjualan Buku Tulis---");
  int stokPenjualan = jumlahStok;
  while (stokPenjualan > 0) {
    stokPenjualan -= 1;
    debugPrint("Terjual 1, sisa stok: $stokPenjualan");
  }
  
  //peilihan tipe data pada program dapat mencegah kesalahan perhitungan harga barang
  // selain itu tipe data yang pas dapat mempermudahkan perhitugan secara akurat
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 0, 128)),
      ),
      home: const MyHomePage(title: 'iwak peyek'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

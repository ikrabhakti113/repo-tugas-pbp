# Tugas 7
## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

Secara sederhana Stateless Widget dapat diartikan sebagai Widget yang tidak dapat dirubah atau tidak akan pernah berubah.

Misal kita mempunya widget yang berisi text “Buku yang dibaca : 1” maka dari mulai text itu dibuat sampai aplikasi berjalan pun text tersebut tetap akan selalu menjadi “Buku yang dibaca : 1“.

Contoh rill dalam penggunaan Stateless Widget biasanya yaitu untuk halaman “Tentang Aplikasi” yang berisi informasi nama atau logo aplikasi, versi dan lainya yang bersifat statis atau tidak perlu ada perubahan

Stateless Widget  merupakan widget yang di-build hanya dengan konfigurasi yang telah diinisiasi sejak awal.Hal yang dimaksud tidak berubah adalah perubahan dalam variabel, icon, tombol atau pengambilan data tidak akan mengubah state dari aplikasi. Sehingga widget ini cocok untuk digunakan pada tampilan aplikasi yang bersifat statis.

Stateful Widget merupakan widget yang dinamis atau dapat berubah. Berbanding terbalik dengan stateless, stateful widget dapat mengupdate tampilan, merubah warna, menambah jumlah baris dll. Jadi dapat disimpulkan bahwa apapun widget yang dapat berubah maka itulah stateful widget.

Merujuk pada contoh kasus sebelumnya dengan text “Buku yang dibaca : 1”, maka di stateful widget kita dapat merubah text tersebut sesuai kebutuhan. Contoh penggunaannya adalah penggunaan fungsi setState() yang akan bertugas untuk memberitahu widget bahwa ada object yang berubah pada State, sehingga akan melakukan build ulang pada Widget tertentu tersebut.

### Perbedaan
1. Stateless widget bersifat stagnan, sedangkan stateful widget bersifat dinamis.
2. Stateless widget lebih cocok digunakan pada tampilan aplikasi yang tidak memerlukan perubahan tampilan, sedangkan stateful widget lebih cocok digunakan untuk tampilan aplikasi yang memerlukan adanya perubahan. 
3. Penggunaan setState() hanya dapat diaplikasikan pada stateful widget.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. MaterialApp : adalah sebuah parent dimana yang diapitnya akan menerapkan style material design
2. Scaffold : Widget ini memiliki peran untuk mengatur struktur visual layout dengan mengimplementasikan material design
3. Text : Widget ini berfungsi untuk menampilkan text pada aplikasi
4. TextStyle : Widget ini berfungsi untuk memberikan styling pada text misalnya warna dan memiliki syntax mirip css
5. Padding : membuat layout pada tampilan aplikasi untuk masing-masing widget
6. FloatingActionButton: Widget ini berfungsi untuk membuat sebuah tombol

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() merupakan sebuah fungsi yang berguna untuk memberitahu widget bahwa ada objek yang berubah pada State sehingga aplikasi akan memuat ulang widget tersebut sesuai dengan nilai yang sudah diubah. Variabel yang dapat terdampak pada fungsi tersebut adalah variabel yang bersifat stateful widget shingga variable harus yang sifatnya mutable atau tidak statis dan terdeklarasi secara global di sebuah class.

## Jelaskan perbedaan antara const dengan final
1. Const mengharuskan variabel harus diinialisasi pada saat kompilasi sedangkan final tidak mengharuskan variabel memiliki nilai didalam kode pada saat kompilasi.
2. Nilai pada final dapat memiliki nilai yang berbeda dalam variabel yang sama. Sedangkan const tidak dapat memiliki nilai yang berbeda dalam variabel anggota yang sama.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

 1.Awalnya saya Membuat program Flutter dengan menjalankan perintah "flutter create counter_7" didalam repositori repo-tugas-pbp

2. Lalu membuat variabel counter pada class _MyHomePageState_ untuk menampilkan angka pada aplikasi

3. Lalu membuat method _decrementCounter() sama seperti _incrementCounter() yang sebelumnya sudah ada saat kita membuat app baru, namun bedanya method ini akan mengurangi nilai pada counter. Ketika counter akan dikurangi dan menghasilkan -1 maka counter akan diset menjadi 0 (0 merupakan nilai maksimal decrement counter). Proses decrement variabel dilakukan dalam fungsi setState().

4. Lalu saya Membuat isi field FloatingAcitonButton sesuai dengan kebutuhan proyek, yaitu berisi 2 buah button dimana terdapat button decrement di kiri bawah dan button increment di kanan bawah. Kedua button tersebut juga disambungkan dengan properti onPressed. Dan membuat layout di dalam mainAxisAlignment menggunakan Padding.

5. Bind decrement functionnya pada onPressed props di button decrement dan bind function increment pada onPressed props di button increment dan bind iconnya dengan icons.remove untuk decrement dan icons.add untuk increment.

6. Membuat widget Text dan tambahkan handler if else, ketika counter genap maka keluarkan Text Genap, else Text Ganjil

# Tugas 8

## Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement

Perbedaannya pada Navigator.push, kita hanya menimpa layer tampilan sehingga tampilan seperti bentuk data stack, sedangkan Navigator.pushReplacement tidak menimpa, dia akan menggantikan layer tampilan dengan layer yang di-push. 

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

Widget yang digunakan :
1. Drawer    : drawer digunakan sebagai navbar untuk perpindahan tampilan atau sebagai navigator
2. ListTile  : komponen digunakan untuk mengimplementasikan tampilan seperti list dengan info atau icon yang minim.
3. Form      : Untuk membuat sebuah wrapper parent didalamnya terdapat input2 yang dibutuhkan
4. DropDownButton : mengimplementasikan input bertipe dropdown pilihan (jenis)
5. Card      : membuat container kecil untuk data-data dan menampilkannya seperti list
6. TextFormField : field child dari form muntuk meneripa input berupa text
7. TextStyle : mengubah tampilan text

## Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).

1. onPressed
2. onChange
3. onTap
4. onSaved
5. onComplete

## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.

Navigator bekerja seperti tipe data stack, dimana ketika sebuah layer di-push, maka layer sebelumnya akan ditimpa namun tetap disimpan reference nya sebelum layer yang baru, sedangkan pada pushreplacement, maka sebuah layer di-push namun yang sebelumnya tidak ditimpa namun diganti

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

1. Membuat 2 file baru bernama tambahBudget.dart untuk mengimplementasikan model dataBudget serta mengimplementasikan page form dimana bisa digunakan untuk menginput, lalu lihatBudget.dart, file ini digunakan untuk mengimplementasikan pengambilan data yang sudah dibuat dari list yang ada pada model dataBudget dan menampilkannya pada page showBudget;
2. Membuat drawer yang menjadi navigasi ke class MyHomePage, showBudget, dan MyFormPage. Lalu drawer ini akan dimasukkan ke-dalam masing-masing file pada attribute drawer;
3. Menambahkan data yang dibuat kedalam list yang ada di dalam model dataBudget melalui sebuah method yang ada di dalam model dataBudget dengan pembuatan form dan form fields yang dibutuhkan (textform, dropdown);
4. Menampilkan data yang sudah dibuat dalam model dengan mengakses model dan melakukan for loop dengan batas panjang model dataBudget atau dataBudget.len.

 

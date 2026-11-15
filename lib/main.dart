import 'package:flutter/material.dart';

void main() {
  runApp(const UmkmKulinerApp());
}

// ======================================================
// APLIKASI UTAMA
// ======================================================

class UmkmKulinerApp extends StatefulWidget {
  const UmkmKulinerApp({super.key});

  @override
  State<UmkmKulinerApp> createState() => _UmkmKulinerAppState();
}

class _UmkmKulinerAppState extends State<UmkmKulinerApp> {
  // Mode awal aplikasi adalah terang.
  ThemeMode _themeMode = ThemeMode.light;

  void ubahTema() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UMKM Kuliner Medan',
      debugShowCheckedModeBanner: false,

      // TEMA TERANG
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8D4E27),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF8F5),
      ),

      // TEMA GELAP
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8D4E27),
          brightness: Brightness.dark,
        ),
      ),

      themeMode: _themeMode,

      home: HalamanUtama(
        isDarkMode: _themeMode == ThemeMode.dark,
        onToggleTheme: ubahTema,
      ),
    );
  }
}

// ======================================================
// HALAMAN UTAMA
// ======================================================

class HalamanUtama extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HalamanUtama({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  void tampilkanPesan(BuildContext context, String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(pesan), behavior: SnackBarBehavior.floating),
    );
  }

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dapur Medan'),
        centerTitle: true,
        actions: [
          // TOMBOL MODE TERANG DAN GELAP
          IconButton(
            tooltip: isDarkMode
                ? 'Aktifkan mode terang'
                : 'Aktifkan mode gelap',
            onPressed: onToggleTheme,
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),

          IconButton(
            tooltip: 'Informasi',
            onPressed: () =>
                tampilkanPesan(context, 'Selamat datang di Dapur Medan!'),
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==========================================
            // IDENTITAS USAHA
            // ==========================================

            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=900',
                height: 190,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 190,
                    color: warna.primaryContainer,
                    child: const Center(
                      child: Icon(Icons.restaurant, size: 70),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'Dapur Medan',
              style: teks.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              'Nikmati aneka kuliner khas Medan '
              'dengan cita rasa autentik, lezat, '
              'dan harga yang bersahabat.',
              style: teks.bodyLarge,
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                Chip(label: Text('Kuliner Medan')),
                Chip(label: Text('Makanan Tradisional')),
                Chip(label: Text('UMKM Lokal')),
              ],
            ),

            const SizedBox(height: 24),

            // ==========================================
            // INFORMASI USAHA
            // ==========================================
            Text(
              'Informasi Usaha',
              style: teks.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.location_on_outlined),
                    title: const Text('Alamat'),
                    subtitle: const Text('Jl. Medan Kota, Sumatera Utara'),
                    onTap: () => tampilkanPesan(context, 'Alamat Dapur Medan'),
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(Icons.phone_outlined),
                    title: const Text('Telepon'),
                    subtitle: const Text('0812-3456-7890'),
                    onTap: () => tampilkanPesan(context, 'Hubungi Dapur Medan'),
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(Icons.email_outlined),
                    title: const Text('Email'),
                    subtitle: const Text('dapurmedan@email.com'),
                    onTap: () => tampilkanPesan(context, 'Email Dapur Medan'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ==========================================
            // DAFTAR MAKANAN
            // ==========================================
            Text(
              'Daftar Menu Makanan',
              style: teks.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const KartuMenu(
              nama: 'Nasi Goreng Medan',
              harga: 'Rp18.000',
              kategori: 'Makanan Berat',
            ),

            const KartuMenu(
              nama: 'Mie Gomak',
              harga: 'Rp15.000',
              kategori: 'Makanan Tradisional',
            ),

            const KartuMenu(
              nama: 'Soto Medan',
              harga: 'Rp20.000',
              kategori: 'Makanan Berkuah',
            ),

            const KartuMenu(
              nama: 'Bika Ambon',
              harga: 'Rp25.000',
              kategori: 'Kue Tradisional',
            ),

            const KartuMenu(
              nama: 'Lontong Medan',
              harga: 'Rp15.000',
              kategori: 'Makanan Tradisional',
            ),

            const KartuMenu(
              nama: 'Mie Sop',
              harga: 'Rp15.000',
              kategori: 'Makanan Berkuah',
            ),

            const KartuMenu(
              nama: 'Mie Balap',
              harga: 'Rp18.000',
              kategori: 'Makanan Khas Medan',
            ),

            const KartuMenu(
              nama: 'Nasi Campur Medan',
              harga: 'Rp22.000',
              kategori: 'Makanan Berat',
            ),

            const SizedBox(height: 20),

            // ==========================================
            // DAFTAR MINUMAN
            // ==========================================
            Text(
              'Daftar Menu Minuman',
              style: teks.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const KartuMenu(
              nama: 'Teh Manis Dingin',
              harga: 'Rp5.000',
              kategori: 'Minuman Dingin',
              isDrink: true,
            ),

            const KartuMenu(
              nama: 'Kopi Sidikalang',
              harga: 'Rp10.000',
              kategori: 'Minuman Tradisional',
              isDrink: true,
            ),

            const KartuMenu(
              nama: 'Es Campur',
              harga: 'Rp12.000',
              kategori: 'Minuman Dingin',
              isDrink: true,
            ),

            const KartuMenu(
              nama: 'Es Teler',
              harga: 'Rp12.000',
              kategori: 'Minuman Dingin',
              isDrink: true,
            ),

            const KartuMenu(
              nama: 'Bandrek',
              harga: 'Rp10.000',
              kategori: 'Minuman Hangat',
              isDrink: true,
            ),

            const SizedBox(height: 20),

            // ==========================================
            // TOMBOL MATERIAL DESIGN 3
            // ==========================================
            Center(
              child: Column(
                children: [
                  FilledButton.icon(
                    onPressed: () => tampilkanPesan(
                      context,
                      'Terima kasih sudah mengunjungi Dapur Medan!',
                    ),
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('Pesan Sekarang'),
                  ),

                  const SizedBox(height: 8),

                  OutlinedButton(
                    onPressed: () => tampilkanPesan(
                      context,
                      'Terima kasih atas kunjungan Anda!',
                    ),
                    child: const Text('Tentang Kami'),
                  ),

                  TextButton(
                    onPressed: () => tampilkanPesan(
                      context,
                      'Jam operasional: 09.00 - 21.00 WIB',
                    ),
                    child: const Text('Jam Operasional'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// WIDGET KARTU MENU (STATELESS WIDGET)
// ======================================================

class KartuMenu extends StatelessWidget {
  final String nama;
  final String harga;
  final String kategori;
  final bool isDrink;

  const KartuMenu({
    super.key,
    required this.nama,
    required this.harga,
    required this.kategori,
    this.isDrink = false,
  });

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: warna.primaryContainer,
              child: Icon(
                isDrink ? Icons.local_cafe : Icons.restaurant_menu,
                color: warna.onPrimaryContainer,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 4),

                  Text(harga, style: Theme.of(context).textTheme.bodyMedium),

                  const SizedBox(height: 4),

                  Chip(label: Text(kategori)),
                ],
              ),
            ),

            TombolFavorit(namaMenu: nama),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// WIDGET TOMBOL FAVORIT (STATEFUL WIDGET)
// ======================================================

class TombolFavorit extends StatefulWidget {
  final String namaMenu;

  const TombolFavorit({super.key, required this.namaMenu});

  @override
  State<TombolFavorit> createState() => _TombolFavoritState();
}

class _TombolFavoritState extends State<TombolFavorit> {
  bool _favorit = false;

  void ubahFavorit() {
    setState(() {
      _favorit = !_favorit;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _favorit
              ? '${widget.namaMenu} ditambahkan ke favorit'
              : '${widget.namaMenu} dihapus dari favorit',
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: _favorit ? 'Hapus favorit' : 'Tambah favorit',
      onPressed: ubahFavorit,
      icon: Icon(
        _favorit ? Icons.favorite : Icons.favorite_border,
        color: _favorit ? Theme.of(context).colorScheme.primary : null,
      ),
    );
  }
}

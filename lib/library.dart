import 'package:flutter/material.dart';
import 'bookModels.dart';
import 'detail.dart';

class LibraryPage extends StatelessWidget {
  //karena daftar buku diambil langsung dari data statis (bookList) dan tidak ada status interaktif yang diubah langsung pada halaman ini.
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF2CB), 
      appBar: AppBar(
        title: const Text(
          'MyChaeg',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xFFE1666A), 
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFFFF2CB),
        elevation: 0,
        centerTitle: false, //Mengatur posisi judul berada di sebelah kiri.
      ),
      body: ListView.builder( //Widget efisien yang bertugas merender daftar buku secara berulang sesuai panjang data yang ada.
        padding: const EdgeInsets.all(20),
        itemCount: bookList.length, //Menentukan berapa banyak item kartu buku yang dibuat berdasarkan total data di bookList
        itemBuilder: (context, index) {
          final book = bookList[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: InkWell( //Membuat seluruh area kartu bisa diklik.
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailPage(book: book),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Hero( //Membuat efek animasi transisi gambar yang "mencair" halus saat berpindah dari halaman daftar ke halaman detail buku.
                      tag: book.title,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.network(
                          book.imageUrl,
                          width: 75,
                          height: 105,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            width: 75,
                            height: 105,
                            color: const Color(0xFFA7A376).withOpacity(0.25),
                            child: const Icon(Icons.book,
                                color: Color(0xFFE1666A)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C2A21),
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${book.author} • ${book.year}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF8A866A),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              // Rating Badge
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFF7DB),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.star_rounded,
                                        size: 15, color: Color(0xFFD68000)),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${book.rating}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFE1666A),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              // Genre Chip Earthy Green
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFA7A376).withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  book.genre,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF5E5B3D),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xFFD9D4C3),
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
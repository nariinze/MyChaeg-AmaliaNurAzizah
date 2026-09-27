import 'package:flutter/material.dart';
import 'bookModels.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF2CB), 
      appBar: AppBar(
        title: const Text(
          'Detail Buku',
          style: TextStyle(
            color: Color(0xFFE1666A), 
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFFFFF2CB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Color(0xFFE1666A)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Cover Image Card
            Center(
              child: Hero(
                tag: book.title,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      book.imageUrl,
                      height: 230,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Details Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    book.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C2A21),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Oleh ${book.author}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8A866A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Info Badges (Rating, Pages, Year)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildPastelBadge(
                        Icons.star_rounded,
                        const Color(0xFFFFF7DB),
                        const Color(0xFFD68000),
                        '${book.rating}',
                        'Rating',
                      ),
                      _buildPastelBadge(
                        Icons.auto_stories_rounded,
                        const Color(0xFFA7A376).withOpacity(0.25),
                        const Color(0xFF5E5B3D),
                        '${book.pages}',
                        'Halaman',
                      ),
                      _buildPastelBadge(
                        Icons.calendar_month_rounded,
                        const Color(0xFFFDE8E8),
                        const Color(0xFFE1666A),
                        '${book.year}',
                        'Tahun',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Publisher & Genre Card
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        _buildRowInfo('Genre', book.genre),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(color: Color(0xFFF3EFE0)),
                        ),
                        _buildRowInfo('Penerbit', book.publisher),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Synopsis Header
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sinopsis',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE1666A),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    book.description,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: Color(0xFF524F3F),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPastelBadge(
      IconData icon, Color bgColor, Color iconColor, String value, String label) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF2C2A21),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Color(0xFF8A866A)),
          ),
        ],
      ),
    );
  }

  Widget _buildRowInfo(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Color(0xFF8A866A), fontSize: 13),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: Color(0xFF2C2A21),
          ),
        ),
      ],
    );
  }
}
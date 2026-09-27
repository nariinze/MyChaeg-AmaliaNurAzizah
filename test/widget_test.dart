import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/bookModels.dart';
import 'package:flutter_application_1/detail.dart';

void main() {
  testWidgets('BookDetailPage shows book information', (WidgetTester tester) async {
    final book = bookList.first;

    await tester.pumpWidget(
      MaterialApp(
        home: BookDetailPage(book: book),
      ),
    );

    expect(find.text(book.title), findsOneWidget);
    expect(find.text(book.author), findsOneWidget);
    expect(find.text(book.description), findsOneWidget);
  });
}

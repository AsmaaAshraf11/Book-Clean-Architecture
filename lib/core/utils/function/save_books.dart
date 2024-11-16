// core/utils/function/save_books.dart
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

//import '../../../Features/home/domain/entities/book_entity.dart';
import '../../../constants.dart';

void SaveBookData({required List<BookEntity> books,required String boxName}) {
    var box=Hive.box(kFeaturedBox);
    box.addAll(books);
  }
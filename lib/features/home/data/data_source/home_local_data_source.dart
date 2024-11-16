// features/home/data/data_source/home_local_data_source.dart
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../constants.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource{
  List<BookEntity>fetchFeaturedBooks();
  List<BookEntity>fetchNewsetBooks();

}
class HomeLocalDataSourceIml extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks

        var box=Hive.box<BookEntity>(kFeaturedBox);
        return box.values.toList();
   }

  @override
  List<BookEntity> fetchNewsetBooks() {
    // TODO: implement fetchNewsetBooks
    throw UnimplementedError();
  }

}
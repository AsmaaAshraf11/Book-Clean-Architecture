// features/home/data/data_source/home_remote_data_source.dart

import '../../../../constants.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/function/save_books.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource{
  Future <List<BookEntity>>fetchFeaturedBooks();
    Future <List<BookEntity>>fetchNewsetBooks();

}
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
    final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks()async {
    // TODO: implement fetchFeaturedBooks
     var data=   await apiService.get(endPoint:
        'volumes?Filtering=free-ebooks&q=subject:Programming');   
      List<BookEntity> books = getBooksList(data); 
      SaveBookData(books: books, boxName: kFeaturedBox);
      return books;
  }

  
  

  @override
  Future<List<BookEntity>> fetchNewsetBooks()async {
     var data=   await apiService.get(endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');

              
              List<BookEntity> books = getBooksList(data); 
      return books;
  }

  
  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
          for (var item in data['items']) {
            try {
              books.add(BookModel.fromJson(item));
            } catch (e) {
              books.add(BookModel.fromJson(item));
            }
          } 
    return books;
  }

}
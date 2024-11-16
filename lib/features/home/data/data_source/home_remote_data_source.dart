import 'package:book/core/utils/api_service.dart';
import 'package:book/features/home/data/models/book_model/book_model.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';


abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    print('books start');
    var data = await apiService.get(
        endPoint:
        'volumes?Filtering=free-ebooks&q=programming');
    print('data:data');
    List<BookEntity> books = getBooksList(data);
    print('books:$books');
    //saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> books = getBooksList(data);
    //saveBooksData(books, kNewestBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    print('books books');
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }print('books books:$books');
    return books;
  }
}

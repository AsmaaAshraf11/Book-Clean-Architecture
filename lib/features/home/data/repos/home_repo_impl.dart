// features/home/data/repos/home_repo_impl.dart
import 'package:book/core/errors/failures.dart';
import 'package:book/features/home/data/data_source/home_local_data_source.dart';
import 'package:book/features/home/data/data_source/home_remote_data_source.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/repos/hom_repo.dart';
import 'package:dartz/dartz.dart';


class HomeRepoImpl implements HomRepo {
      final HomeRemoteDataSource homeRemoteDataSource;
          final HomeLocalDataSource HhmeLocalDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource, required this.HhmeLocalDataSource});


  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks()async {
    
      try {
        List<BookEntity>booksList;
    // TODO: implement fetchFeaturedBooks
     booksList= HhmeLocalDataSource.fetchFeaturedBooks();
    if(booksList.isNotEmpty){
    return right(booksList);
    }
    booksList =await homeRemoteDataSource.fetchFeaturedBooks();
    
    return right(booksList);
    
  }on Exception catch (e) {
        return left(
           ServerFailure(e.toString())
        );
      }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsetBooks()async {
    // TODO: implement fetchNewsetBooks
try {
        List<BookEntity>books;
    // TODO: implement fetchFeaturedBooks
     books= HhmeLocalDataSource.fetchNewsetBooks();
    if(books.isNotEmpty){
    return right(books);
    }
    books =await homeRemoteDataSource.fetchNewsetBooks();
    
    return right(books);
    
  }on Exception catch (e) {
        return left(
           ServerFailure(e.toString())
        );
      }  }
  
}

// features/home/data/repos/home_repo_impl.dart
import 'package:book/core/errors/failures.dart';
import 'package:book/features/home/data/data_source/home_local_data_source.dart';
import 'package:book/features/home/data/data_source/home_remote_data_source.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/repos/hom_repo.dart';
import 'package:dartz/dartz.dart';


class HomeRepoImpl implements HomRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int PageNamber = 0}) async {
    try {
      List<BookEntity> booksList = [];
      // booksList = homeLocalDataSource.fetchFeaturedBooks();
      // if (booksList.isNotEmpty) {
      //   return right(booksList);
      // }
      booksList = await homeRemoteDataSource.fetchFeaturedBooks();

      return right(booksList);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsetBooks() async {
    // TODO: implement fetchNewsetBooks
    try {
      List<BookEntity> books=[];
       books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}

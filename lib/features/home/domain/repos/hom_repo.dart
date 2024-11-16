// features/home/domain/repos/hom_repo.dart
import '../../../../core/errors/failures.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomRepo{
  Future <Either<Failure,List<BookEntity>>>fetchFeaturedBooks();
    Future <Either<Failure,List<BookEntity>>>fetchNewsetBooks();

}
// features/home/domain/use_cases/fetchFeaturedBooks_use_cases.dart


import 'package:book/core/errors/failures.dart';
import 'package:book/core/use_cases/use_case.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/repos/hom_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNamber=0]) async {
    // if here have any thing to check
    return await homeRepo.fetchFeaturedBooks(
      PageNamber: pageNamber
    );
  }
}

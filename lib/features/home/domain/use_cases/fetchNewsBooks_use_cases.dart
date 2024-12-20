// features/home/domain/use_cases/fetchNewsBooks_use_cases.dart
import 'package:book/features/home/domain/repos/hom_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/book_entity.dart';

class FetchNewestbooksUseCases extends UseCases<List<BookEntity>,void> {
  final HomRepo homRepo ;

  FetchNewestbooksUseCases(this.homRepo);
  
  // @override
  // Future<Either<Failure, dynamic>> call() {
  //   // TODO: implement call
  //   throw UnimplementedError();
  // }
    @override
      Future <Either<Failure,List<BookEntity>>>call([parameter ]){
      return homRepo.fetchNewsetBooks();
    }

}
abstract class UseCases<Type,parameter>{
  Future <Either<Failure,Type>> call([parameter p]);
}
// core/use_cases/use_case.dart
import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class UseCases<Type,parameter>{
  Future <Either<Failure,Type>> call([parameter p]);
}
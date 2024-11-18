// features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart

import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/use_cases/fetchFeaturedBooks_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNamber=0}) async {
    if(pageNamber==0){
      emit(FeaturedBooksLoading());

    } else 
    {
          emit(FeaturedBooksPaginationLoading());

    }
    print('FeaturedBooksLoading11');
    var result = await featuredBooksUseCase.call(pageNamber);
    print('FeaturedBooksLoading22');
    result.fold((failure) {
      if(pageNamber==0){
           emit(FeaturedBooksFailure(failure.errMessage));
    } else 
    {
          emit(FeaturedBooksPaginationFailure(failure.errMessage));

    }
   
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}

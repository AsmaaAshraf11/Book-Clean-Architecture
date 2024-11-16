
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/use_cases/fetchFeaturedBooks_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    print('FeaturedBooksLoading11');
    var result = await featuredBooksUseCase.call();
    print('FeaturedBooksLoading22');
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}

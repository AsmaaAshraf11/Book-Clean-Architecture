// features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetchFeaturedBooks_use_cases.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchfeaturedbooksUseCases,) : super(FeaturedBooksInitial());

  final FetchfeaturedbooksUseCases fetchfeaturedbooksUseCases;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await fetchfeaturedbooksUseCases.call();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}

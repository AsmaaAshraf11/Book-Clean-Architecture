// features/home/presentation/manger/newest_books_cubit/newset_books_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:book/features/home/domain/use_cases/fetchNewsBooks_use_cases.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/repos/hom_repo.dart';

//import 'newset_books_state.dart';
part 'newset_books_state.dart';



class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.fetchNewestbooksUseCases) : super(NewsetBooksInitial());
  final FetchNewestbooksUseCases fetchNewestbooksUseCases;

  Future<void> fetchNewestBooks() async {
    emit(NewsetBooksLoading());
    var result = await fetchNewestbooksUseCases.call();
    result.fold((failure) {
      emit(NewsetBooksFailure(failure.errMessage));
    }, 
    (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}

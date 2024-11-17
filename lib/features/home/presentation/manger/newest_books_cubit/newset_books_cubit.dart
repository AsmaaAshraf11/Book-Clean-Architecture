// features/home/presentation/manger/newest_books_cubit/newset_books_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/repos/hom_repo.dart';

//import 'newset_books_state.dart';
part 'newset_books_state.dart';



class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold((failure) {
      emit(NewsetBooksFailure(failure.errMessage));
    }, 
    (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}
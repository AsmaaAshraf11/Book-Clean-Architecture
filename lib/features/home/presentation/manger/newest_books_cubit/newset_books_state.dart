// features/home/presentation/manger/newest_books_cubit/newset_books_state.dart
part of 'newset_books_cubit.dart';

abstract class NewsetBooksState extends Equatable {
  const NewsetBooksState();

  @override
  List<Object> get props => [];
}

class NewsetBooksInitial extends NewsetBooksState {}

class NewsetBooksLoading extends NewsetBooksState {}

class NewsetBooksSuccess extends NewsetBooksState {
  final List<BookEntity> books;

  const NewsetBooksSuccess(this.books);
}

class NewsetBooksFailure extends NewsetBooksState {
  final String errMessage;

  const NewsetBooksFailure(this.errMessage);
}

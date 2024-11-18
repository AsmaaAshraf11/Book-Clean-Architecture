// features/home/presentation/views/widgets/featured_books_listView_blocConsumer.dart
import 'package:book/core/widgets/custom_error_widget.dart';
import 'package:book/core/widgets/custom_loading_indicator.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:book/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() => _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState extends State<FeaturedBooksListViewBlocConsumer> {
  List <BookEntity>books=[];
  @override
  Widget build(BuildContext context) {
    return
    BlocConsumer<FeaturedBooksCubit,FeaturedBooksState>(
      listener: (BuildContext context, FeaturedBooksState state) { 
        if(state is FeaturedBooksSuccess)
        books.addAll(state.books);
       },
       builder: (BuildContext context, state) { 
        if (state is FeaturedBooksSuccess ||state is FeaturedBooksPaginationLoading||state is  FeaturedBooksPaginationFailure) {
   return  FeaturedBooksListView(
    books:books,

   );
        }else if (state is FeaturedBooksFailure) {
           return CustomErrorWidget(errMessage: state.errMessage);
         }
         else {
            return const CustomLoadingIndicator();
        }
  }, 
    );
}
}
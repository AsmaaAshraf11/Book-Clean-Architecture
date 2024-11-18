// features/home/presentation/views/widgets/featured_list_view.dart
import 'package:book/core/utils/assets.dart';
import 'package:book/core/widgets/custom_error_widget.dart';
import 'package:book/core/widgets/custom_loading_indicator.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_book_item.dart';

import 'package:flutter/material.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key, required this.books}) : super(key: key);
  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late ScrollController _scrollController;
 var Nextpage=1;
 var isloading=false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener()async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
      // Trigger your desired action here
      if(!isloading){
        isloading=true;
      await  BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(
        pageNamber: Nextpage++);
        isloading=false;
      }
      
      print("Scrolled 70% of the list");
      
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                // GoRouter.of(context).push(
                //   AppRouter.kBookDetailsView,
                //   extra: state.books[index],
                // );
              },
              child: CustomBookImage(
                imageUrl: widget.books[index].image ?? AssetsData.testImage,
              ),
            ),
          );
        },
      ),
    );
  }
}


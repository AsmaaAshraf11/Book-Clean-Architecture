// features/home/presentation/views/widgets/featured_list_view.dart
import 'package:book/core/utils/assets.dart';
import 'package:book/core/widgets/custom_error_widget.dart';
import 'package:book/core/widgets/custom_loading_indicator.dart';
import 'package:book/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
      builder: (BuildContext context, state) {  
                if (state is FeaturedBooksSuccess) {

      return FeaturedBooksBuilder(context);
                }else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        }
                else if(state is FeaturedBooksFailure){
                  return Text('${state.errMessage}');
                }
                else {
          return const CustomLoadingIndicator();
        }
      }
    );
  }

  SizedBox FeaturedBooksBuilder(BuildContext context) {
    return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                //itemCount: state.books.length,
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
                        //  state.books[index].volumeInfo.imageLinks
                        //         ?.thumbnail ??
                        imageUrl: AssetsData.testImage
                      ),
                    ),
                  );
                }),
          );
  }
}

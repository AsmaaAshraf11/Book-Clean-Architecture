// main.dart
import 'package:book/constants.dart';
import 'package:book/core/utils/app_router.dart';
import 'package:book/core/utils/service_locator.dart';
import 'package:book/core/utils/simple_bloc_observer.dart';
import 'package:book/features/home/data/repos/home_repo_impl.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/use_cases/fetchFeaturedBooks_use_cases.dart';
import 'package:book/features/home/domain/use_cases/fetchNewsBooks_use_cases.dart';
import 'package:book/features/home/presentation/manger/newest_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupServiceLocator();

  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),

            )..fetchFeaturedBooks();
            
          },
        ),
         BlocProvider(
          create: (context) => NewsetBooksCubit(
            // HomeRepoImpl(ApiService(Dio()))
            FetchNewestbooksUseCases(
              getIt.get<HomeRepoImpl>(),
            )
          
          )..fetchNewestBooks(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}

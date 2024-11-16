// core/utils/simple_bloc_observice.dart
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObservice extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    log(change.toString());
    super.onChange(bloc, change);
  }
}
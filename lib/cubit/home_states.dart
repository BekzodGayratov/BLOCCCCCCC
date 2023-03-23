import 'package:bloc/bloc.dart';
import 'package:bloccc/models/currency_model.dart';
import 'package:bloccc/repository/home_repository.dart';
import 'package:bloccc/service/get_users_service.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {
 const HomeInitialState();
}

class HomeLoadingState extends HomeState {
  HomeLoadingState();
}

class HomeErrorState extends HomeState {
  String error;
  HomeErrorState(this.error);
}

class HomeCompleteState extends HomeState {
  List<CurrencyModel> currency;
  HomeCompleteState(this.currency);
}

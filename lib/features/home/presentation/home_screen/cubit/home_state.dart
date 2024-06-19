part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class BestSellingDataFetchedState extends HomeState {}

final class NewArrivalsDataFetchedState extends HomeState {}

final class RecommendedForYouDataFetchedState extends HomeState {}
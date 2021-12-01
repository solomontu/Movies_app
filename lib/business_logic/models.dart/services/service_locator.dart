import 'package:get_it/get_it.dart';
import 'package:movies/business_logic/models.dart/view_model/movies_view_model.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocators() {
  getIt.registerSingleton<MovieViewModel>(MovieViewModel());
}

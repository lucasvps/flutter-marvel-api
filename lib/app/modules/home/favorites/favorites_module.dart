
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_api/app/modules/home/favorites/favorites_page.dart';
import 'package:marvel_api/app/modules/home/home_controller.dart';
import 'package:marvel_api/app/repositories/character_repo.dart';


class FavoritesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CharacterRepository()),
        Bind((i) => HomeController(i.get<CharacterRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => FavoritesPage()),
      ];

  static Inject get to => Inject<FavoritesModule>.of();
}

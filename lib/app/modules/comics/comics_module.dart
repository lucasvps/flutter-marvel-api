import 'package:marvel_api/app/modules/comics/comics_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_api/app/modules/comics/comics_page.dart';
import 'package:marvel_api/app/repositories/character_repo.dart';

class ComicsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CharacterRepository()),
        Bind((i) => ComicsController(i.get<CharacterRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/:id', child: (_, args) => ComicsPage(id: args.params['id'],)),
      ];

  static Inject get to => Inject<ComicsModule>.of();
}

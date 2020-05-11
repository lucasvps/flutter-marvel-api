// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$favoritesAtom = Atom(name: '_HomeControllerBase.favorites');

  @override
  List<Character> get favorites {
    _$favoritesAtom.context.enforceReadPolicy(_$favoritesAtom);
    _$favoritesAtom.reportObserved();
    return super.favorites;
  }

  @override
  set favorites(List<Character> value) {
    _$favoritesAtom.context.conditionallyRunInAction(() {
      super.favorites = value;
      _$favoritesAtom.reportChanged();
    }, _$favoritesAtom, name: '${_$favoritesAtom.name}_set');
  }

  final _$searchAtom = Atom(name: '_HomeControllerBase.search');

  @override
  String get search {
    _$searchAtom.context.enforceReadPolicy(_$searchAtom);
    _$searchAtom.reportObserved();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.context.conditionallyRunInAction(() {
      super.search = value;
      _$searchAtom.reportChanged();
    }, _$searchAtom, name: '${_$searchAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setSearch(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setSearch(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'favorites: ${favorites.toString()},search: ${search.toString()}';
    return '{$string}';
  }
}

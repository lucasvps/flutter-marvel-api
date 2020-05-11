
import 'package:marvel_api/app/models/thumb_model.dart';

class Character {
  int id;
  String name;
  String description;
  String thumbnailExt;
  Thumbnail thumbnail;

  Character({
    this.id,
    this.name,
    this.description,
    this.thumbnail,
  });


  // REcupera um json e transforma em map
  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];

    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    thumbnailExt = thumbnail.path + '.' + thumbnail.ext;
  }

  // REcupera um json e transforma em map
  Character.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    thumbnailExt = json['thumbnailExt'];
  }

   // Envia um map para com json
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['thumbnailExt'] = this.thumbnailExt;

    return data;
  }


  // Envia um map para com json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;

    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }

    return data;
  }


  @override
  String toString(){
    return "Character => (id: $id, name : $name, description: $description, thumb : $thumbnail)";
  }


  // Map<String, dynamic> toMap (){

  //   var map = <String, dynamic> {
  //     'id' : id,
  //     'name': name,
  //     'description' : description,
  //     'thumbnail' : thumbnail
  //   };

  //   return map;

  // }


}



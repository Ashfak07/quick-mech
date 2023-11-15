import 'package:quickmech/model/mechanic_model.dart';

class FavouriteModel {
  static List mechlist = [
    MechanicModel(
        name: 'Saju',
        image:
            'https://cdn1.vectorstock.com/i/1000x1000/23/70/man-avatar-icon-flat-vector-19152370.jpg'),
    MechanicModel(
        name: 'ragav',
        image:
            'https://cdn1.vectorstock.com/i/1000x1000/23/65/man-avatar-icon-flat-vector-19152365.jpg')
  ];

  Item getById(int id) => Item(id, mechlist[id % mechlist.length].toString(),
      mechlist[id % mechlist.length].toString());

  Item getByPosition(int position) {
    return getById(position);
  }
}

class Item {
  final int id;
  final String name;
  final String image;

  Item(this.id, this.name, this.image);
  @override
  int get hashcode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}

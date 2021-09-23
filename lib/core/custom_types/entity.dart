import 'id.dart';

abstract class Entity<T extends Id> {
  T? id;

  Entity(
    this.id,
  );

  bool equals(Entity<T> other) {
    if (id == null || other.id == null) {
      return false;
    }

    return id == other.id;
  }
}

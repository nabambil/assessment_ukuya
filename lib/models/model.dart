abstract class Model<T> {
  Model();

  void toJson();
  bool isContain(String query, T type);
}

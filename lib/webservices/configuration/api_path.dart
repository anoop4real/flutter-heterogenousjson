enum APIPath {
  search
}
extension APIPathConfig on APIPath {
  String get path {
    switch (this) {
      case APIPath.search:
        return '/db';
    }
  }
}
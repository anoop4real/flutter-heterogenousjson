enum APIEnvironment {
  production
}
extension APIEnvironmentExtension on APIEnvironment {
  String get baseURL {
    switch (this) {
      case APIEnvironment.production:
        return "https://my-json-server.typicode.com/anoop4real/demo";
    }
  }
}
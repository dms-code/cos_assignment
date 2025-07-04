/// The `ApiRoutes` is an enum that provides access to the API routes.
enum ApiRoutes {
  vehicles,
}

extension ApiRoutesExtension on ApiRoutes {
  String get path {
    switch (this) {
      case ApiRoutes.vehicles:
        return "https://api.cos.com/vehicles";
    }
  }
}


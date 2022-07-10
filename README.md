# Flutter Todo List

Flutter app using Domain Driven Design (DDD). Series sample app **Flutter Firebase & DDD** by **Reso Coder**

The following describes the architecture of the app, the structure of the project and the dependencies used.

<p align="center">
  <img src="https://github.com/santimattius/flutter_todo_list/blob/master/art/flutter_todo_list_login.png" width="300"/>
  <img src="https://github.com/santimattius/flutter_todo_list/blob/master/art/flutter_todo_list_home.png" width="300"/>
</p>

# Architecture 
## Bounded context
<p align="left">
  <img src="https://github.com/santimattius/flutter_todo_list/blob/master/art/bounded_context_ddd.png?raw=true" alt="Project packages"/>
</p>

## Flow
<p align="left">
  <img src="https://github.com/santimattius/flutter_todo_list/blob/master/art/arch_flow_ddd.png?raw=true" alt="Project packages"/>
</p>

## Packages
```yaml
dependencies:
  flutter:
    sdk: flutter
  dartz: ^0.10.0
  freezed_annotation: ^2.0.3
  cloud_firestore: ^3.1.15
  flutter_bloc: ^8.0.1
  flutter_hooks: ^0.18.0
  firebase_core: ^1.4.0
  firebase_auth: ^3.0.1
  google_sign_in: ^5.0.7
  get_it: ^7.2.0
  injectable: ^1.5.0
  uuid: ^3.0.4
  auto_route: ^4.0.1
  kt_dart: ^0.10.0
  json_annotation: ^4.3.0
  rxdart: ^0.27.1
  provider: ^6.0.1
  implicitly_animated_reorderable_list: ^0.4.1
  flutter_slidable: ^1.2.0
  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.0

dev_dependencies:
  build_runner: null
  freezed: ^2.0.3+1
  lint: ^1.5.3
  injectable_generator: ^1.5.0
  auto_route_generator: ^4.0.0
  json_serializable: ^6.0.1

dependency_overrides:
  analyzer: ^4.0.0
  meta: ^1.7.0
```
## References

- [Domain Driven Design](https://martinfowler.com/bliki/DomainDrivenDesign.html)
- [Flutter Firebase & DDD](https://www.youtube.com/playlist?list=PLB6lc7nQ1n4iS5p-IezFFgqP6YvAJy84U) by [Reso Coder](https://www.youtube.com/c/ResoCoder)
  - The whole accompanying tutorial series is available at 👉 [this link](https://resocoder.com/flutter-firebase-ddd-course) 👈.


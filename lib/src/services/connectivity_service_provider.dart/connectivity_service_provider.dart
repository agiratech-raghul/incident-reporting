// import 'dart:async';
// import 'dart:developer';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:provider/provider.dart';
//
// import 'data_connection_checker.dart';
//
// enum ConnectionStatus { connected, disconnected }
//
// final connectionStreamProvider = StreamProvider.<ConnectionStatus>(
//   (ref) {
//     final controller = StreamController<ConnectionStatus>();
//
//     final connectivitySub = Connectivity()
//         .onConnectivityChanged
//         .debounceTime(const Duration(milliseconds: 300))
//         .listen(
//       (status) {
//         log("NetworkConnectivity status changed: $status");
//         if (status == ConnectivityResult.none) {
//           controller.sink.add(ConnectionStatus.disconnected);
//         }
//       },
//     );
//     final dataConnectionSub = DataConnectionChecker().onStatusChange.listen(
//       (status) {
//         log("InternetConnection status changed: $status");
//         if (status == DataConnectionStatus.disconnected) {
//           controller.sink.add(ConnectionStatus.disconnected);
//         } else {
//           controller.sink.add(ConnectionStatus.connected);
//         }
//       },
//     );
//
//     ref.onDispose(() {
//       controller.close();
//       connectivitySub.cancel();
//       dataConnectionSub.cancel();
//     });
//
//     return controller.stream.distinct().skip(1);
//   },
// );
//
// final connectionStreamProviders = StreamProvider.value(value: value, initialData: initialData)
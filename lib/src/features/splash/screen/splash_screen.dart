import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';
import 'package:incident_reporting/src/ui_utils/app_snack_bar.dart';
import 'package:incident_reporting/src/utils/src/helpers/ui_dimens.dart';
import 'package:size_setter/size_setter.dart';
import '../../../services/connectivity_service_provider.dart/connectivity_service_provider.dart';
import '../../../utils/utils.dart';
import '../../../constants/string_constants.dart';

class SplashScreen extends StatefulHookConsumerWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() async {
    Future.delayed(const Duration(seconds: 1), _moveToNextPage);
  }

  void _moveToNextPage() {
    Navigator.of(context).pushReplacementNamed(RouteConstants.signInScreen);
  }

  @override
  Widget build(BuildContext context) {
    // ref.listen<AsyncValue<ConnectionStatus>>(
    //   connectionStreamProvider,
    //   (prevState, newState) {
    //     newState.whenOrNull(
    //       data: (status) {
    //         String message = status == ConnectionStatus.disconnected
    //             ? 'Your Disconnected'
    //             : 'Your Back Online';
    //         AppSnackBar(isPositive: true, message: message)
    //             .showAppSnackBar(context);
    //       },
    //     );
    //   },
    // );

    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Image.asset(
          fit: BoxFit.cover,
          height: Utils.getScreenHeight(
              context, Utils.getScreenHeight(context, UIDimens.size70)),
          AppAssets.appLogo),
    ));
  }
}


import 'package:flutter/material.dart';

import '../../../../../data/helpers/color.helper.dart';
import '../../../widgets/buttons/button.dart';



class LandingPage extends StatelessWidget{
  final VoidCallback onGetStarted;
  const LandingPage({super.key, required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("FinAid", style: theme.textTheme.headlineLarge!.apply(color: theme.colorScheme.primary, fontWeightDelta: 1),),
              const SizedBox(height: 15,),
              Text("Managing your savings", style: theme.textTheme.headlineMedium!.apply(color: ColorHelper.lighten(theme.colorScheme.primary, 0.1)),),
              const SizedBox(height: 25,),
               Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.check_box, color: theme.colorScheme.primary,),
                  const SizedBox(width: 15,),
                  const Expanded(child: Text("Manage your finance with our app."))
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.check_box, color: theme.colorScheme.primary,),
                  const SizedBox(width: 15,),
                  const Expanded(child: Text("Monitoring your expenses for accurate budgeting"))
                ],
              ),
              const SizedBox(height: 10,),
               Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.check_box, color: theme.colorScheme.primary,),
                  const SizedBox(width: 15,),
                  const Expanded(child: Text("Keeping track of your expenses everywhere you go.") ,)
                ],
              ),
              const Expanded(child: SizedBox()),
              const Text("*Here you go."),
              const SizedBox(height: 20,),
              Container(
                alignment: Alignment.bottomRight,
                child: AppButton(
                  color: theme.colorScheme.inversePrimary,
                  isFullWidth: true,
                  onPressed: onGetStarted,
                  size: AppButtonSize.large,
                  label: "Get Started",
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

}
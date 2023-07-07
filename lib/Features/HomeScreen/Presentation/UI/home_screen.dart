import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../CountryList/Presentation/UI/country_list.dart';
import '../../../LocalCountry/Presentation/UI/local_country_list.dart';
import '../Bloc/homepage_controller_cubit.dart';
import '../Bloc/homepage_controller_state.dart';
import 'Widgets/home_screen_contents.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> contents = [  CountryList(),
      LocalCountryList(),];
    return SafeArea(child: BlocBuilder<HomepageControllerCubit, HomepageState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              onTap: (int index) {
                context.read<HomepageControllerCubit>().changePageIndex(index);
              },
              currentIndex: state.pageIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt),
                  label: 'Country List',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.devices),
                  label: 'Local',
                )
              ]),
          body: contents[state.pageIndex],
        );
      },


    ));
  }
}

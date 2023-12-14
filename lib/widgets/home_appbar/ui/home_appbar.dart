import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/consts.dart';
import 'package:news_app/widgets/home_appbar/bloc/appbar_bloc.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({super.key, required this.title});
  final AppbarBloc appbarBloc = AppbarBloc();
  final String title;
  Country country = Country.parse('in');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        Icon(Icons.search),
        IconButton(
          onPressed: () {
            showCountryPicker(
                countryFilter: countryList,
                context: context,
                onSelect: (Country value) {
                  country = value;
                  appbarBloc.add(CountrySelectClickedEvent());
                },
                favorite: ['IN'],
                useSafeArea: false);
          },
          icon: BlocBuilder<AppbarBloc, AppbarState>(
            bloc: appbarBloc,
            buildWhen: (previous, current) =>
                current is CountrySelectClickedState,
            builder: (context, state) {
              if (state is AppbarInitial) {
                return Text(
                  country.flagEmoji,
                  style: TextStyle(fontSize: 18),
                );
              } else if (state is CountrySelectClickedState) {
                return Text(
                  country.flagEmoji,
                  style: TextStyle(fontSize: 18),
                );
              } else {}
              return Text('error');
            },
          ),
        )
      ],
      title: Text(
        title,
        style: GoogleFonts.dancingScript(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 2),
      ),
    );
  }
}

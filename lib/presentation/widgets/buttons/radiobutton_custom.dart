import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:musick/config/theme/theme_data.dart';
import 'package:musick/data/models/song/song_model.dart';
import 'package:musick/presentation/cubits/song/song_cubit.dart';


List<String> enumValuesToStringList() {
  return GenreEnum.values.map((genre) => genre.toString().split('.').last).toList();
}
class CustomRadio extends StatefulWidget {
  final GenreEnum value;
  final GenreEnum groupValue;
  final ValueChanged<GenreEnum> onChanged;

  const CustomRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}
GroupButtonController groupButtonController = new GroupButtonController();
class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return GroupButton(
      enableDeselect: true,
      options: GroupButtonOptions(
        selectedShadow: const [],
        selectedTextStyle: myThemePlayfair.textTheme.bodyLarge
            ?.copyWith(  color: Theme.of(context).colorScheme.background,fontWeight: FontWeight.w600),

        selectedColor:  Theme.of(context).colorScheme.primary,
        unselectedShadow: const [],
        unselectedColor: Colors.amber[100]?.withOpacity(0.1),
        unselectedTextStyle:myThemePlayfair.textTheme.bodyLarge
            ?.copyWith(  color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.w600),
        selectedBorderColor: Theme.of(context).colorScheme.background,
        unselectedBorderColor: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        spacing: 15,
        runSpacing: 10,
        groupingType: GroupingType.wrap,
        direction: Axis.horizontal,
        // buttonHeight: 40,
        // buttonWidth: 80,
        mainGroupAlignment: MainGroupAlignment.start,
        crossGroupAlignment: CrossGroupAlignment.start,
        groupRunAlignment: GroupRunAlignment.start,
        textAlign: TextAlign.center,
        textPadding: EdgeInsets.zero,
        alignment: Alignment.center,
        elevation: 1,
      ),
      isRadio: true,
      onSelected: (index, isSelected,no) {
        if (!no) {
          print("triggered on selected");
          // Trigger the function when the button is deselected
          BlocProvider.of<SongCubit>(context).searchByGenreString("");
        }
        else{
        BlocProvider.of<SongCubit>(context).searchByGenreString(index);}
      },
      buttons: enumValuesToStringList(),
    );
  }
}


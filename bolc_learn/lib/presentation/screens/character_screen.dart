// ignore_for_file: avoid_print, unused_field, unused_element

import 'package:bolc_learn/business_logic/cubit/charcters_cubit.dart';
import 'package:bolc_learn/constants/my_colors.dart';
import 'package:bolc_learn/data/models/charaters.dart';
import 'package:bolc_learn/presentation/widget/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}
//create => init => build     
class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  late List<Character> searchedForCharacters;
  bool _isSearched = false;
  final _searchController = TextEditingController();
 
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharctersCubit>(context).getAllCharaters();
  }
  
  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: buildAppBarActions(),
          backgroundColor: MyColor.myYellow,
          title: _isSearched ? _buildSearchField() : _buildAppBarTitle()),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return _buildBlocBuilder();
          } else {
            return buildNoInternetWidget();
          }
        },
        child: const Center(
            child: CircularProgressIndicator(
          color: MyColor.myYellow,
        )),
      ),
      backgroundColor: MyColor.myGrey,
    );
  }

  Widget _buildAppBarTitle() {
    return const Text(
      "Charaters",
      style: TextStyle(
        color: MyColor.myGrey,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      cursorColor: MyColor.myGrey,
      decoration: const InputDecoration(
        hintText: "Find a Charather",
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: MyColor.myGrey,
          fontSize: 16,
        ),
      ),
      style: const TextStyle(
        color: MyColor.myGrey,
        fontSize: 16,
      ),
      onChanged: (searchedChar) {
        addSearchedToItemTOSearchedList(searchedChar);
      },
    );
  }

  void addSearchedToItemTOSearchedList(String searchedChar) {
    searchedForCharacters = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedChar))
        .toList();
    setState(() {});
  }

  List<Widget> buildAppBarActions() {
    if (_isSearched) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.clear,
              color: MyColor.myGrey,
            ))
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            Icons.search,
            color: MyColor.myGrey,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(
        onRemove: _stopSearching,
      ),
    );
    setState(() {
      _isSearched = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearched = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  Widget _buildCharaterList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 2 / 3,
      ),
      shrinkWrap: false,
      physics: const ScrollPhysics(),
      itemCount: _searchController.text.isNotEmpty
          ? searchedForCharacters.length
          : allCharacters.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 100,
          child: _searchController.text.isNotEmpty
              ? CharacterItem(
                  character: searchedForCharacters[index],
                )
              : CharacterItem(
                  character: allCharacters[index],
                ),
        );
      },
    );
  }

  Widget _buildLoadedWigdet() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: _buildCharaterList(),
      ),
    );
  }

  Widget _buildBlocBuilder() {
    return BlocBuilder<CharctersCubit, CharctersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return _buildLoadedWigdet();
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: MyColor.myYellow,
            ),
          );
        }
      },
    );
  }

  Widget buildNoInternetWidget() {
    return Container(
      color: MyColor.myWhite,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
          height: 20,
        ),
        Image.asset('assets/image/testOnline.png'),
        const Text(
          "Can't connect ... check your internet",
          style: TextStyle(
            fontSize: 19,
            color: MyColor.myGrey,
          ),
        ),
      ]),
    );
  }
}

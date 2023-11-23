// ignore_for_file: must_be_immutable

import 'package:bolc_learn/constants/my_colors.dart';
import 'package:bolc_learn/data/models/charaters.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  Character character;
  CharacterDetailsScreen({required this.character, super.key});
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColor.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget charaterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: "$title : ",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColor.myWhite,
                fontSize: 18),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              fontSize: 16,
              color: MyColor.myWhite,
            ),
          )
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColor.myYellow,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    14,
                    14,
                    14,
                    0,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      charaterInfo("status", character.status),
                      buildDivider(260),
                      charaterInfo("gender", character.gender),
                      buildDivider(260),
                      charaterInfo("type",
                          character.type == "" ? "Char" : character.type),
                      buildDivider(275.0),
                      charaterInfo("species", character.species),
                      buildDivider(250.0),
                      charaterInfo("created", character.created.toString()),
                      buildDivider(250.0),

                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 600,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:bolc_learn/constants/my_colors.dart';
import 'package:bolc_learn/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:bolc_learn/data/models/charaters.dart';

@immutable
class CharacterItem extends StatelessWidget {
  Character character;
  CharacterItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColor.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, charactersdetailsScreen,
            arguments: character),
        child: GridTile(
          footer: Hero(
            tag: character.id,
            child: Container(
              alignment: Alignment.bottomCenter,
              color: Colors.black54,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(
                character.name,
                style: const TextStyle(
                  fontSize: 10,
                  height: 1.3,
                  color: MyColor.myWhite,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          child: Container(
            color: MyColor.myGrey,
            child: character.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: "assets/image/loading.gif",
                    image: character.image,
                    fit: BoxFit.fill,
                    height: double.infinity,
                    width: double.infinity,
                  )
                : Image.asset(
                    'assets/image/placeHolder.gif',
                    height: double.infinity,
                    width: double.infinity,
                  ),
          ),
        ),
      ),
    );
  }
}

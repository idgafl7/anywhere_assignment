import 'package:anywhere_realestate_assignment/app/features/character_list/models/characters_response/related_topic.dart';
import 'package:anywhere_realestate_assignment/app/features/character_list/widgets/character_tile.dart';
import 'package:flutter/material.dart';

//override search delegate to allow for custom search results
class CharacterSearchDelegate extends SearchDelegate {
  final List<RelatedTopic> characters;

  CharacterSearchDelegate(this.characters);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = characters
        .where((character) =>
            character.text?.toLowerCase().contains(query.toLowerCase()) ??
            false)
        .toList();

    return results.isNotEmpty
        ? ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return CharacterTile(
                character: results[index],
                fromSearch: true,
              );
            },
          )
        : const ListTile(
            title: Text("No results found"),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = characters
        .where((character) =>
            character.text?.toLowerCase().contains(query.toLowerCase()) ??
            false)
        .toList();

    return results.isNotEmpty
        ? ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return CharacterTile(
                character: results[index],
                fromSearch: true,
              );
            },
          )
        : const ListTile(
            title: Text("No results found"),
          );
  }
}

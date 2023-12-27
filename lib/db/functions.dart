import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:snaptune/db/model.dart';

addSong({required List<SongModel>song})async{
    final songDB=await Hive.openBox<MusicModel>('Song_Model');

    if(songDB.isEmpty){
      for(SongModel element in song){
          songDB.add(MusicModel(id: element.id, name: element.title, artist: element.artist.toString(), uri: element.uri.toString()));

      }
    }
    for(MusicModel element in songDB.values){
      print(element.artist);
    }

}

Future<List<MusicModel>>getAllSongs()async{
  final songDB=Hive.box<MusicModel>('Song_Model');
  return songDB.values.toList();
}

    
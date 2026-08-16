import 'package:flutter/material.dart';
import 'package:toktik/config/domain/entities/videos_post.dart';
import 'package:toktik/infraestructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {

  //TODO: Repository, DataSource

  List<VideoPost> videos = [];
  bool initialLoading = true;


  Future<void> loadNextPage() async {

    await Future.delayed(const Duration( seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map( 
      ( video ) => LocalVideoModel.fromJson(video).toVideoPostEntity()
      ).toList();

      videos.addAll( newVideos );
      initialLoading = false;
      notifyListeners();
    }

}

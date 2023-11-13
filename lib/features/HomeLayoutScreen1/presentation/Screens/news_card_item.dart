import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/features/HomeLayoutScreen1/data/models/NewsResponse.dart';

class NewsCardItem extends StatelessWidget {
  // const NewsCardItem({super.key});
  Articles articles;

  NewsCardItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), side: BorderSide.none),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: articles.urlToImage ?? "",
                  fit: BoxFit.cover,
                  height: 230,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    articles.title ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    articles.description ?? "",
                    style: TextStyle(fontSize: 11),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        articles.author ?? "",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 11),
                        maxLines: 1,
                      )),
                      Text(
                        articles.publishedAt?.substring(0, 10) ?? "",
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

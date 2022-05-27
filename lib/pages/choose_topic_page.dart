import 'package:demoapp/data/model/topic.model.dart';
import 'package:demoapp/data/topic_strorage.dart';
import 'package:demoapp/utils/theme.dart';
import 'package:demoapp/widgets/reponsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

final topicStrorage = AssetTopicStorage();

class ChooseTopicPage extends StatelessWidget {
  const ChooseTopicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ResponsiveBuilder(
              portrait: Column(
                children: [
                  const Flexible(flex: 1, fit: FlexFit.tight, child: _Header()),
                  Flexible(
                    flex: 3,
                    child: _TopicGrid(),
                  ),
                ],
              ),
              landscape: Row(
                children: [
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Column(
                        children: [
                          Expanded(child: _Header()),
                          Spacer(),
                        ],
                      )),
                  Flexible(
                    flex: 2,
                    child: _TopicGrid(),
                  ),
                ],
              ))),
    );
  }
}

class _TopicGrid extends StatelessWidget {
  const _TopicGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
        future: topicStrorage.Load(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final topics = snapshot.data!;
          ; // thu vien  flutter_staggered_grid_view
          return MasonryGridView.count(
            crossAxisCount: 2,
            itemCount: topics.length,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            itemBuilder: (context, index) {
              final topic = topics[index];
              return DecoratedBox(
                decoration: BoxDecoration(
                    color: topic.bgColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LayoutBuilder(builder: (context, Constraints) {
                      return SvgPicture.asset(
                        topic.thumbnail,
                        width: Constraints.maxWidth,
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        topics[index].title,
                        style: PrimaryFont.bold(
                                context.screenSize.shortestSide * 0.04)
                            .copyWith(color: topic.textColor),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
    FutureBuilder<List<Topic>>(
        future: topicStrorage.Load(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final topics = snapshot.data!;
          ; // thu vien  flutter_staggered_grid_view
          return MasonryGridView.count(
            crossAxisCount: 2,
            itemCount: topics.length,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            itemBuilder: (context, index) {
              final topic = topics[index];
              return DecoratedBox(
                decoration: BoxDecoration(
                    color: topic.bgColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LayoutBuilder(builder: (context, Constraints) {
                      return SvgPicture.asset(
                        topic.thumbnail,
                        width: Constraints.maxWidth,
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        topics[index].title,
                        style: PrimaryFont.bold(
                                context.screenSize.shortestSide * 0.04)
                            .copyWith(color: topic.textColor),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(
            flex: 3,
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'What bring you',
                      style: PrimaryFont.bold(28),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'to Silent Moon?',
                      style: PrimaryFont.light(28),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            flex: 1,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: Text(
                'choose a topic to focus on:',
                style: PrimaryFont.light(20)
                    .copyWith(color: const Color(0xFFA1A4B2)),
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_restaurant_app_example/app/app_colors.dart';
import 'package:flutter_restaurant_app_example/app/app_theme.dart';
import 'package:flutter_restaurant_app_example/constants/data/menu_items.dart';
import 'package:flutter_restaurant_app_example/models/menu_item.dart';
import 'package:flutter_restaurant_app_example/widgets/app_bar_search.dart';

// A Counter example implemented with riverpod

void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MenuItem> items = menuItems;

    Widget _imageScroller(BuildContext context) {
      return Container(
        color: Colors.black,
        height: 250,
        child: PageView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            MenuItem thisItem = items[index];
            String dishTypeText;
            switch (thisItem.type) {
              case DishType.smallDish:
                dishTypeText = 'Small Dish';
                break;
              case DishType.largeDish:
                dishTypeText = 'Large Dish';
                break;
              case DishType.none:
                dishTypeText = 'None';
                break;
              default:
                dishTypeText = 'None';
            }
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(thisItem.imagePath),
                    ),
                  ),
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(1),
                        Colors.black.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    thisItem.name,
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    dishTypeText,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
    }

    Widget _fourthReviewStar(
        {@required double rating, Color color, double size}) {
      if (rating < 3.5) {
        return Icon(Icons.star_outline, color: color, size: size);
      }
      if (rating >= 3.5 && rating < 4.0) {
        return Icon(Icons.star_half, color: color, size: size);
      }
      if (rating >= 4.0) {
        return Icon(Icons.star, color: color, size: size);
      }
      return SizedBox();
    }

    Widget _fifthReviewStar(
        {@required double rating, Color color, double size}) {
      if (rating <= 4.0) {
        return Icon(Icons.star_outline, color: color, size: size);
      }
      if (rating > 4.0 && rating <= 4.5) {
        return Icon(Icons.star_half, color: color, size: size);
      }
      if (rating > 4.5) {
        return Icon(Icons.star, color: color, size: size);
      }
      return SizedBox();
    }

    Widget _itemScrollCards(BuildContext context,
        {@required double offset, @required bool reversed}) {
      List<MenuItem> scrollItems = items;
      if (reversed) {
        scrollItems = items.reversed.toList();
      }
      return Container(
        height: 200,
        child: ListView.builder(
          controller: ScrollController(
            initialScrollOffset: offset,
            keepScrollOffset: true,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: scrollItems.length,
          itemBuilder: (BuildContext context, int index) {
            MenuItem thisItem = scrollItems[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: AppColors.lightAppBarPink,
              margin: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Container(
                constraints: BoxConstraints.expand(
                  height: 200,
                  width: 220,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 125,
                      decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: AssetImage(thisItem.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // child: Placeholder(),
                    ),
                    Container(
                      height: 75,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        constraints: BoxConstraints.expand(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(thisItem.name),
                            Row(
                              children: [
                                Text('${thisItem.rating}'),
                                Icon(
                                  Icons.star,
                                  color: AppColors.reviewStarRed,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.star,
                                  color: AppColors.reviewStarRed,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.star,
                                  color: AppColors.reviewStarRed,
                                  size: 18,
                                ),
                                // TODO try to combine these widgets into one star count widget
                                _fourthReviewStar(
                                  rating: thisItem.rating,
                                  color: AppColors.reviewStarRed,
                                  size: 18,
                                ),
                                _fifthReviewStar(
                                    rating: thisItem.rating,
                                    color: AppColors.reviewStarRed,
                                    size: 18),
                                Text('(${thisItem.numberOfReviews})'),
                                Text('\$${thisItem.price}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.bars),
          // TODO implement onPressed
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          'Fresh Food',
          style: Theme.of(context).textTheme.headline3,
        ),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.shoppingCart),
            // TODO implement onPressed
            onPressed: () {},
          ),
        ],
        bottom: AppBarSearchBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _imageScroller(context),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'Recommended',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: AppColors.darkGreyHeadlineColor),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              _itemScrollCards(context, offset: 400, reversed: false),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'Popular',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: AppColors.darkGreyHeadlineColor),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              _itemScrollCards(context, offset: 200, reversed: true),
              // Empty Space
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   // The read method is an utility to read a provider without listening to it
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

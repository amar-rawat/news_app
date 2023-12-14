import 'package:flutter/material.dart';
import 'package:news_app/themes/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        color: AppColors.canvasColor,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: AppColors.primarySwatchColor, width: 5)),
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CircleAvatar(
                          child: Image.asset(
                            'assets/images/profile_pic.jpg',
                            height: 100,
                            width: 100,
                            cacheHeight: 100,
                            cacheWidth: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.person),
                      Text('Amar Rawat'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.email),
                      Text(
                        'amarrawat244@gmail.com',
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.primarySwatchColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20)),
              height: 3,
              width: 200,
            ),
            ExpansionTile(
              title: Text(
                'Categories',
                style: TextStyle(fontSize: 15),
              ),
              leading: Icon(Icons.category_outlined),
            ),
            ExpansionTile(
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 15),
              ),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text(
                'About us',
                style: TextStyle(fontSize: 15),
              ),
              leading: Icon(Icons.info_outline),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            )
          ],
        ),
      ),
    );
  }
}

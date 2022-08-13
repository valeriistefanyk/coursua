import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '/styles.dart';

class HomeScreenNavBar extends StatelessWidget {
  const HomeScreenNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [AppShadows.lightShadown],
              ),
              child: const Icon(Icons.menu),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 33),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [AppShadows.lightShadown]),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    cursorColor: AppColors.primaryLabelColor,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: AppColors.primaryLabelColor,
                        size: 20,
                      ),
                      border: InputBorder.none,
                      hintText: "Пошук курсів",
                      hintStyle: AppTextStyles.searchTextStyle,
                    ),
                    onChanged: (text) {
                      if (kDebugMode) {
                        print(text);
                      }
                    },
                  ),
                ),
              ),
            ),
            const Icon(Icons.notifications),
            const SizedBox(width: 16),
            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/avatars/lion.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}

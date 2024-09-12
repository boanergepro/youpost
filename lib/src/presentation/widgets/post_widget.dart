import 'package:flutter/material.dart';
import 'package:youpost/src/domain/entities/post.dart';

class PostWidget extends StatelessWidget {
  final Post data;

  const PostWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
        border: Border.all(
          color: Colors.grey.withOpacity(
            0.2,
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(36, 30, 129, 1.0),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Text(
                        'Community',
                        style: TextStyle(
                            color: Color.fromRGBO(114, 110, 173, 1.0)),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  data.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  data.body,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Text(
                        'Read more',
                        style: TextStyle(
                          color: Color.fromRGBO(91, 133, 228, 1.0),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Color.fromRGBO(91, 133, 228, 1.0),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.17,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.atrapalo.com/houdinis/wp-content/uploads/2007/12/neonbrand-570373-unsplash.jpg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

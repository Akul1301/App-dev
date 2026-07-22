import 'package:flutter/material.dart';

void main() {
  runApp(const InstaProfile());
}

class InstaProfile extends StatelessWidget {
  const InstaProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'INSTAGRAM_PROFILE', 
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section Container with padding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. TOP ROW: Profile Image + Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Profile Picture
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, size: 45, color: Colors.white),
                      ),

                      // Stats Section spread evenly across remaining space
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            // Posts Column
                            Column(
                              children: [
                                Text("12", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Text("posts"),
                              ],
                            ),
                            // Followers Column
                            Column(
                              children: [
                                Text("1301", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Text("followers"),
                              ],
                            ),
                            // Following Column
                            Column(
                              children: [
                                Text("1301", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Text("following"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // 2. DESCRIPTION COLUMN (Bio details)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Akul Malik",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(height: 2),
                      Text("Software & AI Student 🚀"),
                      Text("Building cross-platform apps & tools."),
                      Text(
                        "github.com/akul1301",
                        style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // 3. BUTTONS ROW: Follow & Message
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text("Follow"),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text("Message", style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Divider(height: 1), // Divider before post grid

            // 4. HUGE SPACE FOR IMAGES (Instagram 3-Column Grid)
           Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(2),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Image.network(
                    'https://picsum.photos/500/500?random=$index', // Dynamic image URL for each index
                    fit: BoxFit.cover, // Ensures the image fills the grid square neatly
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
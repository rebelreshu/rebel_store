import 'package:flutter/material.dart';

void main() => runApp(RebelStoreApp());

class RebelApp {
  final String name;
  final String os;
  final String icon;
  final String size;
  final String desc;
  RebelApp(this.name, this.os, this.icon, this.size, this.desc);
}

class RebelStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rebel Store',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0A0A),
      ),
      home: StorePage(),
    );
  }
}

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<RebelApp> apps = [
    RebelApp(
      "Rebel Launcher",
      "REBEL OS",
      "🚀",
      "12 MB",
      "Fast & clean launcher",
    ),
    RebelApp(
      "Rebel Files",
      "REBEL OS",
      "📁",
      "8 MB",
      "File manager for Rebel OS",
    ),
    RebelApp(
      "Rebel Terminal",
      "LINUX",
      "💻",
      "15 MB",
      "Terminal for power users",
    ),
    RebelApp("Rebel Vault", "ANDROID", "🔒", "22 MB", "Secure app locker"),
    RebelApp("Rebel Cleaner", "ANDROID", "🧹", "9 MB", "Junk cleaner"),
    RebelApp("Rebel Icons", "THEME", "🎨", "45 MB", "2000+ icons pack"),
    RebelApp("Rebel Notes", "REBEL OS", "📝", "5 MB", "Encrypted notes"),
    RebelApp("Rebel Browser", "LINUX", "🌐", "28 MB", "Privacy browser"),
  ];

  Set<String> installed = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0A0A),
        title: Row(
          children: [
            Text(
              "REBEL",
              style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1),
            ),
            Text(
              " STORE",
              style: TextStyle(fontWeight: FontWeight.w300, letterSpacing: 1),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            margin: EdgeInsets.fromLTRB(16, 0, 16, 12),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.white38),
                SizedBox(width: 8),
                Text(
                  "Search apps, OS, tools...",
                  style: TextStyle(color: Colors.white38),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: apps.length,
        itemBuilder: (ctx, i) {
          final app = apps[i];
          bool isInstalled = installed.contains(app.name);
          return Container(
            margin: EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Color(0xFF141414),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.06)),
            ),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Color(0xFF222222),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(app.icon, style: TextStyle(fontSize: 28)),
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            app.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              app.os,
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Text(
                        app.desc,
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "${app.size} • FREE • OPEN SOURCE",
                        style: TextStyle(color: Colors.white24, fontSize: 10),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isInstalled
                        ? Color(0xFF1E1E1E)
                        : Colors.white,
                    foregroundColor: isInstalled
                        ? Colors.white54
                        : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    elevation: 0,
                  ),
                  onPressed: () {
                    setState(() {
                      if (isInstalled) {
                        installed.remove(app.name);
                      } else {
                        installed.add(app.name);
                      }
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isInstalled
                              ? "${app.name} uninstalled"
                              : "${app.name} installed! Ready to use",
                        ),
                        duration: Duration(milliseconds: 800),
                      ),
                    );
                  },
                  child: Text(
                    isInstalled ? "OPEN" : "GET",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

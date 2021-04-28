import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "For any query related to this app below are our contact accounts:",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(
                          5.0) //                 <--- border radius here
                      ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                'https://avatars.githubusercontent.com/u/64252391?v=4'),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tanishq Chandra",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("Flutter Developer"),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => _launchURL(
                                  'https://www.facebook.com/tanishq.chandra.54/'),
                              child: Image(
                                width: 50,
                                image: AssetImage('assets/icons/facebook.png'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _launchURL(
                                  'https://www.instagram.com/tanishq.chandra19/'),
                              child: Image(
                                width: 50,
                                image: AssetImage('assets/icons/instagram.png'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _launchURL(
                                  'https://twitter.com/Tanishqchandra9'),
                              child: Image(
                                width: 50,
                                image: AssetImage('assets/icons/twitter.png'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _launchURL(
                                  'https://tanishq-19.github.io/portfolio/'),
                              child: Image(
                                width: 50,
                                image: AssetImage('assets/icons/website.png'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(
                          5.0) //                 <--- border radius here
                      ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                'https://avatars.githubusercontent.com/u/51102185?v=4'),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Shantanu Soam",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("Flutter Developer"),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => _launchURL(
                                  'https://www.facebook.com/shantanu.soam.98'),
                              child: Image(
                                width: 50,
                                image: AssetImage('assets/icons/facebook.png'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _launchURL(
                                  'https://www.instagram.com/shantanusoam17/'),
                              child: Image(
                                width: 50,
                                image: AssetImage('assets/icons/instagram.png'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _launchURL(
                                  'https://twitter.com/SoamShantanu'),
                              child: Image(
                                width: 50,
                                image: AssetImage('assets/icons/twitter.png'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _launchURL(
                                  'https://shantanusoam.github.io/Portfolio/'),
                              child: Image(
                                width: 50,
                                image: AssetImage('assets/icons/website.png'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

import 'package:share_plus/share_plus.dart';

void shareApp() {
  const appLink = "https://your-ngos-website-or-playstore-link.com"; // Change this
  Share.share(
    "🌱 Join Helping Hands NGO and make a difference! \n\nDownload the app here: $appLink",
    subject: "Volunteer with Helping Hands NGO",
  );
}

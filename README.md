# flutter_nchuit

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Deploying

flutter clean
flutter pub get

flutter build web --base-href /nchuit_test_website/ --release

cd build/web (將build出來的web資料夾中的東西都放到網站用github)
git init
git add .    (此資料夾的全部東西)
git commit -m "Deploy" (這是commit訊息)
git remote add origin git@github.com:teddywang0824/nchuit_test_website.git (跟目標做連結)
git branch -M main
git push -u --force origin main

cd ../..
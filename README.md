# NITK_Virtual_Guide

This is a flutter application which is a virtual guide of NITK.

### Task ID: NITK_Virtual_Guide

### The apk file is in the "apk file" folder.

## Getting Started

The application starts off with a introduction section where the user gets to know what the apllication does or what information is present in the app. The user if not interested can skip the introduction section.

### Theme :

The application has two themes : 1)light theme 2) dark theme
The application starts of with a light theme but the user can change it accordingly.

### Packages used :

[bloc: ^6.0.3](https://pub.dev/packages/bloc)

[flutter_bloc: ^6.0.5](https://pub.dev/packages/flutter_bloc)

[cloud_firestore: ^0.14.0+2](https://pub.dev/packages/cloud_firestore)

[firebase_core: ^0.5.0](https://pub.dev/packages/firebase_core)

[url_launcher: ^5.7.2](https://pub.dev/packages/url_launcher) Is used to take the user to the NITK official website.

### Modules :

After the introduction section is the main screen where there is three sections,
#### 1) News
#### 2) Events
#### 3) Mess

In the news section we have the latest news of NITK from it's official website. Each of the news tile has a launch icon using which the user can visit the NITK website's news page and get more details about the particular news.

In the events section we have the ongoing and upcoming events of NITK from it's official website. Just as the news section the events section also has a launch icon using which they can visit the official website and get more information about the events.

In the mess section theres is 2 options Mess1(vegetarian) and Mess2(non-vegetarian), the user can select any option which will take the user to the mess page where the user can see the dialy menu of that particular mess. 

### State :

State management is done using Bloc pattern.

### Strorage :

All the information i.e., news, events and mess details is stored in firestore.




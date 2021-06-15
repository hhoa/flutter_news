# flutter_news

Reading news application made with Flutter

## Getting Started

This project is a starting point for a Flutter application.

### Prerequisites

You need to install Flutter to run this project

### Version

Android Studio: 4.2.1

Flutter: v2.2.1

### Installing

You can clone or download this project from Github

Go to project folder then run command to install necessary packages
```
flutter pub get
```

This project can be run on Android, iOS, Web.

## Features

Users can signup or login to this project

Users can view all headlines or choose specific category based on user preferences.

## Library

This project use Getx for managing state.

Use GetConnect for calling API.

Use GetStorage for local storage.

Use JsonSerializable to parse json from api

## Structure

In `modules` folder, I split into multiple folders with separate tasks

`splash`: splash screen + handle logic if user is logged in before.

`authentication`: login + signup page

`main`: Home screen with 3 tabs (For you tab, Headlines tab, Account tab)

In `language` folder: 

I use `localization service` to handle localization if user can change their language in future.

I use `StringManager` to summarize all strings use in app for changing language purpose.


## Demo

Below is google drive video demo features for this project
[Video Demo](https://drive.google.com/file/d/160zTI3P8Gp-vQev7kx_X4DDxMFwNEUym/view?usp=sharing)
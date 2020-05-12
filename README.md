# Find Me A Gift!

Well, here we go with the first attempt at an app that I intend
to finish in some sort of describable time frame.

## Disclaimer

I just put this up for fun and to share what I though was a cool project with the world.  Ive managed
to crash the emulator using this (albeit at an earlier build) but be warned, might not be the most
stable.

## Build

This can be pulled and built in Android Studio with the Flutter framework.

I am using a Google Nexus 2 running Android 9 as an emulator for this project.

## Basic Idea of the App

As a certified poor gift giver, I know from experience that it's not always easy to find a gift for
someone.  This app aims to be a visual suggester of gifts and make the process easier for people.

## How It Works

A user will select a receipt from a grouping of 8 types.  They will then be asked to enter three
parameters: an age, price min and price max.

With that information, the app makes an API call (currently implementing) to get products based on
keywords the user tapped on. The results of the call are displayed as cards which a user can
swipe left on to say no and right to say yes.

After the user has gone through the list (or at any point of going through it), they can view a list
of their matches and follow the link to purchase it online.

## Notes

Currently, this wont run as pulled.  I noticed a copyright issue on the images in the last round of
grabbing them - website said they were free but unsure now.  I have them sitting on my .gitignore for
now.  I only use hardcoded images on the first and second screens in my app loop, not hard to switch
out or ignore for someone who wants to spin this up.



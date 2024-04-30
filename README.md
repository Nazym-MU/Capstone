# Kettk

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

Kettk is an event platform where users can discover and create events based in Kazakhstan's two largest cities: Almaty and Astana.

### App Evaluation

- **Category:** Social
- **Mobile:** Experience includes geolocation, push notifications, and real-time updates
- **Story:** People are always looking for events to attend and there's no such an app in Almaty or Kazakhstan. These are only published on Instagram or websites and are inconvenient to use.
- **Market:** Youth (16-25 years old) in Almaty and Astana.
- **Habit:** Twice a week. They consume the content but verified accounts can also regularly create content to publish events.
- **Scope:** The app is challenging but interesting to build.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can create a new account
* User can login
* User can view a feed of events in their city
* User can see the event in detail
* User can follow/unfollow accounts that post events
* User can filter the events based on location and categories
* User can search for events
* User can add events to favorites list
* User can follow the link to registration pages for each event

**Optional Nice-to-have Stories**

* Businesses and organizations can sign up to post events
* Users can see trending eventsfill in your required user stories here]

### 2. Screen Archetypes

- [ ] Login Screen
* User can login
- [ ] Registration Screen
* User can create a new account
- [ ] Feed
* User can view a feed of events in their city
* User can search for events
- [ ] Favorites Screen
* User can see the event in detail
* User can follow/unfollow accounts that post events
* User can add events to favorites list
* User can follow the link to registration pages for each event
- [ ] Event Screen
* User can see the event in detail
* User can follow/unfollow accounts that post events
* User can add events to favorites list
* User can follow the link to registration pages for each event
- [ ] Settings Screen
* User can change the settings and see the favorites list

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Feed
* Favorites List
* Settings Screen

**Flow Navigation** (Screen to Screen)

- [ ] Login Screen
* => Feed
- [ ] Registration Screen
* => Feed
- [ ] Feed
* => Event Screen

## Wireframes

### Digital Wireframes & Mockups

[Figma][https://www.figma.com/file/JLbrEfCeGTtgbVwcjvR37I/Storyboard?type=design&node-id=52%3A3&mode=design&t=WQIhEnVfaKGfyGkI-1]

## Sprints

- **Sprint 1 (Completed):** Create the main screens and add relationships between the screens
- **Sprint 2 (Completed):** Display the list of events on the home screen using a table view. Add functionality to allow users to add events to their favorites list. Implement local data persistence to store user favorites locally on the device.
- **Sprint 3 (Completed):** Create a settings screen for the users to change the necessary settings in the app.

## Models

Video Walkthrough: [YouTube][https://youtu.be/bsBkKVeTNKU] 

## Schema 

### Networking

- For now, the app shows mock data because there is no API or database with events in Almaty, but I created a new Firebase database and connected it to the app, and will be filling out the database manually.

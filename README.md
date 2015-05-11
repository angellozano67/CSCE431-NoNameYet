# CSCE431-NoNameYet

Brazos Valley Center For Assisted Living Project

Pivotal Tracker can be found here: https://www.pivotaltracker.com/n/projects/1296268

**In order to add a primary key using PostgreSQL Studio, set data type to Serial, then edit Constraints.**

To enable reservations:
Create console.developer.google.com project
Enable Calendar APIs and Google+ APIs
Create credentials for:
    OAuth (Web Project): set redirect uri http://<site-url>/auth/google_oauth2/callback
    Public API access: Referrers = http://<site-url>/*
    Create google calendar for reservations (or use existing), set to public, get the url (need to update these in code)
Go to http://<site-url>/newauth and authorize the site for the calendar
Copy the .env.example file to .env and fill in the appropriate information
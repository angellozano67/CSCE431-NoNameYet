# CSCE431-NoNameYet

Brazos Valley Center For Assisted Living Project

Pivotal Tracker can be found here: https://www.pivotaltracker.com/n/projects/1296268

**In order to add a primary key using PostgreSQL Studio, set data type to Serial, then edit Constraints.**

For Production:
# Create/Determine a Google account to manage the calendar
# Create a new calendar or choose an existing one to use
# Follow the instructions found http://fullcalendar.io/docs/google_calendar/ to create a new API key and set the calendar to public
## Take note of the API key you create, and make sure "Referrers" field is set to the url of your application
# In the same section (Credentials) create a new OAuth Client ID for a web application
## Set the JavaScript origins to: <site url>
## Set the Authorized redirect URIs to: <site url>/auth/google_oauth2/callback
## Once the key is created take note of the Client ID and Client Secret
# On the Heroku admin panel for the rails instance, go to the Settings page, and click to edit the Config Varieables, and add the following:
## Production
### CLIENT_ID     | OAuth Client ID (from step 4)
### CLIENT_SECRET | OAuth Client Secret (from step 4)
### GCAL_API_KEY  | Public API Access API key (from step 3)
### GCAL_URL      | Public Google Calender ID (from step 3)
### ROOT_URL      | Root url of the site with no trailing slash, ex: http://example.com
## Development
### Create a file in the root of the project named .env and add the following lines to it (replace xxx with actual value):
#### CLIENT_ID=xxx
#### CLIENT_SECRET=xxx
#### GCAL_API_KEY=xxx
#### GCAL_URL=xxx
#### ROOT_URL=xxx
# Once environment variables set navigate to: <site url>/newauth
## Authenticate with the google account that owns the calendar and you used to make the developer credentials in earlier steps
# The reservation system should now work
******* AstroCLI ********

To use astroCLI, you will need to sign up for an astrology API key here:
https://astrologyapi.com/docs/

Create a file in the lib/ folder called 'application.rb' Put the API Key and User ID in your environment file as "API_KEY" and "USER_ID"

Next, you will need to run ' $ bundle install ' and make sure all gems are installed properly.

Then you will need to execute the migrations by running the following command
$ rake:db migrate

Now you can run the program by running ' $ ruby bin/run.rb '

Enjoy!

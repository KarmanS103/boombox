Final Project Written Report Who was on your team? Our team was made
up of Karman Singh and Xiao Tao. 

What’s the URL of your deployed app? 
http://boombox2.4550xiaotao.art/ 

What’s the URL of your github repository with the code for your
    deployed app? https://github.com/KarmanS103/boombox 

Is your app deployed and working? Yes, for the most part we were able
    to complete all of the features we set out to build for this
    application. However, one piece we weren’t able to do was update
    leaderboard counts in real-time as users decided they wanted to
    follow artists. 

For each team member, what work did that person do on the project?
    Karman Singh: Set up the leaderboard, the database, and the lyric
    generation page Xiao Tao: Completed the user feed and
    login/registration of users

What does your project 2 app do? Our project is intended to be the
    beginnings of a social media website centered around music. Users
    can login or register for an account, and then select artists to
    follow. Once an artist is followed, the user’s feed populates with
    information pertaining to each artist that they follow, such as,
    history of albums. Additionally, there is a leaderboard that keeps
    track of how many followers each artist has. Outside of just
    tracking artists and their projects, users can also click on the
    “generator” button at the top of the page and actually generate
    new lyrics based on the projects of their favorite artists. 

How has your app concept changed since the proposal? Originally, we
anticipated adding much more functionality to the app than we
currently have, but we ended up not having enough time to do so. One
of the things we changed was the “friends” feature which allowed users
to friend other users and both users would have the followed artists
of each other on their own feeds. Unfortunately, this took too much
time to implement, and we weren’t able to do so by the due date.
Another feature we changed was the ability for users to specify which
album they wanted to generate lyrics based off of. After doing more
research with the API, we realized it would be very difficult to pull
the data we needed at the granularity required to complete this task. 

How do users interact with your application? What can they accomplish
    by doing so? The primary means of interacting with our application
    is via the navigation bar at the top of the screen. The leftmost
    link allows users to view the leaderboard and see which artists
    currently have the most followers. The link to the right of that
    one is the user feed where users can view which artists, they are
    following as well as the feed of which artists have dropped new
    pieces of work most recently. Finally, the third link is to the
    generator page which allows users to generate new lyrics based off
    of the chosen artist. The last two links at the right side of the
    nav bar allow users to login and register for the application. 

For each project requirement above, how does your app meet that
    requirement? Looking at the requirements above, our application
    meets just about all of requirements for the project. Our
    application is split into a backend with Elixir which sends and
    receives JSON data associated with artists as well as users. Our
    front-end is made entirely with React and we currently have it
    deployed as a static site. The project itself is also deployed on
    our VPS with API calls for the MusixMatch API being made by both
    Elixir and React. Additionally, we securely store user accounts
    using the Argon2 plug in Elixir along with artist information and
    relationships between users and artists (“followers”) in our
    Postgres database. Our application also does something neat in the
    form of lyrics generation based on an artist inputted by the user.
    The only requirement we haven’t fulfilled is that of the
    incorporating Phoenix channels to push real-time data to users. We
    had initially tried to keep the leaderboard up to date in real
    time using channels; however, we weren’t able to get the channel
    connection to work in the front end, so we had to switch over to
    the traditional GET/POST methods for getting the leaderboard data.
    

What interesting stuff does your app include beyond the project
    requirements? The interesting thing that we included was the
    lyrics generation for users. They simply have to type in an artist
    and the number of lyrics they want to generate, and lyrics are
    then automatically generated. 

What’s the complex part of your app? How did you design that component
    and why? The lyrics generator was one of the more complicated
    parts to work out as we had to pull together many pieces of data
    from various asynchronous API calls which slowed down the process
    significantly. Ultimately, we had to cap the number of lyrics that
    users could generate and then also limit the number of songs that
    we were training lyrics off of. Additionally, we had to figure out
    how to actually generate lyrics as there is no set formula for
    doing so (it’s difficult to incorporate rhyming, syllables, etc.).
    We ended up just going with a rule-based approach of 5 words per
    lyric based on a language model of all words in the artist’s most
    recent album. 

What was the most significant challenge you encountered and how did
    you solve it? One of the biggest challenges we faced was designing
    the structure of our database since we had a number of many to
    many relationships associated between users. Originally, we were
    going to have artists be users (like any other user) as we wanted
    artists to be able to add themselves to our database. This caused
    the problem of having a many to many relationship in the followers
    table which also caused problems in differentiating who the
    artists were. We actually ended up having all of the users be
    accidentally added to the leaderboard. Ultimately, we solved this
    by switching the usability for artists from “artist” to “user” in
    the sense that artists would be perceived as users for the
    application’s purposes. This allowed us to create a special,
    separate table dedicated solely to keeping track of artists.
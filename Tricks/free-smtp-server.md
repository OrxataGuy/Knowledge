# Using GMAIL as a SMTP Server
_For free_

Are you making tests on your application and you want to send emails, but you haven't any SMTP server available (And you don't want to purchase any subscription to a SMTP server provider)? Don't worry, **you can use your gmail account to send emails via SMTP**. 

This is what you have to do:

1. First of all, you must enable the two-step authentication on your Google account (the account that will be used to send the emails).  `(Settings -> Security -> Signing in to Google)`
2. Once you have enabled the two-step authentication, you'll be able to create **App passwords**. This is what you'll use to authenticate your Google account in your app. Here you'll be able to select a resource (email, calendar, contacts...), and a select the device where you want to use the password. In this case, you can select "Other" and set the name of your app.
3. Now, the password generator will gave you your app password. It's time to configure the SMTP connection.
4. This is the params you have to set:
```
DRIVER: smtp
HOST: smtp.gmail.com
PORT: 465
USERNAME: <Your email address>
PASSWORD: <Your app password>
ENCRYPTION: ssl
```
5. After this step, you will be able to connect to the Google SMTP server and send your emails for free!
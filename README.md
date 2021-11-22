# Contact importer 

Contact importer is a Rails app where you can import your list of contacts from a csv file.

## Features

### Import contacts

Presents a form where you can adapt the system to the fields that you use in your CSV files and upload the file. As default, the fields in the database are name, date_of_birth, phone, address, credit_card, email.

### List contacts

Show The list of imported contacts from your uploaded CSVs files.

### List CSV files.

Show a list of all the CSVs files that you have uploaded to the app, the uploaded data, and their status in the system (on hold, processing, failed, finished)

### List of failed imported contacts.

Show a list of all contacts that have failed to be uploaded, the content of their field, and the error that cause the failure.

### Background Jobs

Implement background jobs via sidekiq and redis

## Developed with

Ruby 3.0

Rails 6.1.4.1

pg 1.1

Sidekiq

Bootstrap 5

bucket S3

## Installation.

```sh
git clone https://github.com/vrlls/contact_importer.git
```

### Or

Use the web application deployed in Heroku

https://sebas-contact-importer.herokuapp.com/

## Run the app

### For local:

```sh
cd contact_importer
```

If its the first time you run the app:

```sh
rake db:migrate
```

2. inside the proyect run and in a new terminal
```sh
 sidekiq
```

4. Open a new terminal and run
```sh
 redis-server
```
6. Run
```sh
 rails s
```

If you open the app in the browser

1. Run redis-server in your local at port 6379

```sh
 redis-server
```

## User manual.

To use the app you have to create a user account with your email and password, then you can log in.

The first view is the list of your contacts. In this view, you can see your contacts and have the options to import more contacts, see the list of uploaded files and the list of failed contacts.

In the import view you can see a form where each field is the way you name each field of your Contact list, as default the form have values, if some of your fields are similar don't change the value, and then select the file from your computer and press submit.

The Contact fields view shows you the list of all the files you have uploaded to the app and their status in the system.

The contact logs view shows the list of contacts that failed to be created and the reason why they failed. Take advantage of this view to make corrections to your records.

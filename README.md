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

From the master branch
```sh
git clone https://github.com/vrlls/contact_importer.git
```

```sh
git pull origin master
```

### Or

Use the web application deployed in Heroku

https://sebas-contact-importer.herokuapp.com/

## Run the app

### For local:

1. Move to the proyect
```sh
cd contact_importer
```

If its the first time you run the app:

```sh
rake db:migrate
```

2. Open a new terminal and run
```sh
 redis-server
```

3. inside the proyect run and in a new terminal
```sh
 sidekiq
```


6. Run
```sh
 rails s
```

### If you open the app in the browser

You can view the processing background job at 

https://sebas-contact-importer.herokuapp.com/sidekiq

User: sidekiq
Password: sidekiq

## For the evaluator

email: trainer@koombea.com
password: 123456

In the root of the project there is a test-file folder with 3 csv documents. prueba.csv which generates successful and failed contacts, prueba_empty.csv which is an empty file with only the headers and prueba_fail_all.csv which contains records that will fail completely.

## User manual.

To use the app you have to create a user account with your email and password, then you can log in.

![image](https://user-images.githubusercontent.com/30907860/142869257-d254542c-cea8-42e9-a7c8-a96042df42d3.png)


The first view is the list of your contacts. In this view, you can see your contacts and have the options to import more contacts, see the list of uploaded files and the list of failed contacts.

![image](https://user-images.githubusercontent.com/30907860/142869357-c29307c2-c596-482b-8a10-1dcf2ee0e7ac.png)

In the import view you can see a form where each field is the way you name each field of your contact list, modify them to match, by default the form has values, if some of your fields are similar don't change the value, and then select the file from your computer and press send.

![image](https://user-images.githubusercontent.com/30907860/142869420-c3ed4ba0-7916-4eea-87cb-545565a9321e.png)


The Contact fields view shows you the list of all the files you have uploaded to the app and their status in the system.

![image](https://user-images.githubusercontent.com/30907860/142869481-a69baaf7-ea9a-408c-80fd-c13142adf43b.png)

The contact logs view shows the list of contacts that failed to be created and the reason why they failed. Take advantage of this view to make corrections to your records.

![image](https://user-images.githubusercontent.com/30907860/142869569-2ec4851c-1d24-4121-b688-49a95b33b679.png)

=======
# This is not the final and stable version

The branch where everything was developed is the master branch, there you will find the Readme adn the complete program.

https://github.com/vrlls/contact_importer/tree/master

# enma

Registration system that uses Github Login and sets up a Github organization for a collection of courses.


### Ruby version: 2.1.4

### System dependencies

  postgres: `sudo apt-get install postgresql libpq-dev`

### Configuration

  Github credentials, app secret.

### Database creation

  ```
  sudo -u postgres psql
  create user "enma" with password 'kaiosama';
  create database "enma_development" owner "enma";
  ```

### Database initialization

### How to run the test suite

### Deployment instructions

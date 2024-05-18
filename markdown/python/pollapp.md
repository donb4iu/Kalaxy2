# Python Polling App

## References

-   [https://github.com/donb4iu/pollapp](https://github.com/donb4iu/pollapp)
-   [Writing your first Django app](https://docs.djangoproject.com/en/5.0/intro/tutorial01/)

## Setup

### Project and pages
```
django-admin startproject mysite

mysite/
    manage.py
    mysite/
        __init__.py
        settings.py
        urls.py
        asgi.py
        wsgi.py
```
In the polls/urls.py file include the following code:

```
from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
]
```
In mysite/urls.py

```
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path("polls/", include("polls.urls")),
    path("admin/", admin.site.urls),
]
```
### Run project and pages

#### #( 05/17/24@10:18PM )( donbuddenbaum@donbs-imac ):~/Documents/pollapp/mysite@main✗✗✗
    
    python manage.py runserver

```
Watching for file changes with StatReloader
Performing system checks...

System check identified no issues (0 silenced).

You have 18 unapplied migration(s). Your project may not work properly until you apply the migrations for app(s): admin, auth, contenttypes, sessions.
Run 'python manage.py migrate' to apply them.
May 18, 2024 - 02:18:44
Django version 5.0.4, using settings 'mysite.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CONTROL-C.

Not Found: /
[18/May/2024 02:19:08] "GET / HTTP/1.1" 404 2165
Not Found: /po//s
[18/May/2024 02:19:57] "GET /po//s HTTP/1.1" 404 2198
[18/May/2024 02:20:09] "GET /polls HTTP/1.1" 301 0
[18/May/2024 02:20:09] "GET /polls/ HTTP/1.1" 200 40
```

### Setup database

####  Edit the polls/models.py file so it looks like this:


```
from django.db import models


class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField("date published")


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)
```
#### Edit the mysite/settings.py file

```
INSTALLED_APPS = [
    "polls.apps.PollsConfig",
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
]
```
#### include the polls app in database tables
##### (3.12.0-venv) #( 05/17/24@11:49PM )( donbuddenbaum@donbs-imac ):~/Documents/pollapp/mysite@main✗✗✗
   python manage.py makemigrations polls

```
Migrations for 'polls':
  polls/migrations/0001_initial.py
    - Create model Question
    - Create model Choice
```
#### run the migrations and manage database schema automatically
##### (3.12.0-venv) #( 05/17/24@11:49PM )( donbuddenbaum@donbs-imac ):~/Documents/pollapp/mysite@main✗✗✗
   python manage.py sqlmigrate polls 0001

```
BEGIN;
--
-- Create model Question
--
CREATE TABLE "polls_question" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "question_text" varchar(200) NOT NULL, "pub_date" datetime NOT NULL);
--
-- Create model Choice
--
CREATE TABLE "polls_choice" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "choice_text" varchar(200) NOT NULL, "votes" integer NOT NULL, "question_id" bigint NOT NULL REFERENCES "polls_question" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE INDEX "polls_choice_question_id_c5b4b260" ON "polls_choice" ("question_id");
COMMIT;
```
#### create those model tables in database:
##### (3.12.0-venv) #( 05/17/24@11:51PM )( donbuddenbaum@donbs-imac ):~/Documents/pollapp/mysite@main✗✗✗
   python manage.py migrate

```
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, polls, sessions
Running migrations:
  Applying polls.0001_initial... OK
```

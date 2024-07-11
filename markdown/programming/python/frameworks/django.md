# Django

## References

-   [How to install Django](https://docs.djangoproject.com/en/5.0/topics/install/#how-to-install-django)
-   [Writing your first Django app](https://docs.djangoproject.com/en/5.0/intro/tutorial01/)
-   [Introducing automated testing](https://docs.djangoproject.com/en/5.0/intro/tutorial05/)

## Django Commands

**Command Cheatsheet**


```
Command	Description
. python -m venv (name_of_venv)	                Creates a virtual environment
. source (venv)/bin/activate	                Activates a virtual environment
. django-admin startproject (project_name)	    Starts a Django project
, django-admin startproject (project_name) .	Sets up a project in the same directory
. python manage.py runserver                	Runs the Django server
. python manage.py startapp (app_name)	        Creates a Django app
```

## Setup

check routes in **urls.py**
### #( 05/17/24@10:18PM )( donbuddenbaum@donbs-imac ):~/Documents/pollapp/mysite@main✗✗✗
python manage.py runserver

```Watching for file changes with StatReloader
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

Setup Database tables for installed apps
### #( 05/17/24@11:11PM )( donbuddenbaum@donbs-imac ):~/Documents/pollapp/mysite@main✗✗✗
python manage.py migrate

```
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, sessions
Running migrations:
  Applying contenttypes.0001_initial... OK
  Applying auth.0001_initial... OK
  Applying admin.0001_initial... OK
  Applying admin.0002_logentry_remove_auto_add... OK
  Applying admin.0003_logentry_add_action_flag_choices... OK
  Applying contenttypes.0002_remove_content_type_name... OK
  Applying auth.0002_alter_permission_name_max_length... OK
  Applying auth.0003_alter_user_email_max_length... OK
  Applying auth.0004_alter_user_username_opts... OK
  Applying auth.0005_alter_user_last_login_null... OK
  Applying auth.0006_require_contenttypes_0002... OK
  Applying auth.0007_alter_validators_add_error_messages... OK
  Applying auth.0008_alter_user_username_max_length... OK
  Applying auth.0009_alter_user_last_name_max_length... OK
  Applying auth.0010_alter_group_name_max_length... OK
  Applying auth.0011_update_proxy_permissions... OK
  Applying auth.0012_alter_user_first_name_max_length... OK
  Applying sessions.0001_initial... OK
  ```

###  Super User
#### (3.12.0-venv) #( 05/18/24@12:29AM )( donbuddenbaum@donbs-imac ):~/Documents/pollapp/mysite@main✗✗✗
   python manage.py createsuperuser

```
Username (leave blank to use 'donbuddenbaum'): admin
Email address: dbuddenbaum@gmail.com
Password:
Password (again):
Superuser created successfully.
```

### Database

[database model and migration (pollapp)](../pollapp.md#setup-database)

## Testing

### (3.12.0-venv) #( 05/18/24@ 2:55AM )( donbuddenbaum@donbs-imac ):~/Documents/pollapp/mysite@main✗✗✗
   python manage.py test polls

```
Found 1 test(s).
Creating test database for alias 'default'...
System check identified no issues (0 silenced).
F
======================================================================
FAIL: test_was_published_recently_with_future_question (polls.tests.QuestionModelTests.test_was_published_recently_with_future_question)
was_published_recently() returns False for questions whose pub_date
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/donbuddenbaum/Documents/pollapp/mysite/polls/tests.py", line 19, in test_was_published_recently_with_future_question
    self.assertIs(future_question.was_published_recently(), False)
AssertionError: True is not False

----------------------------------------------------------------------
Ran 1 test in 0.002s

FAILED (failures=1)
Destroying test database for alias 'default'...
```
# Web-interface to a panchayat Databse 

## Primary Setup
Documentation Contains step we have followed in this project 
1. start a new django project with name GPMS 
```
django-admin startproject GPMS
``` 
* this creates  
GPMS
 |
 |--GPMS
 |
 |--manage.py

2. created a app inside this project with name 'firstapp'
```
python3 manage.py startapp firstapp
```
* now the project looke like 
GPMS
 |
 |--GPMS
 |--firstapp
 |--manage.py

3. Connecting the urls.py of firstapp to outer GPMS using include 
```
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('firstapp.urls'))
]
```
4.adding the firstapp to INSTALLED_APPS list in settings.py of GPMS 
```

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'firstapp',
]
```
5. run a development server
```
python3 manage.py runserver
```
---
## Project Raodmap
- Design of database according to requirement
- noting all the mandatory functionalities to implement from ps
- estimating how many pages required and design of those pages 

### Execution
planned to execute the psql command in the django views to retrieve and update the database  so we have written a `get_db_connection( )` function to connect to the psql database  
as a backend django 




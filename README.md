#### Migrated from [backend](https://github.com/ben-ying/backend) project.

#### Python3.5.3 
#### Django 2.0.2
#### Raspbian install postsql
* sudo apt-get install postgresql-9.6 postgresql-server-dev-9.6
* vi /etc/postgresql/9.6/main/pg_hba.conf
>* (Change all authentication mechanisms from ident to md5)
* /etc/init.d/postgresql reload
* sudo su - postgres
>* psql
>>* create user piconga with password 'piconga';
>>* create database piconga owner=piconga;
>>* \q
>* exit
* sudo apt-get install python-psycopg2
#### Raspbian install Apache
* sudo apt-get install apache2 libapache2-mod-wsgi

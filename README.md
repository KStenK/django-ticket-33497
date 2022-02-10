## Steps I took to generate the Django project

1. Made a new project by command `django-admin startproject django_33497`.
2. Set `Debug = False` in settings.py.
3. Set `ALLOWED_HOSTS = ["*"]` in settings.py.
4. Updated django database settings in settings.py file, to use local Postgres database and set `CONN_MAX_AGE` to `3600`.
5. Added `STATIC_ROOT = BASE_DIR / 'static'` in settings.py.

## Setup project using docker-compose

1. In the root project directory use the `docker-compose up` command to spin up services.
2. Navigate to `http://localhost/admin/` and log in with superuser (Username & password is **django**).
3. Connect to Postgres database.

Database credentials:  
Name: django  
Host: localhost  
Port: 5432  
User: django  
Password: django

Connect with **psql** command:
`psql -h localhost -p 5432 -d django -U django`

To see active database connections, query command `SELECT * FROM pg_stat_activity WHERE datname='django';`.

### Surf around the admin site or refresh multiple times on the Users list page for example, so you can see new idle database connections coming up.

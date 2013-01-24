# Freevent

CFML powered, free, open source, event schedule management and mobile schedule. Easy to customize to your liking.

Should be easy to port to MSSQL, but for now it only comes with a MySQL schema setup script.

The only place that has any mysql-specific coding is the query on the mobile schedule page.

## Installing

1. The script will create its own database.
   1. Edit `install/mysql.sql`, change the name of the database to whatever you want it to be on both lines 1 and 2
   1. Run this command at the command line: `mysql -u YOUR_USERNAME -p < install/mysql.sql`
   1. When prompted, enter your MySQL password
1. Add a CF Datasource for your newly created database
1. Update `admin/Application.cfc` **line 5** and `/Application.cfc` **line 4** with the new datasource name
1. Find the Freevent admin at `http://{freevent-install-dir}/admin/`
   1. The default account username is `admin` with password `admin`. I recommend you change the password. Create as many additional user accounts as you need.
1. Find the mobile schedule view at `http://{freevent-install-dir}/`
1. Profit.

## Screenshots

The mobile schedule looks like this. The colors for tracks and session content background are easily edited in admin.

![](https://www.evernote.com/shard/s240/sh/1d5976ab-b74c-4ad4-8240-50da2c333885/1863e83b35797f621467c57437ff24ff/res/13481158-3170-4d04-b12d-afbc38446828/skitch.png)

Admin:

![](https://www.evernote.com/shard/s240/sh/888750e1-cf50-4da7-abb9-08ff683014c8/3081206d58d3959d2afd5eef598f9dc2/res/07e77d7a-6fa3-491a-bab9-051643a569ef/skitch.png)
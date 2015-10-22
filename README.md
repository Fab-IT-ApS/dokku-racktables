# Racktables dokku deployment

## Prerequisites

This project requires a database plugin for dokku. The developement is
done using the `mariadb` plugin.

Before proceding, you must create a database with mariadb as:

```bash
dokku mariadb:create
```

## Installation with dokku

To deploy a Racktables installation on dokku, a database is needed. You
can either work off of a new database, or restore an existing database
to your installation.

If you are doing a clean install you should add the empty database that
is included in this repository with:

```bash
dokku mariadb:restore < empty.sql
```

This version is empty and has credentials:

 - Username: admin
 - Password: racktables

If you already have a database, please add it as shown above with the
empty database.

Finally, push your application to your dokku master, eg.:

```bash
git push dokku master
```

, given that your dokku remote is called dokku.

### Installation with clean Docker (untested)
If you are installing using only docker you need to maintain a database
seperately from this instance, how you choose to do this is up to you.

In addition you need to add the following environment variable to your
docker instance:

```bash
DB_HOST="" # IP-address of database host
DB_NAME="" # Name of Racktables database
DB_PORT="" # Database host access port (usually 3306)
DB_USER="" # Database access user
DB_PASS="" # Database access password
```

Please note that is untested, and any feedback on this would be much
appreciated!

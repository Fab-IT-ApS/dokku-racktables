# Racktables dokku deployment

## Prerequisites

This project requires a database plugin for dokku. The developement is
done using the `mariadb` plugin.

Before proceding, you must create a database with mariadb as:

```bash
dokku mariadb:create
```

## Installation

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

# Replication

## CONFIGURATION

Local machine: Ubuntu 24.04.02
Local `mysql --version`: "mysql  Ver 8.0.42-0ubuntu0.24.04.2 for Linux on x86_64 ((Ubuntu))"

Docker image: `ubuntu:24.04`
Docker `mysql --version`: "mysql  Ver 8.0.42-0ubuntu0.24.04.2 for Linux on x86_64 ((Ubuntu))"

## SETUP

### Create network for Docker images

```
docker network create rep-diesel-mysql-error-nw
```

### Start the MySQL instance

```
docker run -d \
  --name mysql-container \
  -e MYSQL_ROOT_PASSWORD=supersecret \
  -p 3306:3306 \
  --network rep-diesel-mysql-error-nw \
  mysql:8.0
```

### Create the test DB and load the test data

```
mysql -h 0.0.0.0 -u root -psupersecret < create-db.sql
```

## LOCALLY

### Run the app

```
RUST_LOG=debug cargo run
```

NOTE: This generates the panic.

## CONTAINERISED

### Build the Docker image
```
docker build -t rep-diesel-mysql-error .
```

### Run the example

```
docker run --network rep-diesel-mysql-error-nw rep-diesel-mysql-error
```

NOTE: This does not generate the panic.

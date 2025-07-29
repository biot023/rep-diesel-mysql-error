# To replicate #

## Create network for Docker images ##

```
docker network create rep-diesel-mysql-error-nw
```

## Start the MySQL instance ##

```
docker run -d \
  --name mysql-container \
  -e MYSQL_ROOT_PASSWORD=supersecret \
  -p 3306:3306 \
  --network rep-diesel-mysql-error-nw \
  mysql:8.0
```

## Create the test DB and load the test data ##

```
mysql -h 0.0.0.0 -u root -psupersecret < create-db.sql
```

## Build the Docker image ##
```
docker build -t rep-diesel-mysql-error .
```

## Run the example ##

```
docker run --network rep-diesel-mysql-error-nw rep-diesel-mysql-error
```

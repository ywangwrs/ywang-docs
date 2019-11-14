# How To Connect LAVA server's Database - PostgreSQL

## Use pgAdmin 4
  * https://hub.docker.com/r/dpage/pgadmin4
  * https://www.pgadmin.org/docs/pgadmin4/latest/container_deployment.html

## Command to start pgAdmin 4 docker
```
docker run -p 5050:80 --rm --name pgadmin4 --hostname pgadmin4 --network lava-ci_lava-net \
    -e 'PGADMIN_DEFAULT_EMAIL=user@email.com' \
    -e 'PGADMIN_DEFAULT_PASSWORD=SuperStrongPassword' \
    -d dpage/pgadmin4
```

## docker-compose file
```
  pgadmin4:
    image: dpage/pgadmin4
    container_name: pgadmin4
    restart: always
    links:
      - lava-server
    ports:
      - "5050:80"
    environment:
      - PGADMIN_DEFAULT_EMAIL=user@email.com
      - PGADMIN_DEFAULT_PASSWORD=SuperStrongPassword
    networks:
      - lava-net
```

## Settings in LAVA docker to enable access postgresql
  * Reference
    * https://www.thegeekstuff.com/2014/02/enable-remote-postgresql-connection/
  * Dockerfile
  ```
  # Enable access the postgresql database from PgAdmin4 docker
RUN cat /etc/postgresql/9.6/main/postgresql.conf | grep listen_addresses \
 && sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'         /g" /etc/postgresql/9.6/main/postgresql.conf \
 && cat /etc/postgresql/9.6/main/postgresql.conf | grep listen_addresses \
 && echo "host    all             all             192.168.0.1/16          trust" >> /etc/postgresql/9.6/main/pg_hba.conf \
 && tail -10 /etc/postgresql/9.6/main/pg_hba.conf
  ```

## Access LAVA Server's PostgreSQL database from pgAdmin 4
![A test image](https://user-images.githubusercontent.com/15996047/68895176-c8defd80-06f6-11ea-9709-23fe27c6fcc3.png)

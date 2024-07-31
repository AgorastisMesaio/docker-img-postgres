# Adminer docker container

![GitHub action workflow status](https://github.com/AgorastisMesaio/docker-img-postgres/actions/workflows/docker-publish.yml/badge.svg)

This repository contains a `Dockerfile` aimed to create a *base image* to provide a dockerized PostgreSQL service. PostgreSQL is a powerful, open-source object-relational database system that uses and extends the SQL language combined with many features that safely store and scale the most complicated data workloads. PostgreSQL has a strong reputation for reliability, feature robustness, and performance.

## Key Features

- **ACID Compliance:** Ensures reliability in transactions.
- **Extensibility:** Supports custom data types, operators, and functions.
- **MVCC:** Multi-Version Concurrency Control for high concurrency.
- **Replication:** Supports various types of replication including streaming and logical replication.
- **Security:** Advanced security features like SSL, data encryption, and robust access controls.

## Use Cases

- **Local Development:**
  - Easily create isolated database instances for development and testing.
  - Quickly spin up and tear down PostgreSQL instances as needed.

- **Continuous Integration/Continuous Deployment (CI/CD):**
  - Automate database setup and teardown in CI/CD pipelines.
  - Ensure consistent testing environments.

- **Microservices Architecture:**
  - Provide dedicated databases for microservices.
  - Simplify deployment and scaling of microservices.

- **Data Warehousing:**
  - Utilize PostgreSQL’s robust querying capabilities for data analysis.
  - Store and process large datasets efficiently.

- **Cloud Deployments:**
  - Deploy PostgreSQL containers in cloud environments for scalable and flexible database solutions.
  - Use orchestration tools like Kubernetes for managing PostgreSQL clusters.

## Sample `docker-compose.yml`

This is an example where I'm running PostgreSQL in a Docker container.

```yaml
### Docker Compose example
volumes:
  postgres_data:
    driver: local

networks:
  my_network:
    name: my_network
    driver: bridge

services:
  ct_postgres:
    image: ghcr.io/agorastismesaio/docker-img-postgres:main
    hostname: postgres
    container_name: ct_postgres
    restart: always
    environment:
      - PGDATA=/var/lib/postgresql/data/guacamole
      - POSTGRES_DB=guacamole_db
      - POSTGRES_USER=guacamole
      - POSTGRES_PASSWORD=password
    networks:
      - my_network
    volumes:
    - ./dockerfiles/guacamole/initdb:/docker-entrypoint-initdb.d:ro
    - postgres_data:/var/lib/postgresql/data

  ct_other_container:
    :
```

- Start your services

```sh
docker compose up --build -d
```

## For developers

If you copy or fork this project to create your own base image.

### Building the Image

To build the Docker image, run the following command in the directory containing the Dockerfile:

```sh
docker build -t your-image/docker-img-postgres:main .
```

### Troubleshoot

```sh
docker run --rm --name ct_postgres --hostname postgres -p 8080:8080 your-image/docker-img-postgres:main
```

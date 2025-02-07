```markdown
# Spring Music

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Gradle Build](https://github.com/gitrey/spring-music/actions/workflows/gradle.yml/badge.svg)](https://github.com/gitrey/spring-music/actions/workflows/gradle.yml)

This is a sample application showcasing the use of database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/). The application stores domain objects using relational, document, and key-value stores.  This project is useful for demonstrating and experimenting with different types of services on Cloud Foundry.

## Table of Contents

*   [Description](#description)
*   [Features](#features)
*   [Architecture](#architecture)
*   [Prerequisites](#prerequisites)
*   [Installation](#installation)
*   [Configuration](#configuration)
*   [Usage](#usage)
*   [Deployment to Cloud Foundry](#deployment-to-cloud-foundry)
*   [Contributing](#contributing)
*   [License](#license)
*   [Contact](#contact)

## Description

The Spring Music application is designed to illustrate how to connect to and utilize various database services within a Cloud Foundry environment using Spring Boot. It's architected to persist the same core data model (Albums) across a range of data stores, including relational databases (MySQL, PostgreSQL, SQL Server, H2), NoSQL databases (MongoDB), and key-value stores (Redis).  This provides a comparative view of data access patterns and configurations.

**Please note:** While the application supports multiple persistence technologies, it is not intended as a model for choosing the right database for a particular data type in real-world scenarios. The purpose is purely demonstrative.

The application uses Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and the connection objects needed to use the persistence stores. It also uses the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. Refer to the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for details on configuring a Spring application for Cloud Foundry.

## Features

*   **Multi-Persistence Support:** Demonstrates data storage using relational, document, and key-value stores.
*   **Cloud Foundry Integration:** Leverages `java-cfenv` to automatically configure database connections based on Cloud Foundry service bindings.
*   **Spring Profiles:** Uses Spring profiles to switch between different database configurations.
*   **REST API:** Provides a RESTful API for managing albums.
*   **Web UI:**  Includes a basic web interface for interacting with the application.
*   **Actuator Endpoints:** Exposes Spring Boot Actuator endpoints for monitoring and management.

## Architecture

The application is a standard Spring Boot application with the following key components:

*   **Domain Model:** The `Album` class represents the core data model.
*   **Repositories:**  Spring Data repositories are used to interact with the different data stores.  Specific repository implementations exist for JPA, MongoDB, and Redis.
*   **Controllers:** `AlbumController`, `InfoController`, and `ErrorController` handle incoming web requests.
*   **Configuration:** Spring configuration classes are used to configure database connections and other application settings.
*   **Web UI:** AngularJS based frontend to view and manage the albums.

## Prerequisites

Before you begin, ensure you have met the following requirements:

*   **Java Development Kit (JDK):** Version 17 or higher.
*   **Gradle:** Version 7.x or higher.
*   **Cloud Foundry CLI (Optional):**  Required for deploying to Cloud Foundry.
*   **Database Instances (Optional):**  If you want to run the application locally with a specific database, you'll need to have a running instance of MySQL, PostgreSQL, MongoDB, or Redis.

## Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/gitrey/spring-music.git
    cd spring-music
    ```

2.  **Build the application:**

    ```bash
    ./gradlew build
    ```

## Configuration

The application uses Spring profiles to configure different database connections. You can activate a profile by setting the `SPRING_PROFILES_ACTIVE` environment variable or by specifying it in the `application.yml` file.

**application.yml:**

```yaml
spring:
  jpa:
    generate-ddl: true

management:
  endpoints:
    web:
      exposure:
        include: "*"
  endpoint:
    health:
      show-details: always

---
spring:
  config:
    activate:
      on-profile: http2

server:
  http2:
    enabled: true

---
spring:
  config:
    activate:
      on-profile: mysql
  datasource:
    url: "jdbc:mysql://localhost/music"
    driver-class-name: com.mysql.jdbc.Driver
    username: <your_mysql_username>
    password: <your_mysql_password>
  jpa:
    properties:
      hibernate:
        dialect: org.hibernate.dialect.MySQL55Dialect

---
spring:
  config:
    activate:
      on-profile: postgres
  datasource:
    url: "jdbc:postgresql://localhost/music"
    driver-class-name: org.postgresql.Driver
    username: postgres
    password: <your_postgres_password>
  jpa:
    properties:
      hibernate:
        dialect: org.hibernate.dialect.ProgressDialect
```

**Supported Profiles:**

*   `mysql`:  Configures a connection to a MySQL database.  Update `application.yml` with your MySQL credentials.
*   `postgres`: Configures a connection to a PostgreSQL database. Update `application.yml` with your PostgreSQL credentials.
*   `mongodb`:  Connects to a MongoDB instance. Requires a MongoDB instance running locally or accessible.
*   `redis`: Connects to a Redis instance. Requires a Redis instance running locally or accessible.
*   `h2`:  Uses an in-memory H2 database (default).

## Usage

1.  **Run the application:**

    ```bash
    ./gradlew bootRun
    ```

    To run with a specific profile:

    ```bash
    SPRING_PROFILES_ACTIVE=mysql ./gradlew bootRun
    ```

2.  **Access the application:**

    Open your web browser and navigate to `http://localhost:8080`.  You should see the Spring Music web interface.

3.  **REST API:**

    The application exposes a REST API for managing albums:

    *   `GET /albums`:  Returns a list of all albums.
    *   `GET /albums/{id}`: Returns a specific album by ID.
    *   `PUT /albums`: Creates a new album.
    *   `POST /albums`: Updates an existing album.
    *   `DELETE /albums/{id}`: Deletes an album.

## Deployment to Cloud Foundry

1.  **Build the application:**

    ```bash
    ./gradlew build
    ```

2.  **Push the application to Cloud Foundry:**

    ```bash
    cf push
    ```

    The `manifest.yml` file contains the application configuration for Cloud Foundry.  Ensure that you have a suitable service bound to your application instance. The application will automatically configure the connection using the Cloud Foundry service bindings.

    If deploying with a specific service, you must create the service instance first and bind it to the application, or specify a bound service name in `manifest.yml`. For example, to bind a MySQL instance, you would execute these commands:

    ```bash
    cf create-service p-mysql 100mb my-mysql-db
    cf bind-service spring-music my-mysql-db
    cf push
    ```

## Contributing

We welcome contributions to Spring Music! Please follow these guidelines:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Write clear commit messages.
4.  Submit a pull request with a detailed description of your changes.

## License

Spring Music is licensed under the Apache 2.0 License. See the [LICENSE](LICENSE) file for more information.

```
Copyright 2023 [Your Name/Organization]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

## Contact

For questions, bug reports, or feature requests, please:

*   Open an issue on our GitHub repository: [https://github.com/gitrey/spring-music](https://github.com/gitrey/spring-music)
```


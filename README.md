```markdown
# Spring Music: A Cloud Foundry Sample Application

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Spring Boot Version](https://img.shields.io/badge/Spring%20Boot-3.1.5-brightgreen)](https://spring.io/projects/spring-boot)
[![Java Version](https://img.shields.io/badge/Java-17-blue)](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html)

Spring Music is a sample application showcasing database service usage on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/). It serves as a demonstration of how to connect to various persistence technologies when deployed to Cloud Foundry.

## Table of Contents

*   [Description](#description)
*   [Features](#features)
*   [Technologies Used](#technologies-used)
*   [Deployment](#deployment)
*   [Configuration](#configuration)
*   [Running Locally](#running-locally)
*   [Contributing](#contributing)
*   [License](#license)
*   [Contact](#contact)

## Description

This application allows users to manage a collection of music albums.  It's designed to store album data across different persistence technologies, including relational, document, and key-value stores. While not a typical production scenario (as you'd generally choose a single persistence technology suited to your data), it provides a valuable platform for testing and experimenting with diverse services on Cloud Foundry.

The application utilizes Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and establish connections to the chosen persistence stores. It also leverages the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to dynamically inspect the environment when running on Cloud Foundry. This allows the application to adapt its configuration based on the available services. For more information on configuring Spring applications for Cloud Foundry, refer to the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html).

## Features

*   **Data Storage Abstraction:** Demonstrates how to connect to various database services (relational, document, key-value) using Spring profiles.
*   **Cloud Foundry Integration:** Uses Java CFEnv to automatically configure database connections based on Cloud Foundry service bindings.
*   **REST API:** Provides a RESTful API for managing albums (CRUD operations).
*   **UI:**  A simple web UI for interacting with the album data.
*   **Spring Boot Actuator:** Includes Spring Boot Actuator endpoints for monitoring and managing the application.

## Technologies Used

*   [Spring Boot](https://spring.io/projects/spring-boot):  For rapid application development and simplified configuration.
*   [Spring Data JPA](https://spring.io/projects/spring-data-jpa): For relational database access.
*   [Spring Data MongoDB](https://spring.io/projects/spring-data-mongodb): For MongoDB document database access.
*   [Spring Data Redis](https://spring.io/projects/spring-data-redis): For Redis key-value store access.
*   [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/):  For accessing Cloud Foundry environment variables and service bindings.
*   [H2 Database](https://www.h2database.com/html/main.html), [MySQL](https://www.mysql.com/), [PostgreSQL](https://www.postgresql.org/), [SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads): Supported relational databases.
*   [MongoDB](https://www.mongodb.com/): Supported document database.
*   [Redis](https://redis.io/): Supported key-value store.
*   [AngularJS](https://angularjs.org/): For the front-end web UI.
*   [Bootstrap](https://getbootstrap.com/):  For UI styling and components.

## Deployment

To deploy Spring Music to Cloud Foundry, follow these steps:

1.  **Build the application:**

    ```bash
    ./gradlew build
    ```

2.  **Push the application to Cloud Foundry using the `cf push` command.** The `manifest.yml` file provides the necessary configuration.

    ```bash
    cf push
    ```

    The `manifest.yml` configures the application with:
    *   A memory limit of 1GB
    *   A random route to avoid conflicts
    *   Disables Spring Auto-Reconfiguration to explicitly manage service bindings
    *   Activates the `http2` Spring profile for HTTP/2 support.
    *   Specifies the use of Java 17.

3.  **Bind database services to the application.** You'll need to create instances of the desired database services first.  For example:

    ```bash
    cf create-service cleardb spark my-mysql-db
    cf bind-service spring-music my-mysql-db
    ```

    Repeat this for any other database services you wish to use (MongoDB, Redis, etc.).

4.  **Restage the application:**

    ```bash
    cf restage spring-music
    ```

## Configuration

The application uses Spring profiles to activate specific database configurations. The following profiles are available:

*   `mysql`:  Configures the application to use a MySQL database.  Requires a MySQL service instance bound to the application.
*   `postgres`: Configures the application to use a PostgreSQL database. Requires a PostgreSQL service instance bound to the application.
*   `mongodb`: Configures the application to use a MongoDB database. Requires a MongoDB service instance bound to the application.
*   `redis`:  Configures the application to use a Redis key-value store. Requires a Redis service instance bound to the application.
*   `oracle`: Configures the application to use a Oracle database. Requires a Oracle service instance bound to the application.  **Note:** You will need to manually place the Oracle JDBC driver in the `libs` directory.
*   `sqlserver`: Configures the application to use a SQL Server database. Requires a SQL Server service instance bound to the application.

You can activate a profile by setting the `SPRING_PROFILES_ACTIVE` environment variable in your `manifest.yml` or using the `cf set-env` command. For example, to use MySQL:

```bash
cf set-env spring-music SPRING_PROFILES_ACTIVE mysql
cf restage spring-music
```

## Running Locally

You can run the application locally for development purposes.  You'll need to have Java 17 and Gradle installed.

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/gitrey/spring-music.git
    cd spring-music
    ```

2.  **Configure your database connection.**  Edit the `application.yml` file and configure the connection properties for your chosen database (MySQL, PostgreSQL, etc.).  Make sure to create the database in your local database server.

3.  **Run the application:**

    ```bash
    ./gradlew bootRun
    ```

    To run with a specific profile, use the `SPRING_PROFILES_ACTIVE` environment variable:

    ```bash
    SPRING_PROFILES_ACTIVE=mysql ./gradlew bootRun
    ```

## Contributing

We welcome contributions to Spring Music!  Please follow these guidelines:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Write clean, well-documented code.
4.  Submit a pull request for review.

## License

Spring Music is licensed under the Apache 2.0 License. See the [LICENSE](LICENSE) file for details.

```
Copyright [yyyy] [Name of copyright owner]

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

For questions, bug reports, or feature requests, please open an issue on this GitHub repository.
```


```markdown
# Spring Music

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Spring Boot Version](https://img.shields.io/badge/Spring%20Boot-3.1.5-brightgreen)](https://spring.io/projects/spring-boot)
[![Java Version](https://img.shields.io/badge/Java-17-blue)](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html)
[![Cloud Foundry](https://img.shields.io/badge/Cloud%20Foundry-Ready-brightgreen)](https://www.cloudfoundry.org/)

Spring Music is a sample application demonstrating the use of database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

This application showcases how to store the same domain objects (Albums) in various persistence technologies, including relational, document, and key-value stores. While this isn't a typical real-world scenario, it's designed for testing and experimenting with different types of services available on Cloud Foundry.

## Table of Contents

*   [Description](#description)
*   [Features](#features)
*   [Technologies Used](#technologies-used)
*   [Installation](#installation)
*   [Usage](#usage)
*   [Configuration](#configuration)
*   [Cloud Foundry Deployment](#cloud-foundry-deployment)
*   [Contributing](#contributing)
*   [License](#license)
*   [Contact](#contact)

## Description

Spring Music provides a RESTful API for managing a collection of albums. It allows you to:

*   Retrieve a list of all albums.
*   Add new albums.
*   Update existing albums.
*   Retrieve a specific album by its ID.
*   Delete an album by its ID.

The application utilizes Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and the connection objects needed to use the persistence stores. It also uses the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. See the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for details on configuring a Spring application for Cloud Foundry.

## Features

*   **Multi-Persistence Support:** Demonstrate integration with relational databases (MySQL, PostgreSQL, H2, SQL Server, Oracle), document databases (MongoDB), and key-value stores (Redis).
*   **Cloud Foundry Ready:** Designed to be easily deployed and configured on Cloud Foundry.
*   **Service Bindings:** Leverages Cloud Foundry service bindings for automatic configuration of data sources.
*   **Spring Boot Actuator:** Provides health and info endpoints for monitoring the application.
*   **RESTful API:** Exposes a RESTful API for managing albums.
*   **Java CFEnv:** Uses the `java-cfenv` library to inspect Cloud Foundry environment variables.
*   **HTTP/2 Support:** Configurable to use HTTP/2 for improved performance.
*   **Web UI:** Includes a simple AngularJS-based web UI for interacting with the API.

## Technologies Used

*   [Spring Boot](https://spring.io/projects/spring-boot) - Simplifies application development with auto-configuration and embedded servers.
*   [Spring Data JPA](https://spring.io/projects/spring-data-jpa) - Provides simplified data access for relational databases.
*   [Spring Data MongoDB](https://spring.io/projects/spring-data-mongodb) - Provides simplified data access for MongoDB.
*   [Spring Data Redis](https://spring.io/projects/spring-data-redis) - Provides simplified data access for Redis.
*   [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) - Simplifies access to Cloud Foundry environment variables.
*   [AngularJS](https://angularjs.org/) - A JavaScript framework for building dynamic web applications.
*   [Gradle](https://gradle.org/) - A powerful build automation system.

## Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/spring-music.git  # Replace with your forked repo
    cd spring-music
    ```

2.  **Install Java:**

    Ensure you have Java 17 or higher installed.  You can download it from the [Oracle website](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html) or use a package manager like SDKMAN!

3.  **Build the application:**

    ```bash
    ./gradlew build
    ```

## Usage

The application can be run locally or deployed to Cloud Foundry.

### Running Locally

1.  **Configure a database:**

    Choose one of the supported databases (MySQL, PostgreSQL, H2, etc.) and configure the connection properties in `src/main/resources/application.yml`.  You'll need to create the `music` database.  Example configuration for PostgreSQL:

    ```yaml
    spring:
      config:
        activate:
          on-profile: postgres
      datasource:
        url: "jdbc:postgresql://localhost/music"
        driver-class-name: org.postgresql.Driver
        username: postgres
        password: your_password  # Replace with your actual password
      jpa:
        properties:
          hibernate:
            dialect: org.hibernate.dialect.PostgreSQLDialect
    ```

2.  **Run the application:**

    Specify the database profile you want to use (e.g., `postgres`):

    ```bash
    ./gradlew bootRun -Dspring-boot.run.profiles=postgres
    ```

3.  **Access the application:**

    Open your web browser and navigate to `http://localhost:8080`.

### REST API Endpoints

*   `GET /albums`:  Retrieves a list of all albums.
*   `PUT /albums`:  Adds a new album (request body should be a JSON representation of the album).
*   `POST /albums`:  Updates an existing album (request body should be a JSON representation of the album).
*   `GET /albums/{id}`:  Retrieves an album by its ID.
*   `DELETE /albums/{id}`: Deletes an album by its ID.
*   `GET /appinfo`: Retrieves application info such as active profiles and services bound.
*   `GET /service`: Retrieves details about bound services.
*   `GET /request`: Retrieves request information.
*   `GET /errors/kill`: Kills the application instance.
*   `GET /errors/throw`: Throws a NullPointerException.

## Configuration

The application uses Spring profiles to configure the data source and other environment-specific settings. You can activate a profile by setting the `SPRING_PROFILES_ACTIVE` environment variable or by passing the `-Dspring-boot.run.profiles` argument to the `bootRun` task.

Supported profiles:

*   `mysql`
*   `postgres`
*   `redis`
*   `mongodb`
*   `oracle` (requires manual driver installation - see `build.gradle`)
*   `sqlserver`
*   `h2` (default, in-memory database)
*   `http2` (enables HTTP/2)

## Cloud Foundry Deployment

1.  **Build the application:**

    ```bash
    ./gradlew build
    ```

2.  **Create a Cloud Foundry account and install the Cloud Foundry CLI:**

    Follow the instructions on the [Cloud Foundry website](https://www.cloudfoundry.org/).

3.  **Log in to Cloud Foundry:**

    ```bash
    cf login -a <api_endpoint> -u <username> -o <organization> -s <space>
    ```

4.  **Create database service instances (if needed):**

    ```bash
    cf create-service <service_offering> <plan_name> <service_instance_name>
    ```

    For example:

    ```bash
    cf create-service p-postgresql development postgres-db
    ```

5.  **Push the application:**

    Use the `manifest.yml` file to deploy the application:

    ```bash
    cf push
    ```

    Or, to deploy with a specific profile (e.g., `postgres`), set the `SPRING_PROFILES_ACTIVE` environment variable:

    ```bash
    cf push -n spring-music-postgres -m 1G -p build/libs/spring-music-1.0.jar  -e SPRING_PROFILES_ACTIVE=postgres --random-route
    ```

    Remember to replace `spring-music-1.0.jar` with the actual name of the generated jar file.  The `manifest.yml` disables auto-reconfiguration and utilizes CF service bindings directly, rather than K8s style bindings.

6.  **Bind service instances (if you did not create the services before pushing the application):**

    ```bash
    cf bind-service spring-music <service_instance_name>
    ```

7.  **Access the application:**

    The application URL will be displayed in the Cloud Foundry CLI output.

## Contributing

We welcome contributions to Spring Music! Please follow these guidelines:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Write clear and concise code with appropriate documentation and tests.
4.  Follow the existing code style.
5.  Submit a pull request with a detailed description of your changes.

## License

Spring Music is licensed under the Apache 2.0 License. See the [LICENSE](LICENSE) file for more information.

## Contact

For questions, bug reports, or feature requests, please contact us by creating an issue on this GitHub repository.
```


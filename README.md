```markdown
# Spring Music

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Build Status](https://github.com/gitrey/spring-music/actions/workflows/gradle.yml/badge.svg)](https://github.com/gitrey/spring-music/actions/workflows/gradle.yml)

**A sample application demonstrating the use of database services on Cloud Foundry with the Spring Framework and Spring Boot.**

This application showcases how to store the same domain objects across various persistence technologies: relational, document, and key-value stores. While not a realistic use case (you'd typically choose the most suitable technology for your data), it's designed for testing and experimenting with different services on Cloud Foundry.

## Table of Contents

- [Description](#description)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Building the Application](#building-the-application)
  - [Running the Application Locally](#running-the-application-locally)
  - [Deploying to Cloud Foundry](#deploying-to-cloud-foundry)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Description

Spring Music is a sample application that highlights the use of different database services within the context of a Spring Boot application deployed on Cloud Foundry. It demonstrates the use of Spring profiles and the Java CFEnv library to configure connections to various persistence stores.  This application is intended to help developers understand how to interact with different data services in a Cloud Foundry environment using Spring Boot.

## Features

- **Multi-Persistence Support:** Stores album data in relational databases (e.g., PostgreSQL, MySQL, H2, SQL Server), MongoDB, and Redis.
- **Spring Boot and Cloud Foundry Integration:** Leverages Spring Boot's auto-configuration and Spring profiles for managing different data configurations. Uses [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) to discover and consume service bindings on Cloud Foundry.
- **Web UI:** Provides a basic web interface using AngularJS for viewing and managing album data.
- **REST API:** Includes RESTful endpoints for accessing and manipulating album data.
- **Actuator Endpoints:** Exposes Spring Boot Actuator endpoints for health checks and monitoring.
- **Configuration Flexibility:** Uses Spring profiles to activate different database configurations via application.yml
- **Error Handling:** Includes endpoints to force errors for testing application resilience.

## Technologies Used

-   [Spring Boot](https://spring.io/projects/spring-boot)
-   [Spring Framework](https://spring.io/)
-   [Spring Data JPA](https://spring.io/projects/spring-data-jpa)
-   [Spring Data MongoDB](https://spring.io/projects/spring-data-mongodb)
-   [Spring Data Redis](https://spring.io/projects/spring-data-redis)
-   [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/)
-   [AngularJS](https://angularjs.org/)
-   [Bootstrap](https://getbootstrap.com/)
-   [Gradle](https://gradle.org/)

## Getting Started

### Prerequisites

-   [Java 17](https://www.oracle.com/java/technologies/downloads/#java17) or higher
-   [Gradle 7.6.2](https://gradle.org/releases/) or higher
-   A Cloud Foundry environment (optional for local development)
-   A database service (PostgreSQL, MySQL, MongoDB, or Redis) - see `application.yml` for config options

### Building the Application

1.  Clone the repository:

    ```bash
    git clone https://github.com/gitrey/spring-music.git
    cd spring-music
    ```

2.  Build the application using Gradle:

    ```bash
    ./gradlew build
    ```

    The build will produce an executable JAR file located in `build/libs/`.

### Running the Application Locally

1. You can run the application using the `bootRun` task:

    ```bash
    ./gradlew bootRun
    ```

   This will start the application with a default H2 database.

2.  Access the application via `http://localhost:8080`.

   You may also specify an active spring profile via a command line argument such as `-Dspring.profiles.active=postgres`

### Deploying to Cloud Foundry

1.  Build the application:

    ```bash
    ./gradlew build
    ```

2.  Login to Cloud Foundry:

    ```bash
    cf login
    ```

3.  Push the application to Cloud Foundry:

    ```bash
    cf push -f manifest.yml
    ```
  
    This will use the `manifest.yml` to deploy the application. The manifest disables spring auto-reconfiguration and enables http/2.
4.  Access the application through the route provided by Cloud Foundry.

    You must have a database service instance available and bound to your application. Follow the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for details on configuring a Spring application for Cloud Foundry.

## Configuration

The application uses Spring profiles to configure different data sources and features. You can activate profiles using the `SPRING_PROFILES_ACTIVE` environment variable or `-Dspring.profiles.active` JVM argument when launching the application.

-   **`http2`**: Enables HTTP/2 support.
-   **`mysql`**: Configures the application to use a MySQL database.
-   **`postgres`**: Configures the application to use a PostgreSQL database.
-   **`mongodb`**: Configures the application to use a MongoDB database.
-   **`redis`**: Configures the application to use a Redis database.

The database connection details can be configured in the `src/main/resources/application.yml` file.  You may specify usernames, passwords, and hostnames when running the application locally.  In cloud environments it is preferable to let the `java-cfenv` library configure these parameters using the service bindings.

## Contributing

We welcome contributions! To contribute to Spring Music:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Follow the project's coding style and guidelines.
4.  Write clear and concise commit messages.
5.  Submit a pull request with a detailed description of your changes.

## License

Spring Music is licensed under the Apache 2.0 License. See the [LICENSE](LICENSE) file for more details.

## Contact

For support or inquiries, please contact us by opening an issue on this GitHub repository.
```


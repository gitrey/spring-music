```markdown
# Spring Music

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Spring Boot Version](https://img.shields.io/badge/Spring%20Boot-3.1.5-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![Java Version](https://img.shields.io/badge/Java-17-blue)](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html)
[![Cloud Foundry](https://img.shields.io/badge/Cloud%20Foundry-Compatible-blue)](https://www.cloudfoundry.org/)

## Description

Spring Music is a sample application demonstrating the use of database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/). It showcases how to configure and connect to different persistence technologies (relational, document, and key-value stores) from a Spring Boot application deployed to Cloud Foundry.

This application stores album information in various persistence technologies, selected via Spring Profiles.  This serves as a demonstration of different service integrations rather than a suggested architecture for all applications.

The application leverages Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and connection objects.  It also uses the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. See the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for details on configuring a Spring application for Cloud Foundry.

## Table of Contents

- [Description](#description)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

*   Demonstrates database service binding on Cloud Foundry.
*   Supports multiple persistence technologies:
    *   Relational (MySQL, PostgreSQL, H2, SQL Server, Oracle)
    *   Document (MongoDB)
    *   Key-Value (Redis)
*   Uses Spring Boot profiles for easy configuration switching.
*   Uses Java CFEnv library to automatically detect and configure Cloud Foundry services.
*   Provides a basic web UI for managing albums.
*   Demonstrates Spring Actuator for monitoring application health and metrics.
*   Support for HTTP/2 with profile `http2`.

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

    This will create a `build/libs/spring-music-1.0.jar` file.

## Usage

### Deploying to Cloud Foundry

1.  **Create service instances** (if you don't have them already). For example, to create a MySQL instance:

    ```bash
    cf create-service p-mysql 100mb my-mysql
    ```

    Repeat this process for any other services (MongoDB, Redis, etc.) you wish to use. Note the service names you choose, as they will be used in the next step.

2.  **Push the application:**

    ```bash
    cf push
    ```

    The `manifest.yml` file contains default settings, including a random route.

### Running Locally

1.  **Set up your database:** Ensure you have the database you want to use installed locally (MySQL, PostgreSQL, MongoDB, Redis).

2.  **Configure database connection:** Set the appropriate Spring profile and database connection properties in `src/main/resources/application.yml`.  Example for MySQL:

    ```yaml
    spring:
      config:
        activate:
          on-profile: mysql
      datasource:
        url: "jdbc:mysql://localhost/music"
        driver-class-name: com.mysql.cj.jdbc.Driver
        username: <your_mysql_username>
        password: <your_mysql_password>
      jpa:
        properties:
          hibernate:
            dialect: org.hibernate.dialect.MySQL8Dialect
            generate-ddl: true # Enable DDL generation to create the schema if it doesn't exist
    ```

3.  **Run the application:**

    ```bash
    ./gradlew bootRun -Dspring-boot.run.profiles=<profile_name>
    ```

    Replace `<profile_name>` with the appropriate profile (e.g., `mysql`, `postgres`, `mongodb`, `redis`).

### Accessing the Application

Once the application is running, you can access it through your web browser using the URL provided by Cloud Foundry (after pushing) or `http://localhost:8080` if running locally.

## Configuration

Spring Music supports multiple database technologies, configurable via Spring profiles:

*   **`mysql`**: Uses a MySQL database.
*   **`postgres`**: Uses a PostgreSQL database.
*   **`mongodb`**: Uses a MongoDB database.
*   **`redis`**: Uses a Redis database.
*   **`h2`**: Uses an H2 in-memory database. Useful for local development.
*   **`sqlserver`**: Uses a Microsoft SQL Server database.
*   **`oracle`**: Uses an Oracle database.
*   **`http2`**: Enables HTTP/2 support.

You can activate profiles using the `SPRING_PROFILES_ACTIVE` environment variable in `manifest.yml` for Cloud Foundry or the `-Dspring-boot.run.profiles` argument when running locally.

### Cloud Foundry Configuration

When deployed to Cloud Foundry, Spring Music automatically detects and configures the database connection based on the bound service. You don't typically need to modify the `application.yml` file.

The `manifest.yml` file provides a starting point for configuring your Cloud Foundry deployment, including memory allocation and a random route.

### Local Configuration

If running locally, ensure that you have a local instance of the database you want to use. You'll also need to configure the connection properties in `src/main/resources/application.yml` under the appropriate profile.

## Contributing

We welcome contributions to Spring Music! Please follow these guidelines:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Write clear and concise code with appropriate comments.
4.  Follow the existing code style.
5.  Write unit tests to verify your changes.
6.  Submit a pull request for review.

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.

## Contact

For questions or support, please open an issue on the [GitHub repository](https://github.com/gitrey/spring-music/issues).
```


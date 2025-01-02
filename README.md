```markdown
# Spring Music

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Java Version](https://img.shields.io/badge/java-17-blue.svg)](https://www.oracle.com/java/technologies/downloads/#java17)
[![Spring Boot Version](https://img.shields.io/badge/spring%20boot-3.1.5-green.svg)](https://spring.io/projects/spring-boot)


This is a sample application demonstrating the use of database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

## Table of Contents

- [Description](#description)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Description

Spring Music is a sample application designed to showcase how to interact with various persistence technologies (relational, document, and key-value stores) within the Cloud Foundry environment using the Spring Framework and Spring Boot. It is intentionally not optimized for any specific technology, but rather it serves as a platform for experimenting with different data services available on Cloud Foundry. This project also demonstrates the use of [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) to adapt its configuration based on the Cloud Foundry environment.

## Features

*   Demonstrates integration with multiple database types:
    *   Relational Databases (e.g., PostgreSQL, MySQL, H2, SQL Server)
    *   Document Database (MongoDB)
    *   Key-Value Store (Redis)
*   Utilizes Spring Profiles for environment-specific configurations.
*   Uses Java CFEnv library for inspecting and adapting to Cloud Foundry environment.
*   Includes a RESTful API for managing albums.
*   Provides a simple web UI for interacting with the API.
*   Includes error handling and actuator endpoints.
*   Uses HTTP/2 if enabled.

## Technologies Used

*   [Java 17](https://www.oracle.com/java/technologies/downloads/#java17)
*   [Spring Boot 3.1.5](https://spring.io/projects/spring-boot)
*   [Spring Framework](https://spring.io/)
*   [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/)
*   [Gradle](https://gradle.org/)
*   [H2 Database](https://www.h2database.com/html/main.html)
*   [MySQL](https://www.mysql.com/)
*   [PostgreSQL](https://www.postgresql.org/)
*   [Microsoft SQL Server](https://www.microsoft.com/sql-server)
*   [MongoDB](https://www.mongodb.com/)
*   [Redis](https://redis.io/)
*   [Webjars](https://www.webjars.org/) (Bootstrap, AngularJS, jQuery)

## Installation

### Prerequisites

*   Java 17 or later.
*   Gradle 7.x or later.
*   A Cloud Foundry environment (optional, for cloud deployment)
*   A local database instance, if you want to connect without cloud deployment

### Build the Application

1.  Clone the repository:
    ```bash
    git clone https://github.com/gitrey/spring-music.git
    cd spring-music
    ```
2.  Build the application using Gradle:
    ```bash
    ./gradlew build
    ```
    or on Windows:
      ```bash
    gradlew.bat build
    ```
    This will generate an executable JAR file in `build/libs`.

## Usage

### Running Locally

1.  Navigate to the `build/libs` directory.
2.  Run the JAR file:
    ```bash
    java -jar spring-music-1.0.jar
    ```
3.  Access the application at `http://localhost:8080`.

### Running on Cloud Foundry

1.  Ensure you have the Cloud Foundry CLI installed and configured.
2.  Build the application as described above.
3.  Deploy the application to Cloud Foundry:
    ```bash
    cf push -f manifest.yml
    ```
    Note that you may have to create the database instances manually before using `cf push`.
    See [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for details on configuring a Spring application for Cloud Foundry.

## Configuration

The application uses Spring profiles to configure different data persistence options.
*   `mongodb`: Configures the application to use a MongoDB database.
*   `postgres`: Configures the application to use a PostgreSQL database.
*   `mysql`: Configures the application to use a MySQL database.
*   `redis`: Configures the application to use a Redis database.
*   `oracle`: Configures the application to use an Oracle database.
*   `sqlserver`: Configures the application to use a SQL Server database.
* `http2`:  Enables HTTP/2 support on the application server

If running locally, ensure that you have appropriate database connection details set in the `src/main/resources/application.yml`. Cloud Foundry manages service bindings. Spring Music will read the service bindings when running on Cloud Foundry, using the `java-cfenv` library.

### Database configuration in `application.yml`

Example configuration for MySQL (other databases are similar):

```yaml
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
```

## Contributing

We welcome contributions to Spring Music. If you'd like to contribute, please follow these guidelines:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Make your changes and commit them.
4.  Ensure that your code adheres to the project's coding style.
5.  Write tests for your new code or changes.
6.  Submit a pull request with a clear description of your changes.

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.

## Contact

For questions, issues, or feature requests, please:

*   Open an issue on our GitHub repository.
```


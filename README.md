```markdown
# Spring Music

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Java Version](https://img.shields.io/badge/java-17-green)](https://www.oracle.com/java/technologies/javase-jdk17-archive-downloads.html)
[![Spring Boot Version](https://img.shields.io/badge/Spring%20Boot-3.1.5-brightgreen)](https://spring.io/projects/spring-boot)
[![Cloud Foundry](https://img.shields.io/badge/Cloud%20Foundry-Ready-blue)](https://www.cloudfoundry.org/)

## Description

Spring Music is a sample application demonstrating the use of database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

This application showcases how to store the same domain objects (Albums) in a variety of persistence technologies:

*   Relational databases (JPA)
*   Document databases (MongoDB)
*   Key-value stores (Redis)

**Note:** This application is *not* meant to represent a realistic use case for these technologies.  In a real-world scenario, you would choose the most appropriate persistence technology based on the specific type of data and access patterns required. However, this sample is useful for testing and experimenting with different types of services on Cloud Foundry.

The application leverages Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and the necessary connection objects for each persistence store. It also uses the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. See the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for details on configuring a Spring application for Cloud Foundry.

## Table of Contents

- [Description](#description)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Deployment to Cloud Foundry](#deployment-to-cloud-foundry)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

*   **Multiple Persistence Options:** Supports JPA, MongoDB, and Redis for data storage.
*   **Spring Profiles:** Uses Spring profiles to easily switch between persistence implementations.
*   **Cloud Foundry Integration:** Uses Java CFEnv to automatically configure service connections on Cloud Foundry.
*   **REST API:** Provides a REST API for managing albums.
*   **Simple UI:** Includes a basic web UI for interacting with the application.
*   **Actuator Endpoints:**  Leverages Spring Boot Actuator for monitoring and management.

## Installation

1.  **Prerequisites:**
    *   Java 17 or later ([OpenJDK](https://openjdk.java.net/))
    *   Gradle (version 7.0 or later) or Maven
    *   A Cloud Foundry environment (optional, for deployment)
    *   A relational database (e.g., MySQL, PostgreSQL, H2) - optional, for JPA profile
    *   A MongoDB instance - optional, for MongoDB profile
    *   A Redis instance - optional, for Redis profile

2.  **Clone the repository:**

    ```bash
    git clone https://github.com/gitrey/spring-music.git
    cd spring-music
    ```

3.  **Build the application:**

    Using Gradle:

    ```bash
    ./gradlew build
    ```

    Using Maven (if you prefer Maven):

    ```bash
    ./mvnw clean install
    ```

## Usage

The application can be run locally or deployed to Cloud Foundry.

### Running Locally

1.  **Configure the database connection (optional):**

    If you want to use a relational database (JPA profile), configure the connection details in `src/main/resources/application.yml`. For example, for MySQL:

    ```yaml
    spring:
      config:
        activate:
          on-profile: mysql
      datasource:
        url: "jdbc:mysql://localhost/music"
        driver-class-name: com.mysql.cj.jdbc.Driver  # Updated driver class name
        username: <your_mysql_username>
        password: <your_mysql_password>
      jpa:
        properties:
          hibernate:
            dialect: org.hibernate.dialect.MySQLDialect # Updated dialect
            ddl-auto: update # This is for quick local development - NEVER use `create` in prod
    ```

    Adjust the URL, driver class name, username, and password to match your MySQL installation. Similar configurations are available for Postgres in the same file.

2.  **Run the application:**

    Using Gradle:

    ```bash
    ./gradlew bootRun
    ```

    Using Maven (if you prefer Maven):

    ```bash
    ./mvnw spring-boot:run
    ```

    The application will start on port 8080 by default.

3.  **Access the UI:**

    Open your web browser and navigate to `http://localhost:8080`.

### REST API Endpoints

The application exposes the following REST API endpoints:

*   `GET /albums`:  Retrieve a list of all albums.
*   `GET /albums/{id}`: Retrieve a specific album by ID.
*   `PUT /albums`: Create a new album.  Request body should be a JSON representation of the album.
*   `POST /albums`: Update an existing album. Request body should be a JSON representation of the album.
*   `DELETE /albums/{id}`: Delete an album by ID.
*   `GET /appinfo`: Retrieve application information including active profiles and services.
*   `GET /service`: Retrieve service binding information.
*   `GET /request`: Retrieve request related information
*   `/errors/kill`: Kills the application instance.
*   `/errors/throw`: Triggers an exception within the application.

## Configuration

The application's behavior can be configured using Spring profiles and environment variables.

### Spring Profiles

The following Spring profiles are available:

*   `mysql`: Uses a MySQL database for persistence.
*   `postgres`: Uses a PostgreSQL database for persistence.
*   `mongodb`: Uses a MongoDB database for persistence.
*   `redis`: Uses a Redis instance for persistence.
*   `http2`: Enables HTTP/2 support.

You can activate a profile by setting the `SPRING_PROFILES_ACTIVE` environment variable or by passing the `--spring.profiles.active` argument to the application.

### Database Configuration

The database connection details are configured in `src/main/resources/application.yml`.  You will need to adjust the connection URL, username, and password to match your database installation.  For H2, the connection URL is:
`jdbc:h2:mem:musicdb`

### Other configuration

*   `JBP_CONFIG_SPRING_AUTO_RECONFIGURATION: '{enabled: false}'`: Disables the Spring Auto Reconfiguration buildpack which attempts to auto-configure Spring Boot applications. This sample manages its own configuration.
*   `SPRING_PROFILES_ACTIVE: http2`: Enables the `http2` profile to support HTTP/2 protocol.
*   `JBP_CONFIG_OPEN_JDK_JRE: '{ jre: { version: 17.+ } }'`: Configures the Java Buildpack to use Java 17.

## Deployment to Cloud Foundry

1.  **Build the application:**

    ```bash
    ./gradlew build
    ```

2.  **Login to Cloud Foundry:**

    ```bash
    cf login -a <api_endpoint> -u <username> -o <organization> -s <space>
    ```

3.  **Create service instances (optional):**

    If you want to use a specific database service, create an instance of that service in your Cloud Foundry space.  For example, to create a MySQL service:

    ```bash
    cf create-service p-mysql 100mb spring-music-mysql
    ```

    Repeat this step for MongoDB and Redis if you plan to use those services.

4.  **Push the application:**

    ```bash
    cf push -f manifest.yml
    ```

    The `manifest.yml` file contains the deployment configuration for Cloud Foundry.  You may need to adjust the `path` and `env` properties to match your environment.

    **Important:**  If you are using service bindings, the application will automatically detect the bound services and configure the connection details. No need to manually configure the database connection details when deploying to Cloud Foundry.

## Contributing

We welcome contributions to Spring Music! Please follow these guidelines:

1.  **Fork the repository.**
2.  **Create a new branch for your feature or bug fix.**
3.  **Write clear, concise, and well-documented code.**
4.  **Submit a pull request.** Provide a detailed description of your changes.

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.

```text
Copyright [yyyy] [name of copyright owner]

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

For questions or issues, please contact:

*   [Your Name/Organization]
*   Email: [Your Email Address]
*   GitHub Issues: [Link to GitHub Issues]
```


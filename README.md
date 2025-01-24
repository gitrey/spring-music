```markdown
# Spring Music Sample Application

This application demonstrates how to use database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).  It showcases connecting to various persistence technologies (relational, document, and key-value stores) using Spring's flexible configuration capabilities.


## Table of Contents

* [Description](#description)
* [Technology Stack](#technology-stack)
* [Features](#features)
* [Setup and Installation](#setup-and-installation)
* [Running the Application](#running-the-application)
* [Database Configuration](#database-configuration)
* [Testing](#testing)
* [Contributing](#contributing)
* [License](#license)


## Description

The Spring Music application stores a simple domain object (Album) in different persistence technologies.  While not representing a realistic use case (you'd typically choose one database type), it serves as a valuable tool for testing and experimenting with service bindings on Cloud Foundry. The application employs Spring Java configuration and bean profiles for flexible configuration, along with the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library for Cloud Foundry environment detection.

## Technology Stack

* **Java:** Programming Language
* **Spring Boot:** Framework for building Spring-based applications
* **Spring Data JPA:** Data access abstraction for relational databases
* **Spring Data MongoDB:** Data access abstraction for MongoDB
* **Spring Data Redis:** Data access abstraction for Redis
* **Java CFEnv:** Cloud Foundry environment variable processing library
* **H2, MySQL, PostgreSQL, MSSQL, Oracle (optional):** Supported Relational Databases
* **MongoDB:** Supported NoSQL Document Database
* **Redis:** Supported Key-Value Database


## Features

* **Multiple Database Support:**  Easily switch between different database technologies (MySQL, PostgreSQL, MongoDB, Redis, H2, and optionally Oracle and SQL Server) using Spring Profiles.
* **Service Binding:** Configured to leverage Cloud Foundry's service binding capabilities.
* **Spring Boot Actuator:** Provides monitoring and management endpoints.
* **Web UI:** A simple web interface built using AngularJS and Bootstrap for managing albums.
* **Error Handling:** Includes endpoints for simulating various error conditions (e.g., application crash, heap exhaustion).


## Setup and Installation

1. **Prerequisites:** Ensure you have a working JDK 17+ and Git installed.  You also need Gradle.
2. **Clone the Repository:**
   ```bash
   git clone https://github.com/gitrey/spring-music.git
   cd spring-music
   ```
3. **Build the Application:**
   ```bash
   ./gradlew build
   ```
  This will build the application JAR file.



## Running the Application

1. **Locally (with embedded H2):**
   ```bash
   ./gradlew bootRun
   ```
   This starts the application with an embedded H2 database.


2. **On Cloud Foundry:**
   * You will need a Cloud Foundry environment set up.
   * Create a manifest.yml file to specify application settings.  This example uses `http2`:

      ```yaml
      ---
      applications:
      - name: spring-music
        memory: 1G
        random-route: true
        path: build/libs/spring-music-1.0.jar
        env:
          JBP_CONFIG_SPRING_AUTO_RECONFIGURATION: '{enabled: false}'
          SPRING_PROFILES_ACTIVE: http2  # Choose your database profile here
          JBP_CONFIG_OPEN_JDK_JRE: '{ jre: { version: 17.+ } }'
      ```
   * Push to Cloud Foundry:
      ```bash
      cf push
      ```
   *  Bind the required service (e.g., MySQL, PostgreSQL, MongoDB, Redis) to the application using the `cf bind-service` command.  The `SPRING_PROFILES_ACTIVE` environment variable in `manifest.yml` needs to match the service type.


## Database Configuration

The application supports several databases.  To use a specific database:

1.  **Bind the appropriate service** to your Cloud Foundry application.
2.  **Set the `SPRING_PROFILES_ACTIVE` environment variable** in your `manifest.yml` file to match the service's profile name: `mysql`, `postgres`, `mongodb`, or `redis`. For example, for MySQL: `SPRING_PROFILES_ACTIVE: mysql`

The `application.yml` file contains example configurations for MySQL and PostgreSQL.  The application automatically configures itself based on the bound service.

## Testing

Unit tests are included in the `src/test/java` directory.  Run them using:

```bash
./gradlew test
```


## Contributing

Contributions are welcome!  Please follow standard Git workflow (fork, branch, pull request) and adhere to the project's coding style.


## License

This project is licensed under the Apache License, Version 2.0 - see the [LICENSE](LICENSE) file for details.

```


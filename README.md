```markdown
# Spring Music

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Spring Boot Version](https://img.shields.io/badge/Spring%20Boot-3.1.5-green)](https://spring.io/projects/spring-boot)
[![Java Version](https://img.shields.io/badge/Java-17-orange)](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html)
[![Cloud Foundry](https://img.shields.io/badge/Cloud%20Foundry-Compatible-blue)](https://www.cloudfoundry.org/)

## Description

Spring Music is a sample Spring Boot application designed to demonstrate the use of database services on [Cloud Foundry](http://cloudfoundry.org). It showcases how to configure a Spring application to connect to various persistence technologies, including relational, document, and key-value stores, in a Cloud Foundry environment.

This application is not intended as a blueprint for a real-world application architecture, but rather as a versatile tool for testing and experimenting with different service types available on Cloud Foundry.  It offers a practical example of leveraging the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the Cloud Foundry environment and dynamically configure Spring beans.

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

*   **Multi-Persistence Support:** Demonstrates connecting to relational (MySQL, PostgreSQL, SQL Server, H2), document (MongoDB), and key-value (Redis) stores.
*   **Dynamic Configuration:** Uses [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) to detect and configure services bound to the application in Cloud Foundry.
*   **Spring Boot Integration:** Leverages Spring Boot's auto-configuration and profiles for simplified setup and management.
*   **Web UI:** Provides a simple web interface (AngularJS based) for browsing and managing album data.
*   **Actuator Endpoints:** Includes Spring Boot Actuator endpoints for monitoring and management.
*   **Configurable Profiles:** Utilizes Spring profiles to easily switch between different database configurations.
*   **HTTP/2 Support:** Configurable to run with HTTP/2.

## Installation

To run Spring Music locally or deploy to Cloud Foundry, follow these steps:

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/gitrey/spring-music.git
    cd spring-music
    ```

2.  **Build the application using Gradle:**

    ```bash
    ./gradlew build
    ```

3.  **Deploy to Cloud Foundry (Optional):**

    *   Ensure you have the Cloud Foundry CLI installed and are logged in to your Cloud Foundry environment.
    *   Create the necessary service instances (e.g., a MySQL database, a MongoDB instance, and a Redis instance).
    *   Update the `manifest.yml` file with the correct path to the built JAR file.
    *   Push the application to Cloud Foundry:

        ```bash
        cf push
        ```

## Usage

Once the application is running, access the web UI in your browser. The URL will depend on your deployment environment.

*   **Local:** Typically `http://localhost:8080`
*   **Cloud Foundry:** The application route assigned by Cloud Foundry.

The web UI allows you to:

*   Browse the list of albums.
*   Add new albums.
*   Edit existing albums.
*   Delete albums.
*   Force errors (for testing purposes).

## Configuration

The application can be configured using Spring profiles and environment variables.

*   **Database Profiles:** Activate the appropriate Spring profile (e.g., `mysql`, `postgres`, `mongodb`, `redis`) to connect to the desired database.  If no profile is specified, JPA with H2 will be used. The `application.yml` file contains sample configurations for each database.
*   **Cloud Foundry Service Bindings:** When deployed to Cloud Foundry, the application will automatically detect and configure connections to bound services using the `java-cfenv` library.
*   **Environment Variables:**  You can override configuration properties using environment variables. Refer to the Spring Boot documentation for details.

**Example: Running with a MySQL database locally**

1.  Ensure you have a MySQL database running locally.
2.  Update the `application.yml` file with your MySQL connection details under the `mysql` profile.
3.  Run the application with the `mysql` profile:

    ```bash
    ./gradlew bootRun --args='--spring.profiles.active=mysql'
    ```

**Configuration Files**
* `manifest.yml`: Cloud Foundry deployment configuration. Includes app name, memory allocation, route, buildpack, and environment variables.
* `application.yml`: Spring Boot configuration.  Database connection details, active profiles, and HTTP/2 settings.
* `build.gradle`: Gradle build file. Includes project dependencies, plugins, and build configurations.
* `project.toml`: Paketo buildpack configuration. Disables Spring Cloud Bindings feature.

## Contributing

We welcome contributions! Please follow these steps:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Make your changes and commit them with clear, concise commit messages.
4.  Submit a pull request for review.

Please ensure your code adheres to the project's coding style and includes appropriate unit tests.

## License

Spring Music is licensed under the Apache 2.0 License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions, bug reports, or feature requests, please open an issue on our [GitHub repository](https://github.com/gitrey/spring-music).
```


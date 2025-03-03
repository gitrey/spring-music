```markdown
# Spring Music

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Gradle Build Status](https://img.shields.io/gradle/status/org.cloudfoundry.samples.music/spring-music/main)](https://github.com/gitrey/spring-music/actions/workflows/gradle.yml)
[![Java Version](https://img.shields.io/badge/java-17-green.svg)](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html)
[![Spring Boot Version](https://img.shields.io/badge/Spring%20Boot-3.1.5-brightgreen)](https://spring.io/projects/spring-boot)

## Description

Spring Music is a sample application demonstrating the use of database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

This application is designed to store the same domain objects (Albums) using different persistence technologies including relational, document, and key-value stores. While not representing a typical real-world use case where you'd select a technology best suited for the data, it serves as a valuable tool for testing and experimenting with diverse services on Cloud Foundry.

The application leverages Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and the connection objects required to interact with persistence stores. It utilizes the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. Refer to the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for comprehensive details on configuring a Spring application for Cloud Foundry.

## Table of Contents

- [Description](#description)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

*   **Multi-Persistence Support:**  Demonstrates storing data using JPA, MongoDB and Redis.
*   **Cloud Foundry Ready:**  Designed to be deployed and configured on Cloud Foundry using service bindings.
*   **Spring Boot Configuration:**  Utilizes Spring Boot's auto-configuration and profile features.
*   **Java CFEnv Integration:** Integrates with `java-cfenv` library to simplify accessing Cloud Foundry service information.
*   **REST API:** Provides REST endpoints for managing albums.
*   **Web UI:**  Includes a simple web interface for interacting with the application.

## Installation

1.  **Clone the Repository:**

    ```bash
    git clone https://github.com/gitrey/spring-music.git
    cd spring-music
    ```

2.  **Build the Application:**

    ```bash
    ./gradlew build
    ```

    Alternatively, on Windows:

    ```bash
    gradlew.bat build
    ```

3.  **Deploy to Cloud Foundry (Optional):**

    *   Ensure you have the Cloud Foundry CLI installed and are logged in to your Cloud Foundry environment.
    *   Create service instances for the desired database (MySQL, PostgreSQL, MongoDB, or Redis).
    *   Update the `manifest.yml` file with your application name and service names.
    *   Push the application:

        ```bash
        cf push
        ```

## Usage

### Running Locally

1.  **Configure Database Connection:**

    *   Choose a database (MySQL, PostgreSQL, MongoDB, or Redis).
    *   Update the corresponding profile in `src/main/resources/application.yml` with your database connection details (URL, username, password).
    *   Activate the desired profile by setting the `SPRING_PROFILES_ACTIVE` environment variable.  For example:

        ```bash
        export SPRING_PROFILES_ACTIVE=mysql
        ```

2.  **Run the Application:**

    ```bash
    ./gradlew bootRun
    ```

    Alternatively, on Windows:

    ```bash
    gradlew.bat bootRun
    ```

3.  **Access the Application:**

    *   Open your web browser and navigate to `http://localhost:8080`.

### REST API

The application provides a REST API for managing albums.

*   **GET /albums:**  Retrieve all albums.
*   **PUT /albums:**  Add a new album.
*   **POST /albums:** Update an existing album.
*   **GET /albums/{id}:** Retrieve an album by ID.
*   **DELETE /albums/{id}:** Delete an album by ID.

### Web UI

The web UI allows you to view, add, update, and delete albums. It also provides information about the application and its environment.

## Contributing

We welcome contributions to Spring Music! Please follow these guidelines:

1.  **Fork the Repository** on GitHub.
2.  **Create a new branch** for your feature or bug fix.
3.  **Write clear and concise code**, adhering to the existing code style.
4.  **Submit a pull request** with a detailed description of your changes.

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.

```text
Copyright [2024] [gitrey]

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

*   Open an issue on our [GitHub repository](https://github.com/gitrey/spring-music)
```


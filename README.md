```markdown
# Spring Music

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Spring Boot Version](https://img.shields.io/badge/Spring%20Boot-3.1.5-green)](https://spring.io/projects/spring-boot)
[![Cloud Foundry](https://img.shields.io/badge/Cloud%20Foundry-Ready-blue)](http://cloudfoundry.org)

## Description

Spring Music is a sample application designed to showcase the usage of database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

This application demonstrates storing the same domain objects in a variety of different persistence technologies, including relational, document, and key-value stores.  While this isn't a realistic use case for choosing a specific technology, it serves as a valuable tool for testing and experimenting with diverse services available on Cloud Foundry.

The application leverages Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to manage application configuration and connection objects necessary for interacting with persistence stores. It also utilizes the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library for environment inspection when running on Cloud Foundry.  For comprehensive details on configuring Spring applications for Cloud Foundry, refer to the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html).

## Table of Contents

- [Description](#description)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

*   **Multi-Persistence Support:** Demonstrates the use of JPA (relational), MongoDB (document), and Redis (key-value) data stores.
*   **Cloud Foundry Integration:**  Utilizes Java CFEnv for seamless service binding on Cloud Foundry.
*   **Spring Profiles:** Configured with Spring profiles to easily switch between different database configurations.
*   **REST API:** Provides a RESTful API for managing music albums.
*   **Web UI:**  Includes a web-based user interface built with AngularJS and Bootstrap for interacting with the application.
*   **Error Handling:**  Includes endpoints for testing error handling and application resilience.
*   **HTTP/2 Support:**  Optionally enable HTTP/2 for enhanced performance.

## Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/gitrey/spring-music.git # Replace with your forked repository URL
    cd spring-music
    ```

2.  **Build the application using Gradle:**

    ```bash
    ./gradlew build
    ```

3.  **Deploy to Cloud Foundry:**

    *   Ensure you have the Cloud Foundry CLI installed and are logged in to your Cloud Foundry environment.

    *   Create the necessary service instances (e.g., MySQL, MongoDB, Redis) using the Cloud Foundry Marketplace or CLI.  Refer to the Cloud Foundry documentation for specific service creation instructions.

    *   Update the `manifest.yml` file to reflect the names of your service instances.

    *   Push the application to Cloud Foundry:

        ```bash
        cf push
        ```

    *   Alternatively, you can build and push the image using `bootBuildImage` task:
       ```bash
       ./gradlew bootBuildImage
       cf push spring-music --docker-image docker.io/your-docker-username/spring-music:latest
       ```

## Usage

Once deployed, the application can be accessed through its assigned Cloud Foundry route. The web UI provides functionality for browsing, adding, editing, and deleting music albums.

**API Endpoints:**

*   `/albums` (GET):  Retrieve all albums.
*   `/albums` (PUT):  Add a new album.
*   `/albums` (POST): Update an existing album.
*   `/albums/{id}` (GET): Retrieve an album by ID.
*   `/albums/{id}` (DELETE): Delete an album by ID.
*   `/appinfo`: Retrieves application information such as active profiles and bound services.
*   `/errors/kill`:  Terminates the application instance.
*   `/errors/throw`:  Simulates an exception to test error handling.

**Configuration:**

The application can be configured using environment variables and Spring profiles.  Key configuration options include:

*   `SPRING_PROFILES_ACTIVE`:  Specifies the active Spring profiles (e.g., `mysql`, `mongodb`, `redis`, `http2`).
*   Database connection details (URL, username, password) for the chosen database profile.

See the `application.yml` file for profile-specific configuration details.

## Contributing

We welcome contributions to Spring Music!  Please follow these guidelines:

1.  **Fork the repository.**
2.  **Create a new branch for your feature or bug fix.**
3.  **Write clear and concise code, adhering to the project's style guide.**
4.  **Include unit tests for your changes.**
5.  **Submit a pull request with a detailed description of your changes.**

Before contributing, please review the existing code and documentation.  Adherence to best practices in code quality, testing, and documentation is highly appreciated. See resources like [dora.dev](https://dora.dev/) and [writethedocs.org](https://www.writethedocs.org/) for best practices in documentation and collaboration.

## License

Spring Music is licensed under the Apache 2.0 License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions, bug reports, or feature requests, please:

*   Open an issue on our [GitHub repository](https://github.com/gitrey/spring-music)
```


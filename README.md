```markdown
# Spring Music

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://example.com/build) <!-- Replace with your CI build status link -->
[![Code Coverage](https://img.shields.io/badge/coverage-80%25-green.svg)](https://example.com/coverage) <!-- Replace with your code coverage link -->
[![Java Version](https://img.shields.io/badge/java-17-blue.svg)](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html)
[![Spring Boot Version](https://img.shields.io/badge/Spring%20Boot-3.1.5-brightgreen.svg)](https://spring.io/projects/spring-boot)

## Description

Spring Music is a sample application demonstrating how to use database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

This application showcases the use of various persistence technologies (relational, document, and key-value stores) for storing the same domain objects.  It is not intended to represent a real-world use case where all technologies would be used simultaneously, but rather to provide a platform for testing and experimenting with different types of services available on Cloud Foundry.

The application utilizes Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and the connection objects required for interacting with the persistence stores. It also leverages the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. Refer to the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for detailed instructions on configuring Spring applications for Cloud Foundry.

## Table of Contents

- [Description](#description)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

*   **Multi-Persistence Support:** Demonstrates integration with JPA (various relational databases), MongoDB, and Redis.
*   **Cloud Foundry Ready:**  Designed to run seamlessly on Cloud Foundry with automatic service binding using Java CFEnv.
*   **Spring Profiles:** Leverages Spring profiles for configuration management and service selection.
*   **RESTful API:** Provides a RESTful API for managing albums.
*   **AngularJS Frontend:** Includes a simple AngularJS-based frontend for interacting with the API.
*   **Exception Handling:** Includes error handling and demonstration of crash scenarios.
*   **HTTP/2 Support:** Includes profile to enable HTTP/2 protocol.
## Installation

1.  **Prerequisites:**

    *   Java 17 or higher
    *   Gradle (version specified in `gradle/wrapper/gradle-wrapper.properties`)
    *   Cloud Foundry CLI (optional, for deployment to Cloud Foundry)
    *   A Cloud Foundry environment (optional)
    *   Docker (optional, for running services locally).

2.  **Clone the repository:**

    ```bash
    git clone https://github.com/gitrey/spring-music.git
    cd spring-music
    ```

3.  **Build the application:**

    ```bash
    ./gradlew build
    ```
    This command will compile the code, run the tests, and package the application into a JAR file in the `build/libs` directory.

## Usage

### Running Locally

1.  **Configure a database:** Choose a database (MySQL, PostgreSQL, H2, etc.) and configure its connection details in `src/main/resources/application.yml`.

    *For example, to use MySQL:*

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

    Make sure to create the `music` database in your MySQL instance.

2.  **Run the application:**

    ```bash
    ./gradlew bootRun -Dspring.profiles.active=<database_profile>
    ```

    Replace `<database_profile>` with the appropriate profile name (e.g., `mysql`, `postgres`, `h2`, `mongodb`, `redis`).  For example:

    ```bash
    ./gradlew bootRun -Dspring.profiles.active=mysql
    ```

3.  **Access the application:** Open your web browser and navigate to `http://localhost:8080`.

### Deploying to Cloud Foundry

1.  **Login to Cloud Foundry:**

    ```bash
    cf login -a <api_endpoint> -u <username> -p <password> -o <org> -s <space>
    ```

    Replace placeholders with your Cloud Foundry credentials and environment details.

2.  **Create service instances (optional):** If you plan to use external services like MySQL, MongoDB, or Redis, create service instances in Cloud Foundry *before* pushing the application.
    For example:
      ```bash
      cf create-service mysql <plan_name> mysql-db
      ```
    Where `<plan_name>` is a plan available in your CF marketplace.  Similar commands can be used for mongodb or redis.

3.  **Push the application:**

    ```bash
    cf push
    ```

    The `manifest.yml` file contains the application's deployment configuration.  The application will automatically bind to any matching services.

    If you have not created service instances or don't want automatic service binding, you might want to set `SPRING_PROFILES_ACTIVE` env variable before pushing, e.g.
    ```bash
    cf set-env spring-music SPRING_PROFILES_ACTIVE h2
    cf push
    ```

### Interacting with the Application

Once the application is running, you can interact with it using the provided AngularJS-based frontend or directly via the REST API.

*   **Frontend:** Access the frontend at the application's URL (e.g., `http://spring-music.example.com`).  You can browse, add, update, and delete albums.
*   **REST API:** Use HTTP requests to interact with the API endpoints:

    *   `GET /albums`: Retrieve all albums.
    *   `PUT /albums`: Create a new album.
    *   `POST /albums`: Update an existing album.
    *   `GET /albums/{id}`: Retrieve an album by ID.
    *   `DELETE /albums/{id}`: Delete an album by ID.

## Contributing

We welcome contributions to Spring Music! To contribute, please follow these steps:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Implement your changes, ensuring they are well-tested.
4.  Follow the existing code style.
5.  Submit a pull request.

Please ensure your pull requests include:

*   Clear and concise description of the changes.
*   Relevant tests.
*   Updated documentation, if applicable.

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.

```text
Copyright [2024] [Your Name/Organization]

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

For questions, bug reports, or feature requests, please contact us by:

*   Opening an issue on the GitHub repository.
*   Emailing the maintainers at: [your_email@example.com] (replace with a valid email address).


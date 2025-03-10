```markdown
# Spring Music

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Gradle Build](https://github.com/gitrey/spring-music/actions/workflows/gradle.yml/badge.svg)](https://github.com/gitrey/spring-music/actions/workflows/gradle.yml)

## Description

Spring Music is a sample application demonstrating the use of database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

This application is designed to store the same domain objects across a variety of persistence technologies, including relational, document, and key-value stores. While not representative of a typical production use case (where you would select the most suitable technology for your data), it provides a valuable platform for testing and experimenting with different types of services on Cloud Foundry.

The application uses Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to configure the application and the connection objects required to interact with the different persistence stores. It also leverages the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry. Refer to the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for comprehensive details on configuring a Spring application for Cloud Foundry.

## Table of Contents

- [Description](#description)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

*   **Multi-Persistence Support:** Demonstrates integration with various data stores (relational, document, key-value).
*   **Cloud Foundry Integration:**  Uses Java CFEnv to seamlessly connect to services bound in a Cloud Foundry environment.
*   **Spring Profiles:**  Leverages Spring profiles for environment-specific configuration.
*   **Spring Boot Auto-Configuration Exclusion:**  Dynamically excludes auto-configurations based on active profiles to avoid conflicts.
*   **REST API:** Provides a RESTful interface for managing Album entities.
*   **Sample Data:**  Populates the database with sample album data on startup.
*   **Web UI:** Simple web interface using AngularJS and Bootstrap.
*   **Error Handling:** Demonstrates basic error handling with `/errors` endpoint.

## Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/gitrey/spring-music.git
    cd spring-music
    ```

2.  **Set up your environment:**

    *   Ensure you have a Java Development Kit (JDK) version 17 or higher installed.
    *   Install [Gradle](https://gradle.org/install/) as the build tool.

3.  **Build the application:**

    ```bash
    ./gradlew build
    ```

## Usage

### Running Locally

1.  **Configure a database:**

    *   **Relational (MySQL, PostgreSQL, H2):** Configure the `spring.datasource.*` properties in `src/main/resources/application.yml` and activate the corresponding profile (e.g., `mysql`, `postgres`). Create a database named `music` in your chosen database system.

        ```yaml
        spring:
          config:
            activate:
              on-profile: mysql
          datasource:
            url: "jdbc:mysql://localhost/music"
            driver-class-name: com.mysql.jdbc.Driver
            username: your_mysql_username
            password: your_mysql_password
          jpa:
            properties:
              hibernate:
                dialect: org.hibernate.dialect.MySQL55Dialect
        ```

    *   **MongoDB:** Ensure you have a MongoDB instance running.

    *   **Redis:** Ensure you have a Redis instance running.

2.  **Run the application:**

    ```bash
    ./gradlew bootRun -Dspring.profiles.active=[profile_name]
    ```

    Replace `[profile_name]` with the desired profile (e.g., `mysql`, `mongodb`, `redis`). If no profile is specified, it will default to using JPA with an H2 in-memory database.

3.  **Access the application:**

    *   Open your web browser and navigate to `http://localhost:8080`.
    *   Use the REST API to manage albums (e.g., `http://localhost:8080/albums`).

### Deploying to Cloud Foundry

1.  **Install the Cloud Foundry CLI:** Follow the instructions on the [Cloud Foundry website](https://docs.cloudfoundry.org/cf-cli/install/index.html).

2.  **Connect to your Cloud Foundry instance:**

    ```bash
    cf login -a <api_endpoint> -u <username> -o <organization> -s <space>
    ```

    Replace `<api_endpoint>`, `<username>`, `<organization>`, and `<space>` with your Cloud Foundry credentials.

3.  **Create database service instances (optional):**

    If you want to use a database service other than the default H2 database, create instances of the desired services. For example, to create a MySQL service:

    ```bash
    cf create-service p-mysql 100mb spring-music-mysql
    ```

    Ensure the service names match what your application is expecting.

4.  **Push the application:**

    ```bash
    cf push
    ```

    This command will use the `manifest.yml` file to deploy the application. If you want to specify a different application name or other settings, modify the `manifest.yml` file accordingly.

5.  **Bind services (if not auto-configured):**

    If your application doesn't automatically recognize and bind to the database services, you may need to bind them manually.
    For example, assuming a mysql service is created as above:
    ```bash
    cf bind-service spring-music spring-music-mysql
    cf restage spring-music
    ```
    The Java CFEnv library is supposed to handle this, but may not cover all scenarios.

6.  **Access the application:**

    The Cloud Foundry CLI will output the application URL after the deployment is complete.  Open this URL in your web browser.

## Contributing

We welcome contributions! To contribute to Spring Music, please follow these steps:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Implement your changes and write tests.
4.  Submit a pull request.

Please ensure that your code adheres to the project's coding style and includes appropriate tests.

## License

Spring Music is licensed under the Apache 2.0 License. See the [LICENSE](LICENSE) file for more information.

```
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

If you have any questions, issues, or suggestions, please contact us by:

*   Opening an issue on our [GitHub repository](https://github.com/gitrey/spring-music/issues)

```


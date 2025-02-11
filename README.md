```markdown
# Spring Music: A Sample Application for Cloud Foundry

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Java Version](https://img.shields.io/badge/java-17-green)](https://www.oracle.com/java/technologies/javase-downloads.html)
[![Spring Boot Version](https://img.shields.io/badge/Spring%20Boot-3.1.5-brightgreen)](https://spring.io/projects/spring-boot)

## Description

Spring Music is a sample application designed to demonstrate the use of database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/). It serves as a practical example for configuring Spring applications to connect to various persistence technologies within the Cloud Foundry environment.

The application stores the same domain objects (Albums) across a range of different persistence technologies, including relational, document, and key-value stores.  While this might not represent a typical production use case (where you would carefully choose the most appropriate technology for each data type), it serves a valuable purpose for testing and experimenting with different service offerings on Cloud Foundry.

The application leverages Spring Java configuration and [bean profiles](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-profiles.html) to manage application configuration and connection objects needed to interact with the persistence stores.  It also utilizes the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to introspect the Cloud Foundry environment at runtime, dynamically adapting its configuration based on the available services. For more details on configuring Spring applications for Cloud Foundry, refer to the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html).

## Table of Contents

- [Description](#description)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

*   **Database Service Integration:** Demonstrates connecting to various database services on Cloud Foundry, including:
    *   Relational Databases (MySQL, PostgreSQL, H2, SQL Server, Oracle)
    *   Document Databases (MongoDB)
    *   Key-Value Stores (Redis)
*   **Dynamic Configuration:** Uses Java CFEnv to automatically configure database connections based on service bindings in the Cloud Foundry environment.
*   **Spring Profiles:** Utilizes Spring profiles to activate different database configurations based on the bound services.
*   **Web UI:** Provides a simple web interface (AngularJS based) for managing albums.
*   **REST API:** Exposes a REST API for creating, reading, updating, and deleting albums.
*   **HTTP/2 Support:** Configurable with HTTP/2 using Spring profiles.

## Installation

1.  **Prerequisites:**
    *   Java 17 or higher ([OpenJDK](https://openjdk.java.net/) is recommended)
    *   Gradle (version specified in `gradle/wrapper/gradle-wrapper.properties`)
    *   Cloud Foundry CLI (if deploying to Cloud Foundry)

2.  **Clone the repository:**

    ```bash
    git clone https://github.com/gitrey/spring-music.git
    cd spring-music
    ```

3.  **Build the application:**

    ```bash
    ./gradlew build
    ```

    This will create a `spring-music-1.0.jar` file in the `build/libs` directory.

## Usage

### Running Locally

1.  **Configure Database Connection:**

    *   Choose a database (MySQL, PostgreSQL, H2, MongoDB, Redis, etc.).
    *   Update the `application.yml` file with the appropriate database connection details for your chosen database.  Example configurations are provided within the file.  You will likely need to create the `music` database in your local database server.
    *   Activate the corresponding Spring profile by setting the `SPRING_PROFILES_ACTIVE` environment variable:

        ```bash
        export SPRING_PROFILES_ACTIVE=<your_profile>  # e.g., mysql, postgres, redis
        ```

2.  **Run the application:**

    ```bash
    ./gradlew bootRun
    ```

    Alternatively, you can run the packaged JAR file:

    ```bash
    java -jar build/libs/spring-music-1.0.jar
    ```

3.  **Access the application:**

    Open your web browser and navigate to `http://localhost:8080`.

### Deploying to Cloud Foundry

1.  **Create Database Services:**

    Create the necessary database services in your Cloud Foundry space (e.g., using the `cf create-service` command).  Example:

    ```bash
    cf create-service p-mysql 512mb my-mysql
    ```

2.  **Push the application:**

    ```bash
    cf push
    ```

    This will use the `manifest.yml` file to deploy the application.  If you need to bind services manually:

    ```bash
    cf push -n <app_name> -m 1G --no-start
    cf bind-service <app_name> <service_name>  # Repeat for each service
    cf start <app_name>
    ```

3. **Configure HTTP/2 (Optional)**

   To enable HTTP/2 support, set the `SPRING_PROFILES_ACTIVE` environment variable to `http2` when pushing to Cloud Foundry (as shown in the `manifest.yml`):

   ```yaml
   env:
     SPRING_PROFILES_ACTIVE: http2
   ```

4.  **Access the application:**

    After the application is successfully deployed, Cloud Foundry will provide a URL to access the application (e.g., `spring-music.your-cf-domain.com`).

## Contributing

We welcome contributions to Spring Music! To contribute, please follow these steps:

1.  **Fork the repository.**
2.  **Create a new branch for your feature or bug fix.**
3.  **Implement your changes.**
4.  **Write unit tests for your changes.**
5.  **Submit a pull request.**

Please ensure that your code adheres to the existing code style and includes appropriate documentation.

## License

Spring Music is licensed under the Apache 2.0 License. See the `LICENSE` file for more information.

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

For questions, bug reports, or feature requests, please open an issue on the GitHub repository.
```


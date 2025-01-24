# Spring Music Sample Application

This project demonstrates how to use database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).  It showcases the integration of multiple persistence technologies (relational, document, and key-value stores) within a single application.


## Table of Contents

* [Description](#description)
* [Features](#features)
* [Technology Stack](#technology-stack)
* [Installation](#installation)
* [Running the Application](#running-the-application)
* [Configuration](#configuration)
* [Testing](#testing)
* [Contributing](#contributing)
* [License](#license)


## Description

The Spring Music application stores sample album data using different persistence mechanisms. This is primarily a demonstration of how to connect to various database services on Cloud Foundry and manage the configuration differences.  It's not intended as a best practice for real-world data modeling, as you would typically choose a single database technology appropriate for your specific needs.


## Features

* **Multiple Database Support:**  Connects to and interacts with H2, MySQL, PostgreSQL, SQL Server, MongoDB, and Redis databases depending on the bound services.
* **Spring Boot Configuration:** Uses Spring Boot's auto-configuration and bean profiles for flexible database configuration.
* **Java CFEnv Integration:** Leverages the `java-cfenv` library to access Cloud Foundry environment variables and service credentials.
* **RESTful API:** Exposes a RESTful API for managing album data.
* **Web UI:**  Includes a simple web UI (built with AngularJS and Bootstrap) for interacting with the API.
* **Error Handling:** Demonstrates error handling and graceful shutdown capabilities.
* **Application Information Endpoint:**  Provides information about active profiles and connected services.


## Technology Stack

* **Java 17:**  The programming language.
* **Spring Boot 3.1.5:**  The application framework.
* **Spring Data JPA, MongoDB, Redis:**  Data access layers.
* **H2, MySQL, PostgreSQL, SQL Server, MongoDB, Redis:** Supported databases.
* **AngularJS, Bootstrap, jQuery:**  Frontend technologies.
* **Java CFEnv:** Cloud Foundry environment variable access.



## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/[your-github-username]/spring-music.git
   ```

2. **Navigate to the project directory:**

   ```bash
   cd spring-music
   ```

3. **Build the application (requires Gradle):**

   ```bash
   ./gradlew build
   ```


## Running the Application

1. **Locally (with bound databases):**  You can run the application locally if you have the necessary databases running. Configure the `application.yml` file appropriately.

2. **On Cloud Foundry:**  Deploy the application to Cloud Foundry. The `manifest.yml` file specifies the necessary deployment parameters.  Ensure you have a Cloud Foundry CLI installed and configured, then run:


   ```bash
   cf push
   ```


## Configuration

The application uses Spring profiles to switch between different database configurations.  The `application.yml` file contains configurations for multiple databases.  The active profile is determined by the presence of bound Cloud Foundry services.  You can override profiles using the `SPRING_PROFILES_ACTIVE` environment variable.  See `application.yml` for database connection details.


## Testing

Unit and integration tests are included in the `src/test/java` directory.  To run tests, execute:

```bash
./gradlew test
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.  Before contributing, please review the [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines.


## License

This project is licensed under the Apache License, Version 2.0 - see the [LICENSE](LICENSE) file for details.


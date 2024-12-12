## Spring Music - A Cloud Foundry Sample Application

This repository contains a sample application for using database services on Cloud Foundry with the Spring Framework and Spring Boot.

**[![Build Status](https://travis-ci.org/cloudfoundry-samples/spring-music.svg?branch=master)](https://travis-ci.org/cloudfoundry-samples/spring-music)**

### Overview

This application demonstrates how to store domain objects using different persistence technologies - relational, document, and key-value stores - in a Cloud Foundry environment. It uses Spring Java configuration and bean profiles to configure the application and the connection objects needed to interact with the persistence stores.

**Key Features:**

* **Multi-Store Support:**  Stores data in MySQL, PostgreSQL, MongoDB, Redis, and H2 databases.
* **Spring Boot:** Leverages the convenience of Spring Boot for simplified application setup.
* **Cloud Foundry Integration:** Employs the Java CFEnv library for Cloud Foundry environment detection and service binding.
* **Web UI:** Provides a basic web UI for viewing and managing data.
* **Error Handling:**  Includes error handling features like forced exceptions and application termination.
* **Information Endpoint:**  Exposes an endpoint to display application and service information.

**This application is a great starting point for exploring and experimenting with different database services on Cloud Foundry.**

### Getting Started

1. **Prerequisites:**
   * Java Development Kit (JDK) 17+
   * [Cloud Foundry CLI](https://docs.cloudfoundry.org/devguide/installcli.html)
   * [Gradle](https://gradle.org/install/)

2. **Clone the Repository:**
   ```bash
   git clone https://github.com/cloudfoundry-samples/spring-music.git
   ```

3. **Build the Application:**
   ```bash
   cd spring-music
   ./gradlew build
   ```

4. **Deploy to Cloud Foundry:**
   * **Push the application using the Cloud Foundry CLI:**
      ```bash
      cf push spring-music
      ```
   * **Bind services to the application:**
      * **MySQL:** `cf bind-service <mysql-service-name> spring-music`
      * **PostgreSQL:** `cf bind-service <postgres-service-name> spring-music`
      * **MongoDB:** `cf bind-service <mongodb-service-name> spring-music`
      * **Redis:** `cf bind-service <redis-service-name> spring-music`
      * **Oracle:** `cf bind-service <oracle-service-name> spring-music`
      * **SQL Server:** `cf bind-service <sqlserver-service-name> spring-music`

5. **Access the Application:**
   * Open the URL displayed in the Cloud Foundry CLI output after deployment.

### Configuration

* **Database Service Binding:** Cloud Foundry automatically injects service credentials into the environment. Spring Boot uses these credentials to connect to the bound database.
* **Active Profile:** The application uses the `SPRING_PROFILES_ACTIVE` environment variable to activate different profiles, enabling support for the appropriate persistence technology. For example, setting `SPRING_PROFILES_ACTIVE=mysql` will configure the application to use MySQL. 

### Contributing

Contributions are welcome! Please follow the guidelines in [CONTRIBUTING.md](CONTRIBUTING.md).

### License

Spring Music is licensed under the Apache License, Version 2.0. See the [LICENSE](LICENSE) file for details.


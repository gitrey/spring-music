## Spring Music Sample Application

This repository contains a sample application demonstrating the use of database services on Cloud Foundry with the Spring Framework and Spring Boot.

### Overview

This application is designed to store a simple domain model (`Album`) in different persistence technologies:

- Relational databases (MySQL, PostgreSQL, SQL Server, H2)
- Document databases (MongoDB)
- Key-value stores (Redis)

It uses Spring Java configuration and bean profiles to manage the database connections based on the service bound to the application.

### Features

- **Multiple persistence technologies:**  The application can use different database technologies by binding the respective Cloud Foundry service.
- **Spring Java configuration:**  Configuration is managed using Spring's annotation-driven approach.
- **Bean profiles:** Different profiles are used to activate the appropriate database configuration.
- **Java CFEnv:** The application leverages the `java-cfenv` library to inspect the Cloud Foundry environment and discover bound services.

### Prerequisites

- **Cloud Foundry CLI:** [https://docs.cloudfoundry.org/devguide/installcli/](https://docs.cloudfoundry.org/devguide/installcli/)
- **Java Development Kit (JDK) 17 or higher:**  [https://www.oracle.com/java/technologies/javase-downloads.html](https://www.oracle.com/java/technologies/javase-downloads.html)
- **Gradle:** [https://gradle.org/install/](https://gradle.org/install/)

### Running the Application

1. **Configure the application:**
   - Replace placeholders for database credentials in the `application.yml` file.
   - Adjust the `SPRING_PROFILES_ACTIVE` property in the `manifest.yml` file to match the desired database technology.

2. **Deploy to Cloud Foundry:**
   - Create a Cloud Foundry service instance for your preferred database technology.
   - Bind the service instance to the `spring-music` application.
   - Push the application using the `cf push` command.

```bash
cf push spring-music
```

3. **Access the application:**
   - Once deployed, you can access the application via the generated URL.
   - The `/albums` endpoint provides REST API access for managing albums.

### Development & Testing

1. **Start the application locally:**
   - Use the `gradle bootRun` command to run the application in a local development environment.
   - The default profile (no profile specified) uses an embedded H2 database for local testing.

2. **Run unit and integration tests:**
   - Execute the `gradle test` command to run the tests.

### Documentation

- [Cloud Foundry Documentation](https://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html)
- [Spring Framework](https://spring.io)
- [Spring Boot](https://projects.spring.io/spring-boot/)
- [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/)

### Contributing

Contributions are welcome! Please fork this repository, make your changes, and submit a pull request.

### License

This application is released under the Apache 2.0 License.

### Contact

If you have any questions or need assistance, please feel free to open an issue in the repository.


## Spring Music: A Spring Boot Application for Cloud Foundry

This repository contains a Spring Boot application demonstrating various database service integrations on Cloud Foundry.

## Description

This application showcases how to use Spring Boot to connect to and interact with different database services on Cloud Foundry. It utilizes Spring's bean profiles to dynamically configure the application for various persistence technologies, including:

- Relational databases (MySQL, PostgreSQL, SQL Server)
- Document databases (MongoDB)
- Key-value stores (Redis)

This example is designed for testing and experimenting with different types of services, not necessarily for building a real-world application that would typically choose a single service based on its data needs.

## Features

- **Database Service Integration:** The application demonstrates connecting to and utilizing various database services.
- **Spring Profiles:** Uses Spring profiles for conditional configuration based on the bound service.
- **Java CFEnv:** Utilizes the Java CFEnv library to inspect the Cloud Foundry environment.
- **Service Binding:** Configured to leverage Cloud Foundry service bindings for easy connection setup.

## Installation

1. **Prerequisites:** Ensure you have Java 17 and [Cloud Foundry CLI](https://cli.cloudfoundry.org/) installed.
2. **Clone Repository:** Clone this repository to your local machine.
3. **Build the application:** Navigate to the project directory and run `gradle build`.

## Deployment

1. **Create a Cloud Foundry app:** `cf push spring-music`
2. **Bind a service:** `cf bind-service spring-music <service-name>` (replace `<service-name>` with your service instance).
3. **Start the application:** `cf start spring-music`

## Configuration

- **Database Connection:** The application is configured to use database service credentials from Cloud Foundry service bindings.
- **Spring Profiles:** You can specify the service type by setting the `SPRING_PROFILES_ACTIVE` environment variable. 
    - For example: `SPRING_PROFILES_ACTIVE=mysql` to use MySQL.

## Usage

Once deployed, the application can be accessed via the following endpoints:

- **`/albums`:**
    - **GET:** List all albums.
    - **PUT:** Add a new album.
    - **POST:** Update an album.
    - **DELETE:** Delete an album.
- **`/albums/{id}`:** Get an album by ID.
- **`/info/appinfo`:** Retrieve information about the active profiles and bound services.
- **`/info/service`:** Show details about all bound services.
- **`/errors/kill`:** Force the application to exit.
- **`/errors/throw`:** Force an exception to be thrown.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any feature requests, bug fixes, or improvements.

## License

This project is licensed under the Apache 2.0 License.

## Contact

For any questions or feedback, feel free to open an issue on the GitHub repository.


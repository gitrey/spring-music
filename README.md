## Spring Music: A Cloud Foundry Sample Application

This repository provides a sample application showcasing the use of database services on Cloud Foundry with Spring Framework and Spring Boot.

## Description

This application demonstrates how to store the same domain objects in various persistence technologies: relational, document, and key-value stores. It utilizes Spring Java configuration and bean profiles to configure the application and its connection objects. The application also leverages the Java CFEnv library to inspect the environment when running on Cloud Foundry.

**This is not a realistic use case for choosing different persistence technologies, as you'd normally select the best suited technology for your data.** However, it's a valuable tool for testing and experimenting with various services on Cloud Foundry.

## Features

- Uses multiple persistence technologies:
    - Relational database (MySQL, PostgreSQL, SQL Server, etc.)
    - Document database (MongoDB)
    - Key-value store (Redis)
- Leverages Spring Boot and Spring Data for simplified data access.
- Employs Spring profiles to activate different configurations for different services.
- Utilizes the Java CFEnv library for environment detection on Cloud Foundry.
- Includes a web UI for managing album data (CRUD operations).

## Installation

1. Ensure you have Java 17 and a suitable build tool (Gradle) installed.
2. Clone the repository: `git clone https://github.com/your-username/spring-music.git`
3. Navigate to the project directory: `cd spring-music`
4. Build the application: `./gradlew build`

## Usage

### Running Locally

1. **Choose a persistence technology:**
    - **Relational Database:** Set the `SPRING_PROFILES_ACTIVE` environment variable to `mysql`, `postgres`, or `sqlserver`, depending on your choice.
    - **Document Database:** Set `SPRING_PROFILES_ACTIVE` to `mongodb`.
    - **Key-value Store:** Set `SPRING_PROFILES_ACTIVE` to `redis`.
2. **Start the application:** `./gradlew bootRun`
3. Access the web UI at `http://localhost:8080`

### Deploying to Cloud Foundry

1. **Create a Cloud Foundry space:** `cf create-space spring-music-space`
2. **Target the space:** `cf target -s spring-music-space`
3. **Push the application:** `cf push`
4. **Bind services:** Bind the required service (e.g., `mysql`, `mongodb`, `redis`) to your application. Refer to the Cloud Foundry documentation for specific service binding instructions.

## Contributing

We welcome contributions! Please refer to the [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines.

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.

## Contact

For questions or issues, please open a new issue on the GitHub repository.


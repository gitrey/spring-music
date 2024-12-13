# Spring Music - Cloud Foundry Sample Application

This repository provides a Spring Boot application showcasing the use of different database services on Cloud Foundry.

## Overview

The Spring Music application demonstrates how to connect to and store data in various database technologies, including:

- **Relational Databases:** MySQL, PostgreSQL
- **NoSQL Databases:** MongoDB, Redis

The application stores the same domain objects (albums) in each database, enabling you to experiment with different persistence options.

## Features

- **Multiple Database Support:** Utilizes Spring Boot auto-configuration to seamlessly connect to different database services.
- **Service Bindings:** Leverages Cloud Foundry service bindings to connect to the chosen database service.
- **Bean Profiles:** Uses Spring profiles to activate configurations for the selected database technology.
- **Cloud Foundry Environment:** Employs the Java CFEnv library to access and inspect the Cloud Foundry environment.
- **Web Interface:** Provides a basic web application (built with AngularJS) to interact with the database and view album data.

## Getting Started

1. **Install Cloud Foundry:** Follow the instructions at [https://docs.cloudfoundry.org/](https://docs.cloudfoundry.org/) to install and configure Cloud Foundry.
2. **Install Java:** Ensure that you have a supported version of Java (JDK 17+).
3. **Clone Repository:** Clone this repository to your local machine.
4. **Configure Database Services:**
    - Create instances of the desired database service (e.g., `cf create-service <service-name> <plan>`) in your Cloud Foundry environment.
    - Note the service names for use in the `manifest.yml` file.
5. **Update `manifest.yml`:** Modify the `manifest.yml` file to include the created service names and set the `SPRING_PROFILES_ACTIVE` variable to the desired database profile (e.g., `mongodb`, `postgres`, `mysql`, `redis`).
6. **Deploy to Cloud Foundry:** Push the application to Cloud Foundry using the `cf push` command.

## Running Locally

1. **Configure Database Connections:** If you don't have Cloud Foundry, set up the appropriate database connections locally (MySQL, PostgreSQL, MongoDB, Redis).
2. **Update `application.yml`:** Adjust the `application.yml` file to match your local database connection settings.
3. **Run the Application:** Execute the command `./gradlew bootRun` to launch the application.

## Contributing

Contributions are welcome! Please refer to the [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines.

## License

This project is licensed under the Apache 2.0 License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or feedback, please contact us at:

- Email: support@cymbal.coffee
- GitHub Issues: [link to GitHub repository]


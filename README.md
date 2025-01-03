## Spring Music - A Sample Spring Boot Application on Cloud Foundry

This repository contains a sample application demonstrating how to use database services on Cloud Foundry with the Spring Framework and Spring Boot.

## Overview

The Spring Music application allows you to store the same domain objects (albums) in various persistence technologies:

- **Relational Database:** MySQL, PostgreSQL, SQL Server, H2
- **Document Database:** MongoDB
- **Key-Value Store:** Redis

This application is ideal for testing and experimenting with different data persistence options on Cloud Foundry. While not representing a realistic use case for choosing one specific persistence technology, it offers a valuable learning tool.

## Key Features

- **Spring Boot:** The application utilizes Spring Boot for rapid application development and ease of deployment.
- **Spring Data:** Leverages Spring Data JPA, Spring Data MongoDB, and Spring Data Redis for simplified data access.
- **Java CFEnv:**  Uses the Java CFEnv library to inspect the environment on Cloud Foundry.
- **Bean Profiles:** Employs Spring bean profiles to configure the application and its persistence connections based on the bound service.
- **Cloud Foundry Service Bindings:** Supports service bindings for connecting to the database services.

## Prerequisites

- **Java Development Kit (JDK) 17 or later:** Make sure you have a compatible JDK installed.
- **Cloud Foundry CLI:** Install the Cloud Foundry CLI to interact with Cloud Foundry.
- **Spring Boot CLI (Optional):** For optional convenience in building and running the application.

## Installation and Deployment

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/gitrey/spring-music.git
   cd spring-music
   ```

2. **Build the Application:**
   ```bash
   ./gradlew bootBuildImage
   ```

3. **Push to Cloud Foundry:**
   ```bash
   cf push
   ```

   - **Note:** You can customize the application name and other settings in the `manifest.yml` file.

## Running Locally

1. **Set JAVA_HOME:** Ensure you have the `JAVA_HOME` environment variable set to the path of your JDK installation.
2. **Build the application:**
   ```bash
   ./gradlew bootRun
   ```
   - **Note:** You will need to configure your local database (e.g., MySQL, PostgreSQL, etc.) manually before running the application locally.

## Exploring the Code

- **`Application.java`:** The main application entry point.
- **`config/SpringApplicationContextInitializer.java`:** Configures the application based on the bound services.
- **`domain/Album.java`:** Represents the domain object (album) stored in the databases.
- **`repositories`:** Contains the repository interfaces for each persistence technology.
- **`web`:** Contains the REST controller for managing albums and other controllers.
- **`static/js`:** Contains the JavaScript code for the front-end web application.
- **`static/templates`:**  Contains the HTML templates for the web application.
- **`application.yml`:** Contains application configuration settings.

## Contributing

We welcome contributions! To contribute, please:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and write comprehensive tests.
4. Commit your changes and push to your branch.
5. Submit a pull request for review.

Please follow our style guide and adhere to best practices when contributing.

## License

This application is licensed under the Apache License, Version 2.0.

## Support

For any questions, suggestions, or issues, please contact us by opening an issue in this repository.


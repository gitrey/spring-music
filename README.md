# Spring Music: A Sample Application for Cloud Foundry Services

[![GitHub license](https://img.shields.io/github/license/pivotal-cf/spring-music)](https://github.com/pivotal-cf/spring-music/blob/master/LICENSE)

## Description

This repository contains a sample application for showcasing the use of various database services offered by Cloud Foundry. It demonstrates how to integrate [Spring Framework](https://spring.io/) and [Spring Boot](https://spring.io/projects/spring-boot/) to interact with different persistence technologies:

* **Relational Databases:** MySQL, PostgreSQL
* **Document Database:** MongoDB
* **Key-Value Store:** Redis

The application stores identical domain objects (Albums) in each persistence technology, allowing you to experiment and compare their strengths and weaknesses.

## Features

* **Multiple Persistence Technologies:** Supports various database services offered by Cloud Foundry.
* **Spring Java Configuration:** Uses Spring Java configuration with bean profiles for flexible environment management.
* **Cloud Foundry Integration:** Leverages the `java-cfenv` library to interact with Cloud Foundry environment variables.
* **Service Binding:** Demonstrates service binding with Cloud Foundry to connect to different database services.
* **Spring Boot Actuator:** Provides endpoint for health checks and other application metrics.

## Getting Started

### Prerequisites

* [Java Development Kit (JDK)](https://www.oracle.com/java/technologies/javase-downloads.html): You need to have JDK 17 or higher installed.
* [Cloud Foundry CLI](https://docs.cloudfoundry.org/cli/install-go-cli.html): Install the Cloud Foundry CLI for deployment.
* [Git](https://git-scm.com/downloads): Download and install Git for version control.

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/pivotal-cf/spring-music.git
   cd spring-music
   ```

2. **Build the application:**
   ```bash
   ./gradlew build
   ```

### Deployment

1. **Target your Cloud Foundry environment:**
   ```bash
   cf api <your-cloudfoundry-api-endpoint>
   cf login -u <your-cloudfoundry-username> -p <your-cloudfoundry-password> -o <your-cloudfoundry-organization> -s <your-cloudfoundry-space>
   ```

2. **Create and bind services:**
   * **MySQL:**
     ```bash
     cf create-service mysql <mysql-service-plan> <mysql-service-name>
     ```
   * **PostgreSQL:**
     ```bash
     cf create-service postgres <postgres-service-plan> <postgres-service-name>
     ```
   * **MongoDB:**
     ```bash
     cf create-service mongodb <mongodb-service-plan> <mongodb-service-name>
     ```
   * **Redis:**
     ```bash
     cf create-service redis <redis-service-plan> <redis-service-name>
     ```

3. **Deploy the application:**
   ```bash
   cf push
   ```

4. **Access the application:**
   The application will be accessible at the URL provided by Cloud Foundry.

## Running the Application Locally

1. **Set environment variables:**
    For local development, you need to manually set environment variables corresponding to your database credentials and service instances. For example, for using MySQL:
    ```bash
    export SPRING_PROFILES_ACTIVE=mysql
    export SPRING_DATASOURCE_URL=jdbc:mysql://localhost:3306/music
    export SPRING_DATASOURCE_USERNAME=<your-mysql-username>
    export SPRING_DATASOURCE_PASSWORD=<your-mysql-password>
    ```

2. **Run the application:**
    ```bash
    ./gradlew bootRun
    ```

    The application will start and run on your local machine.

## Configuration

### Application Profiles

The application uses Spring profiles to configure different data sources based on the services bound to the application. You can activate a specific profile by setting the `SPRING_PROFILES_ACTIVE` environment variable.

* **`mysql`:** Activate this profile when using a MySQL service.
* **`postgres`:** Activate this profile when using a PostgreSQL service.
* **`mongodb`:** Activate this profile when using a MongoDB service.
* **`redis`:** Activate this profile when using a Redis service.

### Customizing Configuration

You can customize the application's configuration by editing the `application.yml` file. This file provides settings for:

* Database connections (URL, username, password)
* Spring Data JPA properties
* Spring Boot Actuator settings

## Contributing

Contributions to the `spring-music` sample application are welcome! Please follow these guidelines:

1. **Fork the repository.**
2. **Create a new branch for your feature or bug fix.**
3. **Make your changes and commit them with a clear and concise message.**
4. **Push your changes to your fork.**
5. **Submit a pull request to the main repository.**

## License

This project is licensed under the Apache 2.0 License.

## Disclaimer

This project is a sample application and is not intended for production use. It is designed for educational and experimental purposes only.


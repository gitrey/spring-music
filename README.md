# Spring Music

This is a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

## Overview

This application demonstrates how to use various persistence technologies (relational, document, and key-value stores) with Spring Boot and Cloud Foundry. It stores the same domain objects in each technology to showcase how they can be integrated within a single application. While not representing a realistic use case (since you typically choose the best technology based on your data), it's useful for experimenting and testing different persistence options on Cloud Foundry.

## Technologies Used

* **Spring Boot:** Simplifies web application development by providing auto-configuration, embedded servers, and dependency management.
* **Spring Data JPA, Spring Data MongoDB, Spring Data Redis:** Abstractions for interacting with different persistence technologies.
* **Java CFEnv:** Library for inspecting the environment when running on Cloud Foundry.
* **H2 Database, MySQL, PostgreSQL, Redis, MongoDB:** Different persistence technologies for storing application data.

## Features

* **Multiple Persistence Options:** The application demonstrates storing data in different technologies:
    * Relational Databases (H2, MySQL, PostgreSQL)
    * Document Database (MongoDB)
    * Key-Value Store (Redis)
* **Spring Boot Profiles:**  Uses Spring Boot profiles to switch between different data sources based on the environment.
* **Cloud Foundry Service Bindings:** Leverages Cloud Foundry service bindings to configure data sources dynamically.
* **Java CFEnv Integration:** Utilizes Java CFEnv to detect available Cloud Foundry services and connect to them.

## Getting Started

### Prerequisites

* **Java Development Kit (JDK) 17:** Ensure that you have JDK 17 installed and set up on your system.
* **Cloud Foundry CLI:** Install the Cloud Foundry command-line interface.
* **Cloud Foundry Account:** Create a Cloud Foundry account.

### Installation and Setup

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/gitrey/spring-music.git
   cd spring-music
   ```

2. **Build the Application:**
   ```bash
   ./gradlew build
   ```

3. **Push to Cloud Foundry:**
   * **Create a Cloud Foundry Application:**
     ```bash
     cf push spring-music -p build/libs/spring-music-1.0.jar
     ```
   * **Bind Services:**
     * **Redis:**
       ```bash
       cf bind-service <redis_service_instance_name> spring-music
       ```
     * **MongoDB:**
       ```bash
       cf bind-service <mongodb_service_instance_name> spring-music
       ```
     * **MySQL:**
       ```bash
       cf bind-service <mysql_service_instance_name> spring-music
       ```
     * **PostgreSQL:**
       ```bash
       cf bind-service <postgresql_service_instance_name> spring-music
       ```

4. **Access the Application:** Once the application is deployed and services are bound, you can access it using the Cloud Foundry application URL (e.g., http://spring-music.cfapps.io).

## Development and Testing

1. **Run the Application Locally:**
   ```bash
   ./gradlew bootRun
   ```
   * **Choose a Profile:** You can specify a profile to run locally:
     ```bash
     ./gradlew bootRun -Pspring.profiles.active=mongodb
     ```
   * **Local Database Configuration:** If running locally, configure the appropriate database connection information in the `application.yml` file for the selected profile.

2. **Testing:** The project includes basic unit tests. You can run them using:
   ```bash
   ./gradlew test
   ```

## Contributing

We welcome contributions! Please follow our style guide and submit pull requests for review:

* **Contribution Guidelines:** [link to contribution guidelines]

## License

This project is licensed under the Apache 2.0 License.

## Contact

* Email: support@cymbal.coffee
* GitHub Repository: [link to GitHub repository]

Please feel free to reach out with any questions or feedback. We appreciate your interest in Spring Music!


# Spring Music

This is a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

## Description

This application demonstrates how to store the same domain objects in one of a variety of different persistence technologies - relational, document, and key-value stores. It's designed to test and experiment with different types of services on Cloud Foundry, though it's not meant to represent a realistic use case for these technologies.

## Features

* **Multiple persistence technologies:**  The application supports MySQL, PostgreSQL, MongoDB, and Redis as database options.
* **Spring Profiles:** Uses Spring profiles to switch between different persistence technologies.
* **Cloud Foundry Service Binding:**  Leverages Cloud Foundry's service binding capabilities for seamless connection to services.
* **Java CFEnv:** Uses the Java CFEnv library to inspect the environment on Cloud Foundry.
* **Web Interface:** Provides a simple web interface for managing albums (adding, updating, deleting).
* **Error Handling:** Includes features to force errors and exceptions for testing.
* **Actuator:** Enables Spring Boot Actuator endpoints for monitoring and management.

## Installation

### Prerequisites

* Java JDK 17 or later
* Gradle
* Cloud Foundry CLI

### Steps

1. Clone the repository: `git clone https://github.com/gitrey/spring-music.git`
2. Build the application: `./gradlew build`
3. Push the application to Cloud Foundry: `cf push spring-music`

## Usage

Once deployed, you can access the application using the URL provided by Cloud Foundry.

### Database Selection

The application automatically detects the bound service and configures the appropriate persistence technology based on the service type.

### Web Interface

The web interface allows you to:

* View a list of albums
* Add new albums
* Edit existing albums
* Delete albums

### Error Handling

The application provides endpoints for testing error handling:

* `/errors/kill`: Terminates the application
* `/errors/throw`: Throws a NullPointerException

## Contributing

We welcome contributions to Spring Music!

### Guidelines

* Fork the repository.
* Create a new branch for your changes.
* Submit a pull request.

## License

Spring Music is licensed under the Apache 2.0 License.

## Contact

For any questions or feedback, please open an issue on the GitHub repository. 

##  Architecture

The application consists of the following components:

* **Domain:** Defines the `Album` entity.
* **Repository:** Implements data access logic for the `Album` entity, with different implementations for each persistence technology.
* **Web Controller:** Provides REST endpoints for managing albums.
* **UI:** A simple web interface built with AngularJS.
* **Configuration:** Handles service binding, profile selection, and auto-configuration.

This structure allows for easy extensibility and allows developers to experiment with different database options without changing the core application logic.

##  Further Development

* **Adding New Persistence Technologies:**  You can extend the application to support other database technologies by implementing a new repository and configuring the appropriate Spring profile.
* **Improving the UI:** Enhance the web interface with features like pagination, sorting, and filtering.
* **Adding More Features:**  Implement new features for managing music data, such as adding artists, tracks, or playlists.
* **Adding Tests:**  Write more tests to ensure code quality and stability.

This sample application provides a foundation for building more sophisticated applications that leverage different data storage options on Cloud Foundry.


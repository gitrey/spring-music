# Spring Music

This is a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

## Description

This application has been built to store the same domain objects in one of a variety of different persistence technologies - relational, document, and key-value stores. This is not meant to represent a realistic use case for these technologies, since you would typically choose the one most applicable to the type of data you need to store, but it is useful for testing and experimenting with different types of services on Cloud Foundry.

## Features

- **Multiple Persistence Technologies:** Supports H2, MySQL, PostgreSQL, MongoDB, and Redis.
- **Spring Boot:** Leverages the power and simplicity of Spring Boot for rapid application development.
- **Cloud Foundry Service Bindings:** Utilizes Cloud Foundry service bindings for easy integration with different data stores.
- **Web UI:** Provides a simple web interface for managing and viewing music albums.
- **Java CFEnv Library:** Uses the Java CFEnv library to inspect the environment when running on Cloud Foundry.

## Installation

1. **Install Java:** Ensure you have a compatible version of Java installed (Java 17 or later).
2. **Clone the repository:**
   ```bash
   git clone https://github.com/gitrey/spring-music.git
   cd spring-music
   ```
3. **Build the application:**
   ```bash
   ./gradlew build
   ```

## Running the Application

### Locally

1. **Configure a database:**  Set up a database according to the desired profile (e.g., MySQL, PostgreSQL, MongoDB, Redis).
2. **Set the `SPRING_PROFILES_ACTIVE` environment variable:**
   ```bash
   export SPRING_PROFILES_ACTIVE=<profile_name>
   ```
   (Replace `<profile_name>` with the desired profile - `mysql`, `postgres`, `mongodb`, `redis`, `oracle`, or `sqlserver`.)
3. **Run the application:**
   ```bash
   ./gradlew bootRun
   ```

### On Cloud Foundry

1. **Create a Cloud Foundry service:** Create a service instance for the desired database type.
2. **Push the application:**
   ```bash
   cf push
   ```

## Contributing

Contributions are welcome! Please follow these steps:

1. **Fork the repository.**
2. **Create a new branch** for your changes.
3. **Write tests** to ensure your changes don't break existing functionality.
4. **Follow the existing code style.**
5. **Submit a pull request** for review.

## License

Spring Music is licensed under the Apache 2.0 License. See the [LICENSE](LICENSE) file for more details.

## Contact

If you have any questions or feedback, please feel free to open an issue on the GitHub repository.


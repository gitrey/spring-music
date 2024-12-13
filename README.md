# Spring Music

This is a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

## Project Overview

This application is designed to demonstrate storing the same domain objects in a variety of persistence technologies: relational, document, and key-value stores. While not representing a realistic use case for these technologies in a production environment, it offers a valuable platform for testing and experimentation with different service types on Cloud Foundry.

## Features

* **Multi-persistence support:** The application utilizes different persistence technologies (JPA, MongoDB, and Redis) to store the same domain objects (albums).
* **Spring Java Configuration:** Spring Java configuration is used to configure the application and the connection objects required for persistence.
* **Bean Profiles:** Spring profiles provide a mechanism to activate specific configurations based on the chosen persistence technology.
* **Cloud Foundry Environment Integration:** The application leverages the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the environment when running on Cloud Foundry.

## Getting Started

### Prerequisites

* Java Development Kit (JDK) 17+
* [Cloud Foundry CLI](https://github.com/cloudfoundry/cli)
* [A Cloud Foundry Instance](https://docs.cloudfoundry.org/devguide/install-cf.html)
* Basic understanding of Spring Boot and Cloud Foundry

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/gitrey/spring-music.git
   cd spring-music
   ```

2. **Build the application:**

   ```bash
   ./gradlew build
   ```

### Deployment to Cloud Foundry

1. **Create a Cloud Foundry service instance:**

   ```bash
   cf create-service <service-type> <service-name> <service-plan>
   ```

   **Note:** Replace `<service-type>`, `<service-name>`, and `<service-plan>` with the desired service type, name, and plan, respectively. For example:

   * **MySQL:** `cf create-service p.mysql mysql-service standard`
   * **MongoDB:** `cf create-service p.mongodb mongodb-service standard`
   * **Redis:** `cf create-service p.redis redis-service standard`

2. **Bind the service to your application:**

   ```bash
   cf bind-service spring-music <service-name>
   ```

3. **Push the application to Cloud Foundry:**

   ```bash
   cf push
   ```

   The application will be deployed to Cloud Foundry, utilizing the bound service for persistence.

## Application Access

Once deployed, access the Spring Music application by browsing to the assigned route. For example:

```
http://spring-music.cfapps.io
```

## Running Tests

To run unit tests, execute the following command:

```bash
./gradlew test
```

## Configuration

The application uses Spring profiles to configure the persistence technology. By default, the `http2` profile is activated. To change the profile, modify the `SPRING_PROFILES_ACTIVE` environment variable in your Cloud Foundry manifest file (`manifest.yml`).

## License

Spring Music is licensed under the Apache 2.0 License. See [LICENSE](LICENSE) for more details.

## Contributing

Contributions to this project are welcome! Please see our [CONTRIBUTING.md](CONTRIBUTING.md) file for detailed guidelines.


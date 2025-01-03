```markdown
# Spring Music

This is a sample application for using database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

## Overview

This application demonstrates how to store the same domain objects in a variety of different persistence technologies:

- **Relational:** H2, MySQL, PostgreSQL, SQL Server (requires JDBC driver)
- **Document:** MongoDB
- **Key-Value:** Redis

This is not meant to represent a realistic use case, as you would typically choose the most suitable technology based on your data type. However, it's valuable for testing and experimenting with different services on Cloud Foundry.

## Features

- **Spring Java Configuration:** Uses Spring Java configuration for a clean and flexible approach.
- **Bean Profiles:** Leverages bean profiles to configure the application and connection objects for each persistence technology.
- **Cloud Foundry Environment:** Utilizes the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to inspect the Cloud Foundry environment for service binding configuration.
- **Service Binding:** Shows how to bind services to Spring applications on Cloud Foundry.
- **Web Application:** Provides a basic web interface to interact with the music albums data.

## Setup and Deployment

1. **Prerequisites:**
   - Java 17+
   - Gradle
   - Cloud Foundry CLI

2. **Configure Environment:**
   - Set the `JAVA_HOME` environment variable to point to your Java installation.
   - Ensure the `cf` command is available in your PATH.

3. **Build the Application:**
   ```bash
   gradle clean build
   ```

4. **Deploy to Cloud Foundry:**
   ```bash
   cf push spring-music -f manifest.yml
   ```

   Replace `spring-music` with a unique application name.

5. **Bind Services:**
   - Bind a service of your desired type (e.g., MongoDB, Redis, MySQL) to the application.
   - For example:
     ```bash
     cf bind-service spring-music my-mongodb-service
     ```

6. **Access the Application:**
   - Once deployed, the application will be accessible at the URL provided by Cloud Foundry.

## Running Locally

You can run the application locally with embedded databases (H2) using:

```bash
gradle bootRun
```

To run with other databases, follow these steps:

1. **Install Drivers:**
   - Ensure the necessary JDBC drivers are available in your `libs` directory (if not using embedded databases).

2. **Configure Database:**
   - Set up the desired database and create the necessary tables/collections.
   - Update the `application.yml` file with the correct database connection details for your chosen profile (e.g., `mysql`, `postgres`).

3. **Run the Application:**
   ```bash
   gradle bootRun -Pspring.profiles.active=mysql
   ```

   Replace `mysql` with the desired profile.

## Contributing

We welcome contributions! Please follow our style guide and submit pull requests for review.  We encourage you to:

- Report bugs and issues
- Suggest new features
- Improve existing documentation
- Contribute to code development

## License

Spring Music is licensed under the Apache 2.0 License.

## Contact

For any questions, feedback, or support requests, please contact us at:

- **Email:** support@cymbal.coffee
- **GitHub:** [Link to GitHub Repository]

We are excited to see how you use Spring Music to explore different persistence technologies on Cloud Foundry!
```


# Springboot Notes App for Kubernetes


## Reference

-   [Developing and deploying Spring Boot microservices on Kubernetes](https://learnk8s.io/spring-boot-kubernetes-guide)
-   [https://github.com/learnk8s/knote-java](https://github.com/learnk8s/knote-java)

## Start MongoDB

### #( 05/09/24@ 3:20PM )( donbuddenbaum@donbs-imac ):~
   mongod --config /usr/local/etc/mongod.conf

### #( 05/09/24@ 3:31PM )( donbuddenbaum@donbs-imac ):/usr
   brew install mongosh

### #( 05/09/24@ 3:33PM )( donbuddenbaum@donbs-imac ):/usr
   mongosh "mongodb://localhost:27017"

```
Current Mongosh Log ID:	663d25540c41d43aadb09c44
Connecting to:		mongodb://localhost:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.2.5
Using MongoDB:		7.0.8
Using Mongosh:		2.2.5

For mongosh info see: https://docs.mongodb.com/mongodb-shell/


To help improve our products, anonymous usage data is collected and sent to MongoDB periodically (https://www.mongodb.com/legal/privacy-policy).
You can opt-out by running the disableTelemetry() command.

------
   The server generated these startup warnings when booting
   2024-05-08T14:20:25.975-04:00: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
   2024-05-08T14:20:25.975-04:00: Soft rlimits for open file descriptors too low
------

test> db
test
```

## Build & Test

### #( 05/08/24@ 3:31PM )( donbuddenbaum@donbs-imac ):~/Documents/knote-java/01@master✗✗✗
   
   mvn clean install spring-boot:run

```
[INFO] Scanning for projects...
[INFO]
[INFO] -----------------------< io.learnk8s:knote-java >-----------------------
[INFO] Building knote 1.0.0
[INFO] --------------------------------[ jar ]---------------------------------
[INFO]
[INFO] --- maven-clean-plugin:3.1.0:clean (default-clean) @ knote-java ---
[INFO] Deleting /Users/donbuddenbaum/Documents/knote-java/01/target
[INFO]
[INFO] --- maven-resources-plugin:3.1.0:resources (default-resources) @ knote-java ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] Copying 1 resource
[INFO] Copying 2 resources
[INFO]
[INFO] --- maven-compiler-plugin:3.8.1:compile (default-compile) @ knote-java ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 1 source file to /Users/donbuddenbaum/Documents/knote-java/01/target/classes
[INFO]
[INFO] --- maven-resources-plugin:3.1.0:testResources (default-testResources) @ knote-java ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] skip non existing resourceDirectory /Users/donbuddenbaum/Documents/knote-java/01/src/test/resources
[INFO]
[INFO] --- maven-compiler-plugin:3.8.1:testCompile (default-testCompile) @ knote-java ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 1 source file to /Users/donbuddenbaum/Documents/knote-java/01/target/test-classes
[INFO]
[INFO] --- maven-surefire-plugin:2.22.2:test (default-test) @ knote-java ---
[INFO]
[INFO] -------------------------------------------------------
[INFO]  T E S T S
[INFO] -------------------------------------------------------
[INFO] Running io.learnk8s.knote.KnoteJavaApplicationTests
16:11:39.337 [main] DEBUG org.springframework.test.context.junit4.SpringJUnit4ClassRunner - SpringJUnit4ClassRunner constructor called with [class io.learnk8s.knote.KnoteJavaApplicationTests]
16:11:39.345 [main] DEBUG org.springframework.test.context.BootstrapUtils - Instantiating CacheAwareContextLoaderDelegate from class [org.springframework.test.context.cache.DefaultCacheAwareContextLoaderDelegate]
16:11:39.358 [main] DEBUG org.springframework.test.context.BootstrapUtils - Instantiating BootstrapContext using constructor [public org.springframework.test.context.support.DefaultBootstrapContext(java.lang.Class,org.springframework.test.context.CacheAwareContextLoaderDelegate)]
16:11:39.390 [main] DEBUG org.springframework.test.context.BootstrapUtils - Instantiating TestContextBootstrapper for test class [io.learnk8s.knote.KnoteJavaApplicationTests] from class [org.springframework.boot.test.context.SpringBootTestContextBootstrapper]
16:11:39.411 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Neither @ContextConfiguration nor @ContextHierarchy found for test class [io.learnk8s.knote.KnoteJavaApplicationTests], using SpringBootContextLoader
16:11:39.416 [main] DEBUG org.springframework.test.context.support.AbstractContextLoader - Did not detect default resource location for test class [io.learnk8s.knote.KnoteJavaApplicationTests]: class path resource [io/learnk8s/knote/KnoteJavaApplicationTests-context.xml] does not exist
16:11:39.417 [main] DEBUG org.springframework.test.context.support.AbstractContextLoader - Did not detect default resource location for test class [io.learnk8s.knote.KnoteJavaApplicationTests]: class path resource [io/learnk8s/knote/KnoteJavaApplicationTestsContext.groovy] does not exist
16:11:39.418 [main] INFO org.springframework.test.context.support.AbstractContextLoader - Could not detect default resource locations for test class [io.learnk8s.knote.KnoteJavaApplicationTests]: no resource found for suffixes {-context.xml, Context.groovy}.
16:11:39.419 [main] INFO org.springframework.test.context.support.AnnotationConfigContextLoaderUtils - Could not detect default configuration classes for test class [io.learnk8s.knote.KnoteJavaApplicationTests]: KnoteJavaApplicationTests does not declare any static, non-private, non-final, nested classes annotated with @Configuration.
16:11:39.504 [main] DEBUG org.springframework.test.context.support.ActiveProfilesUtils - Could not find an 'annotation declaring class' for annotation type [org.springframework.test.context.ActiveProfiles] and class [io.learnk8s.knote.KnoteJavaApplicationTests]
16:11:39.606 [main] DEBUG org.springframework.context.annotation.ClassPathScanningCandidateComponentProvider - Identified candidate component class: file [/Users/donbuddenbaum/Documents/knote-java/01/target/classes/io/learnk8s/knote/KnoteJavaApplication.class]
16:11:39.613 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Found @SpringBootConfiguration io.learnk8s.knote.KnoteJavaApplication for test class io.learnk8s.knote.KnoteJavaApplicationTests
16:11:39.722 [main] DEBUG org.springframework.boot.test.context.SpringBootTestContextBootstrapper - @TestExecutionListeners is not present for class [io.learnk8s.knote.KnoteJavaApplicationTests]: using defaults.
16:11:39.722 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Loaded default TestExecutionListener class names from location [META-INF/spring.factories]: [org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener, org.springframework.boot.test.mock.mockito.ResetMocksTestExecutionListener, org.springframework.boot.test.autoconfigure.restdocs.RestDocsTestExecutionListener, org.springframework.boot.test.autoconfigure.web.client.MockRestServiceServerResetTestExecutionListener, org.springframework.boot.test.autoconfigure.web.servlet.MockMvcPrintOnlyOnFailureTestExecutionListener, org.springframework.boot.test.autoconfigure.web.servlet.WebDriverTestExecutionListener, org.springframework.test.context.web.ServletTestExecutionListener, org.springframework.test.context.support.DirtiesContextBeforeModesTestExecutionListener, org.springframework.test.context.support.DependencyInjectionTestExecutionListener, org.springframework.test.context.support.DirtiesContextTestExecutionListener, org.springframework.test.context.transaction.TransactionalTestExecutionListener, org.springframework.test.context.jdbc.SqlScriptsTestExecutionListener]
16:11:39.743 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Using TestExecutionListeners: [org.springframework.test.context.web.ServletTestExecutionListener@45ac5f9b, org.springframework.test.context.support.DirtiesContextBeforeModesTestExecutionListener@135606db, org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener@518caac3, org.springframework.boot.test.autoconfigure.SpringBootDependencyInjectionTestExecutionListener@68034211, org.springframework.test.context.support.DirtiesContextTestExecutionListener@4f74980d, org.springframework.test.context.transaction.TransactionalTestExecutionListener@6c372fe6, org.springframework.test.context.jdbc.SqlScriptsTestExecutionListener@58594a11, org.springframework.boot.test.mock.mockito.ResetMocksTestExecutionListener@2a3888c1, org.springframework.boot.test.autoconfigure.restdocs.RestDocsTestExecutionListener@4167d97b, org.springframework.boot.test.autoconfigure.web.client.MockRestServiceServerResetTestExecutionListener@14fa86ae, org.springframework.boot.test.autoconfigure.web.servlet.MockMvcPrintOnlyOnFailureTestExecutionListener@6e15fe2, org.springframework.boot.test.autoconfigure.web.servlet.WebDriverTestExecutionListener@68f1b17f]
16:11:39.745 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved @ProfileValueSourceConfiguration [null] for test class [io.learnk8s.knote.KnoteJavaApplicationTests]
16:11:39.746 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved ProfileValueSource type [class org.springframework.test.annotation.SystemProfileValueSource] for class [io.learnk8s.knote.KnoteJavaApplicationTests]
16:11:39.747 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved @ProfileValueSourceConfiguration [null] for test class [io.learnk8s.knote.KnoteJavaApplicationTests]
16:11:39.748 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved ProfileValueSource type [class org.springframework.test.annotation.SystemProfileValueSource] for class [io.learnk8s.knote.KnoteJavaApplicationTests]
16:11:39.748 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved @ProfileValueSourceConfiguration [null] for test class [io.learnk8s.knote.KnoteJavaApplicationTests]
16:11:39.748 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved ProfileValueSource type [class org.springframework.test.annotation.SystemProfileValueSource] for class [io.learnk8s.knote.KnoteJavaApplicationTests]
16:11:39.752 [main] DEBUG org.springframework.test.context.support.AbstractDirtiesContextTestExecutionListener - Before test class: context [DefaultTestContext@4b7dc788 testClass = KnoteJavaApplicationTests, testInstance = [null], testMethod = [null], testException = [null], mergedContextConfiguration = [WebMergedContextConfiguration@6304101a testClass = KnoteJavaApplicationTests, locations = '{}', classes = '{class io.learnk8s.knote.KnoteJavaApplication}', contextInitializerClasses = '[]', activeProfiles = '{}', propertySourceLocations = '{}', propertySourceProperties = '{org.springframework.boot.test.context.SpringBootTestContextBootstrapper=true}', contextCustomizers = set[org.springframework.boot.test.context.filter.ExcludeFilterContextCustomizer@2638011, org.springframework.boot.test.json.DuplicateJsonObjectContextCustomizerFactory$DuplicateJsonObjectContextCustomizer@313b2ea6, org.springframework.boot.test.mock.mockito.MockitoContextCustomizer@0, org.springframework.boot.test.web.client.TestRestTemplateContextCustomizer@7c83dc97, org.springframework.boot.test.autoconfigure.properties.PropertyMappingContextCustomizer@0, org.springframework.boot.test.autoconfigure.web.servlet.WebDriverContextCustomizerFactory$Customizer@609db43b], resourceBasePath = 'src/main/webapp', contextLoader = 'org.springframework.boot.test.context.SpringBootContextLoader', parent = [null]], attributes = map['org.springframework.test.context.web.ServletTestExecutionListener.activateListener' -> true]], class annotated with @DirtiesContext [false] with mode [null].
16:11:39.752 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved @ProfileValueSourceConfiguration [null] for test class [io.learnk8s.knote.KnoteJavaApplicationTests]
16:11:39.752 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved ProfileValueSource type [class org.springframework.test.annotation.SystemProfileValueSource] for class [io.learnk8s.knote.KnoteJavaApplicationTests]
16:11:39.779 [main] DEBUG org.springframework.test.context.support.TestPropertySourceUtils - Adding inlined properties to environment: {spring.jmx.enabled=false, org.springframework.boot.test.context.SpringBootTestContextBootstrapper=true, server.port=-1}

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.1.6.RELEASE)

2024-05-08 16:11:40.173  INFO 12654 --- [           main] i.l.knote.KnoteJavaApplicationTests      : Starting KnoteJavaApplicationTests on donbs-imac.local with PID 12654 (started by donbuddenbaum in /Users/donbuddenbaum/Documents/knote-java/01)
2024-05-08 16:11:40.174  INFO 12654 --- [           main] i.l.knote.KnoteJavaApplicationTests      : No active profile set, falling back to default profiles: default
2024-05-08 16:11:41.391  INFO 12654 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Bootstrapping Spring Data repositories in DEFAULT mode.
2024-05-08 16:11:41.503  INFO 12654 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Finished Spring Data repository scanning in 103ms. Found 1 repository interfaces.
2024-05-08 16:11:43.233  INFO 12654 --- [           main] org.mongodb.driver.cluster               : Cluster created with settings {hosts=[localhost:27017], mode=SINGLE, requiredClusterType=UNKNOWN, serverSelectionTimeout='30000 ms', maxWaitQueueSize=500}
2024-05-08 16:11:43.392  INFO 12654 --- [localhost:27017] org.mongodb.driver.connection            : Opened connection [connectionId{localValue:1}] to localhost:27017
2024-05-08 16:11:43.400  INFO 12654 --- [localhost:27017] org.mongodb.driver.cluster               : Monitor thread successfully connected to server with description ServerDescription{address=localhost:27017, type=STANDALONE, state=CONNECTED, ok=true, version=ServerVersion{versionList=[7, 0, 8]}, minWireVersion=0, maxWireVersion=21, maxDocumentSize=16777216, logicalSessionTimeoutMinutes=30, roundTripTimeNanos=5843585}
2024-05-08 16:11:44.586  INFO 12654 --- [           main] o.s.s.concurrent.ThreadPoolTaskExecutor  : Initializing ExecutorService 'applicationTaskExecutor'
2024-05-08 16:11:44.807  INFO 12654 --- [           main] o.s.b.a.w.s.WelcomePageHandlerMapping    : Adding welcome page template: index
2024-05-08 16:11:45.575  INFO 12654 --- [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 2 endpoint(s) beneath base path '/actuator'
2024-05-08 16:11:45.644  INFO 12654 --- [           main] i.l.knote.KnoteJavaApplicationTests      : Started KnoteJavaApplicationTests in 5.856 seconds (JVM running for 7.008)
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 7.009 s - in io.learnk8s.knote.KnoteJavaApplicationTests
2024-05-08 16:11:46.135  INFO 12654 --- [       Thread-1] o.s.s.concurrent.ThreadPoolTaskExecutor  : Shutting down ExecutorService 'applicationTaskExecutor'
[INFO]
[INFO] Results:
[INFO]
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0
[INFO]
[INFO]
[INFO] --- maven-jar-plugin:3.1.2:jar (default-jar) @ knote-java ---
[INFO] Building jar: /Users/donbuddenbaum/Documents/knote-java/01/target/knote-java-1.0.0.jar
[INFO]
[INFO] --- spring-boot-maven-plugin:2.1.6.RELEASE:repackage (repackage) @ knote-java ---
[INFO] Replacing main artifact with repackaged archive
[INFO]
[INFO] --- maven-install-plugin:2.5.2:install (default-install) @ knote-java ---
[INFO] Installing /Users/donbuddenbaum/Documents/knote-java/01/target/knote-java-1.0.0.jar to /Users/donbuddenbaum/.m2/repository/io/learnk8s/knote-java/1.0.0/knote-java-1.0.0.jar
[INFO] Installing /Users/donbuddenbaum/Documents/knote-java/01/pom.xml to /Users/donbuddenbaum/.m2/repository/io/learnk8s/knote-java/1.0.0/knote-java-1.0.0.pom
[INFO]
[INFO] >>> spring-boot-maven-plugin:2.1.6.RELEASE:run (default-cli) > test-compile @ knote-java >>>
[INFO]
[INFO] --- maven-resources-plugin:3.1.0:resources (default-resources) @ knote-java ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] Copying 1 resource
[INFO] Copying 2 resources
[INFO]
[INFO] --- maven-compiler-plugin:3.8.1:compile (default-compile) @ knote-java ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 1 source file to /Users/donbuddenbaum/Documents/knote-java/01/target/classes
[INFO]
[INFO] --- maven-resources-plugin:3.1.0:testResources (default-testResources) @ knote-java ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] skip non existing resourceDirectory /Users/donbuddenbaum/Documents/knote-java/01/src/test/resources
[INFO]
[INFO] --- maven-compiler-plugin:3.8.1:testCompile (default-testCompile) @ knote-java ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 1 source file to /Users/donbuddenbaum/Documents/knote-java/01/target/test-classes
[INFO]
[INFO] <<< spring-boot-maven-plugin:2.1.6.RELEASE:run (default-cli) < test-compile @ knote-java <<<
[INFO]
[INFO]
[INFO] --- spring-boot-maven-plugin:2.1.6.RELEASE:run (default-cli) @ knote-java ---

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.1.6.RELEASE)

2024-05-08 16:11:49.937  INFO 12626 --- [           main] io.learnk8s.knote.KnoteJavaApplication   : Starting KnoteJavaApplication on donbs-imac.local with PID 12626 (/Users/donbuddenbaum/Documents/knote-java/01/target/classes started by donbuddenbaum in /Users/donbuddenbaum/Documents/knote-java/01)
2024-05-08 16:11:49.941  INFO 12626 --- [           main] io.learnk8s.knote.KnoteJavaApplication   : No active profile set, falling back to default profiles: default
2024-05-08 16:11:51.017  INFO 12626 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Bootstrapping Spring Data repositories in DEFAULT mode.
2024-05-08 16:11:51.090  INFO 12626 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Finished Spring Data repository scanning in 66ms. Found 1 repository interfaces.
2024-05-08 16:11:51.909  INFO 12626 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
2024-05-08 16:11:51.968  INFO 12626 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2024-05-08 16:11:51.969  INFO 12626 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet engine: [Apache Tomcat/9.0.21]
2024-05-08 16:11:52.089  INFO 12626 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2024-05-08 16:11:52.089  INFO 12626 --- [           main] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 2087 ms
2024-05-08 16:11:52.655  INFO 12626 --- [           main] org.mongodb.driver.cluster               : Cluster created with settings {hosts=[localhost:27017], mode=SINGLE, requiredClusterType=UNKNOWN, serverSelectionTimeout='30000 ms', maxWaitQueueSize=500}
2024-05-08 16:11:52.767  INFO 12626 --- [localhost:27017] org.mongodb.driver.connection            : Opened connection [connectionId{localValue:1}] to localhost:27017
2024-05-08 16:11:52.774  INFO 12626 --- [localhost:27017] org.mongodb.driver.cluster               : Monitor thread successfully connected to server with description ServerDescription{address=localhost:27017, type=STANDALONE, state=CONNECTED, ok=true, version=ServerVersion{versionList=[7, 0, 8]}, minWireVersion=0, maxWireVersion=21, maxDocumentSize=16777216, logicalSessionTimeoutMinutes=30, roundTripTimeNanos=4322891}
2024-05-08 16:11:53.549  INFO 12626 --- [           main] o.s.s.concurrent.ThreadPoolTaskExecutor  : Initializing ExecutorService 'applicationTaskExecutor'
2024-05-08 16:11:53.729  INFO 12626 --- [           main] o.s.b.a.w.s.WelcomePageHandlerMapping    : Adding welcome page template: index
2024-05-08 16:11:54.098  INFO 12626 --- [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 2 endpoint(s) beneath base path '/actuator'
2024-05-08 16:11:54.222  INFO 12626 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
2024-05-08 16:11:54.226  INFO 12626 --- [           main] io.learnk8s.knote.KnoteJavaApplication   : Started KnoteJavaApplication in 4.672 seconds (JVM running for 23.813)
2024-05-08 16:12:24.421  INFO 12626 --- [nio-8080-exec-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring DispatcherServlet 'dispatcherServlet'
2024-05-08 16:12:24.421  INFO 12626 --- [nio-8080-exec-1] o.s.web.servlet.DispatcherServlet        : Initializing Servlet 'dispatcherServlet'
2024-05-08 16:12:24.437  INFO 12626 --- [nio-8080-exec-1] o.s.web.servlet.DispatcherServlet        : Completed initialization in 16 ms
2024-05-08 16:12:24.575  INFO 12626 --- [nio-8080-exec-1] org.mongodb.driver.connection            : Opened connection [connectionId{localValue:2}] to localhost:27017
```

### #( 05/09/24@ 5:18PM )( donbuddenbaum@donbs-imac ):~/Documents/knote-java/02@master✗✗✗
   docker build -t knote-java .

```
[+] Building 23.2s (9/9) FINISHED                                                                                                       docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                                                                    0.1s
 => => transferring dockerfile: 188B                                                                                                                    0.0s
 => [internal] load metadata for docker.io/adoptopenjdk/openjdk11:jdk-11.0.2.9-slim                                                                     1.1s
 => [auth] adoptopenjdk/openjdk11:pull token for registry-1.docker.io                                                                                   0.0s
 => [internal] load .dockerignore                                                                                                                       0.0s
 => => transferring context: 2B                                                                                                                         0.0s
 => [internal] load build context                                                                                                                       0.8s
 => => transferring context: 26.93MB                                                                                                                    0.8s
 => [1/3] FROM docker.io/adoptopenjdk/openjdk11:jdk-11.0.2.9-slim@sha256:f08341ea88e6dfae4a8ded768941574ead9b6794730f55afb8f54fe4bf7c1366              19.9s
 => => resolve docker.io/adoptopenjdk/openjdk11:jdk-11.0.2.9-slim@sha256:f08341ea88e6dfae4a8ded768941574ead9b6794730f55afb8f54fe4bf7c1366               0.0s
 => => sha256:f08341ea88e6dfae4a8ded768941574ead9b6794730f55afb8f54fe4bf7c1366 1.36kB / 1.36kB                                                          0.0s
 => => sha256:69b6516a1bb3c148c6c85f01dbf948d507190dcc5ccacca63335e8af63ea50da 1.40kB / 1.40kB                                                          0.0s
 => => sha256:9a223081d1a1b0b6b0f135a911e42dacc2573f4e9abeefff5634e2cf42877fa9 6.96kB / 6.96kB                                                          0.0s
 => => sha256:898c46f3b1a1f39827ed135f020c32e2038c87ae0690a8fe73d94e5df9e6a2d6 32.47MB / 32.47MB                                                        5.7s
 => => sha256:63366dfa0a5076458e37ebae948bc7823bab256ca27e09ab94d298e37df4c2a3 851B / 851B                                                              0.1s
 => => sha256:041d4cd74a929bc4b66ee955ab5b229de098fa389d1a1fb9565e536d8878e15f 545B / 545B                                                              0.2s
 => => sha256:8fb802d85d6035613dd0a630fbdb918b3eaf76c9dc920c2aa77ccca537b0121d 8.81MB / 8.81MB                                                          3.0s
 => => sha256:6e1bee0f8701f0ae53a5129dc82115967ae36faa30d7701b195dfc6ec317a51d 162B / 162B                                                              0.3s
 => => sha256:08a0d02a4ea8b9d7d36cdcb90325c5b3b8ebe76fe091c71d9786474ba544646e 4.74kB / 4.74kB                                                          0.6s
 => => sha256:ae546bb81870d0906e710d6ffd7179f802580de1c654dca3e8cb0ef4db998253 121.40MB / 121.40MB                                                     15.2s
 => => extracting sha256:898c46f3b1a1f39827ed135f020c32e2038c87ae0690a8fe73d94e5df9e6a2d6                                                               6.1s
 => => extracting sha256:63366dfa0a5076458e37ebae948bc7823bab256ca27e09ab94d298e37df4c2a3                                                               0.0s
 => => extracting sha256:041d4cd74a929bc4b66ee955ab5b229de098fa389d1a1fb9565e536d8878e15f                                                               0.0s
 => => extracting sha256:6e1bee0f8701f0ae53a5129dc82115967ae36faa30d7701b195dfc6ec317a51d                                                               0.0s
 => => extracting sha256:8fb802d85d6035613dd0a630fbdb918b3eaf76c9dc920c2aa77ccca537b0121d                                                               1.7s
 => => extracting sha256:08a0d02a4ea8b9d7d36cdcb90325c5b3b8ebe76fe091c71d9786474ba544646e                                                               0.0s
 => => extracting sha256:ae546bb81870d0906e710d6ffd7179f802580de1c654dca3e8cb0ef4db998253                                                               4.5s
 => [2/3] COPY target/*.jar /opt/app.jar                                                                                                                1.5s
 => [3/3] WORKDIR /opt                                                                                                                                  0.0s
 => exporting to image                                                                                                                                  0.3s
 => => exporting layers                                                                                                                                 0.3s
 => => writing image sha256:6bae88c7592ecf78844ab3cc85a141b3fe5ba3cd5bc529100080a75c79a24f54                                                            0.0s
 => => naming to docker.io/library/knote-java                                                                                                           0.0s

What's Next?
  View a summary of image vulnerabilities and recommendations → docker scout quickview
```

### #( 05/09/24@ 5:21PM )( donbuddenbaum@donbs-imac ):~/Documents/knote-java/02@master✗✗✗
   docker images
```
REPOSITORY                                                             TAG               IMAGE ID       CREATED          SIZE
knote-java                                                             latest            6bae88c7592e   43 seconds ago   385MB
```

## Run knote in a Docker Network

### #( 05/09/24@ 5:21PM )( donbuddenbaum@donbs-imac ):~/Documents/knote-java/02@master✗✗✗
   docker network create knote

     59989d228459bd1c73a0ba0446517014338423950e52a1a71031314cf6ca7ac8

### #( 05/09/24@ 5:25PM )( donbuddenbaum@donbs-imac ):~/Documents/knote-java/02@master✗✗✗
   docker run \
  --name=mongo \
  --rm \
  --network=knote mongo

### #( 05/09/24@ 5:31PM )( donbuddenbaum@donbs-imac ):~
   docker run \
  --name=knote-java \
  --rm \
  --network=knote \
  -p 8080:8080 \
  -e MONGO_URL=mongodb://mongo:27017/dev \
  knote-java

```
Picked up JAVA_TOOL_OPTIONS:

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.1.6.RELEASE)

2024-05-09 21:32:00.954  INFO 1 --- [           main] io.learnk8s.knote.KnoteJavaApplication   : Starting KnoteJavaApplication v1.0.0 on d91fbed43ec5 with PID 1 (/opt/app.jar started by root in /opt)
2024-05-09 21:32:00.959  INFO 1 --- [           main] io.learnk8s.knote.KnoteJavaApplication   : No active profile set, falling back to default profiles: default
2024-05-09 21:32:02.548  INFO 1 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Bootstrapping Spring Data repositories in DEFAULT mode.
2024-05-09 21:32:02.651  INFO 1 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Finished Spring Data repository scanning in 92ms. Found 1 repository interfaces.
2024-05-09 21:32:04.066  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
2024-05-09 21:32:04.139  INFO 1 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2024-05-09 21:32:04.140  INFO 1 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet engine: [Apache Tomcat/9.0.21]
2024-05-09 21:32:04.284  INFO 1 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2024-05-09 21:32:04.284  INFO 1 --- [           main] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 3236 ms
2024-05-09 21:32:05.006  INFO 1 --- [           main] org.mongodb.driver.cluster               : Cluster created with settings {hosts=[mongo:27017], mode=SINGLE, requiredClusterType=UNKNOWN, serverSelectionTimeout='30000 ms', maxWaitQueueSize=500}
2024-05-09 21:32:05.156  INFO 1 --- [l'}-mongo:27017] org.mongodb.driver.connection            : Opened connection [connectionId{localValue:1}] to mongo:27017
2024-05-09 21:32:05.167  INFO 1 --- [l'}-mongo:27017] org.mongodb.driver.cluster               : Monitor thread successfully connected to server with description ServerDescription{address=mongo:27017, type=STANDALONE, state=CONNECTED, ok=true, version=ServerVersion{versionList=[7, 0, 9]}, minWireVersion=0, maxWireVersion=21, maxDocumentSize=16777216, logicalSessionTimeoutMinutes=30, roundTripTimeNanos=7128081}
2024-05-09 21:32:06.073  INFO 1 --- [           main] o.s.s.concurrent.ThreadPoolTaskExecutor  : Initializing ExecutorService 'applicationTaskExecutor'
2024-05-09 21:32:06.312  INFO 1 --- [           main] o.s.b.a.w.s.WelcomePageHandlerMapping    : Adding welcome page template: index
2024-05-09 21:32:06.897  INFO 1 --- [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 2 endpoint(s) beneath base path '/actuator'
2024-05-09 21:32:07.035  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
2024-05-09 21:32:07.042  INFO 1 --- [           main] io.learnk8s.knote.KnoteJavaApplication   : Started KnoteJavaApplication in 7.355 seconds (JVM running for 8.484)
```

### #( 05/09/24@ 5:35PM )( donbuddenbaum@donbs-imac ):~
   docker ps

```
CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS          PORTS                    NAMES
d91fbed43ec5   knote-java                      "/bin/sh -c 'exec ja…"   3 minutes ago   Up 3 minutes    0.0.0.0:8080->8080/tcp   knote-java
518f46eebf77   mongo                           "docker-entrypoint.s…"   8 minutes ago   Up 8 minutes    27017/tcp                mongo
```
### #( 05/09/24@ 5:35PM )( donbuddenbaum@donbs-imac ):~
   docker stop mongo knote-java
```
mongo
knote-java
```
### #( 05/09/24@ 5:38PM )( donbuddenbaum@donbs-imac ):~
   docker ps
```
CONTAINER ID   IMAGE                           COMMAND                  CREATED       STATUS          PORTS     NAMES
80c2cf8b2964   moby/buildkit:buildx-stable-1   "buildkitd --allow-i…"   11 days ago   Up 31 minutes             buildx_buildkit_amazing_robinson0
86883f4b5ca1   moby/buildkit:buildx-stable-1   "buildkitd --allow-i…"   11 days ago   Up 31 minutes             buildx_buildkit_thirsty_kare0
ee3de8ed0ec8   moby/buildkit:buildx-stable-1   "buildkitd --allow-i…"   11 days ago   Up 31 minutes             buildx_buildkit_adoring_heisenberg0
```
### #( 05/09/24@ 5:41PM )( donbuddenbaum@donbs-imac ):~
   docker tag knote-java donb4iu/knote-java:1.0.0
### #( 05/09/24@ 5:42PM )( donbuddenbaum@donbs-imac ):~
   docker push donb4iu/knote-java:1.0.0
```
The push refers to repository [docker.io/donb4iu/knote-java]
5f70bf18a086: Mounted from donb4iu/http-fhir-server
4420e06dee4d: Pushed
8b338a10df53: Mounted from adoptopenjdk/openjdk11
238b684bbac1: Mounted from adoptopenjdk/openjdk11
faed2c48e448: Mounted from adoptopenjdk/openjdk11
b57c79f4a9f3: Mounted from adoptopenjdk/openjdk11
d60e01b37e74: Mounted from adoptopenjdk/openjdk11
e45cfbc98a50: Mounted from adoptopenjdk/openjdk11
762d8e1a6054: Mounted from adoptopenjdk/openjdk11
1.0.0: digest: sha256:4cc667b809d23e8e9eb7f583c1a6f5b3af1db451c649b2502f8b7d2ed9fce588 size: 2200
```

## Docker Buiild Multi-Arch (AMD64/ARM64)

### #( 05/09/24@ 5:43PM )( donbuddenbaum@donbs-imac ):~
   docker buildx create --use

      epic_nightingale

### #( 05/09/24@ 5:50PM )( donbuddenbaum@donbs-imac ):~
   docker buildx build --platform linux/amd64,linux/arm64 -t donb4iu/knote-java:1.0.1 --push .

```
#( 05/09/24@ 5:53PM )( donbuddenbaum@donbs-imac ):~/Documents/knote-java/02@master✗✗✗
   docker buildx build --platform linux/amd64,linux/arm64 -t donb4iu/knote-java:1.0.1 --push .
[+] Building 113.2s (14/14) FINISHED                                                                                    docker-container:epic_nightingale
 => [internal] load build definition from Dockerfile                                                                                                 0.0s
 => => transferring dockerfile: 188B                                                                                                                 0.0s
 => [linux/arm64 internal] load metadata for docker.io/adoptopenjdk/openjdk11:jdk-11.0.2.9-slim                                                      1.6s
 => [linux/amd64 internal] load metadata for docker.io/adoptopenjdk/openjdk11:jdk-11.0.2.9-slim                                                      1.4s
 => [auth] adoptopenjdk/openjdk11:pull token for registry-1.docker.io                                                                                0.0s
 => [internal] load .dockerignore                                                                                                                    0.0s
 => => transferring context: 2B                                                                                                                      0.0s
 => [internal] load build context                                                                                                                    0.7s
 => => transferring context: 26.93MB                                                                                                                 0.7s
 => [linux/arm64 1/3] FROM docker.io/adoptopenjdk/openjdk11:jdk-11.0.2.9-slim@sha256:f08341ea88e6dfae4a8ded768941574ead9b6794730f55afb8f54fe4bf7c1  31.9s
 => => resolve docker.io/adoptopenjdk/openjdk11:jdk-11.0.2.9-slim@sha256:f08341ea88e6dfae4a8ded768941574ead9b6794730f55afb8f54fe4bf7c1366            0.0s
 => => sha256:678b0ab60501b302a29b8aa6422edd85cefb694319e91cdbf61c06bf301135f2 119.85MB / 119.85MB                                                  27.5s
 => => sha256:27672abf9edd1c23435c5bb863d55987a882c8491a7578c835346bede19488e2 8.65MB / 8.65MB                                                       2.6s
 => => sha256:4d100ec154332f0aa9763dcb5e81a03b45789e7cb556d1c17d6f019ffed0ed29 4.73kB / 4.73kB                                                       0.7s
 => => sha256:fc001299f62009a0d8ce4d3efaeaddbb8278bcb7de2fd80ab535fae4f507398f 163B / 163B                                                           0.3s
 => => sha256:7e9f0564ef6f85c4690ca0b4ba7acd052790741b6e093c7376b23897e091c8d9 500B / 500B                                                           0.4s
 => => sha256:9ef5b901d87c92303900ea484d10726d49c67c4e9fca99625086524c27c93025 29.11MB / 29.11MB                                                    10.3s
 => => sha256:3daad4f910663d8404cbac98eed8f6332e7c5c4f9bd509f604f5b32f032d8f9a 849B / 849B                                                           0.7s
 => => extracting sha256:9ef5b901d87c92303900ea484d10726d49c67c4e9fca99625086524c27c93025                                                            3.2s
 => => extracting sha256:3daad4f910663d8404cbac98eed8f6332e7c5c4f9bd509f604f5b32f032d8f9a                                                            0.0s
 => => extracting sha256:7e9f0564ef6f85c4690ca0b4ba7acd052790741b6e093c7376b23897e091c8d9                                                            0.0s
 => => extracting sha256:fc001299f62009a0d8ce4d3efaeaddbb8278bcb7de2fd80ab535fae4f507398f                                                            0.0s
 => => extracting sha256:27672abf9edd1c23435c5bb863d55987a882c8491a7578c835346bede19488e2                                                            1.2s
 => => extracting sha256:4d100ec154332f0aa9763dcb5e81a03b45789e7cb556d1c17d6f019ffed0ed29                                                            0.0s
 => => extracting sha256:678b0ab60501b302a29b8aa6422edd85cefb694319e91cdbf61c06bf301135f2                                                            4.0s
 => [linux/amd64 1/3] FROM docker.io/adoptopenjdk/openjdk11:jdk-11.0.2.9-slim@sha256:f08341ea88e6dfae4a8ded768941574ead9b6794730f55afb8f54fe4bf7c1  33.9s
 => => resolve docker.io/adoptopenjdk/openjdk11:jdk-11.0.2.9-slim@sha256:f08341ea88e6dfae4a8ded768941574ead9b6794730f55afb8f54fe4bf7c1366            0.0s
 => => sha256:ae546bb81870d0906e710d6ffd7179f802580de1c654dca3e8cb0ef4db998253 121.40MB / 121.40MB                                                  27.6s
 => => sha256:08a0d02a4ea8b9d7d36cdcb90325c5b3b8ebe76fe091c71d9786474ba544646e 4.74kB / 4.74kB                                                       0.2s
 => => sha256:8fb802d85d6035613dd0a630fbdb918b3eaf76c9dc920c2aa77ccca537b0121d 8.81MB / 8.81MB                                                       3.8s
 => => sha256:6e1bee0f8701f0ae53a5129dc82115967ae36faa30d7701b195dfc6ec317a51d 162B / 162B                                                           0.1s
 => => sha256:041d4cd74a929bc4b66ee955ab5b229de098fa389d1a1fb9565e536d8878e15f 545B / 545B                                                           0.1s
 => => sha256:898c46f3b1a1f39827ed135f020c32e2038c87ae0690a8fe73d94e5df9e6a2d6 32.47MB / 32.47MB                                                    11.7s
 => => sha256:63366dfa0a5076458e37ebae948bc7823bab256ca27e09ab94d298e37df4c2a3 851B / 851B                                                           0.2s
 => => extracting sha256:898c46f3b1a1f39827ed135f020c32e2038c87ae0690a8fe73d94e5df9e6a2d6                                                            3.0s
 => => extracting sha256:63366dfa0a5076458e37ebae948bc7823bab256ca27e09ab94d298e37df4c2a3                                                            0.0s
 => => extracting sha256:041d4cd74a929bc4b66ee955ab5b229de098fa389d1a1fb9565e536d8878e15f                                                            0.0s
 => => extracting sha256:6e1bee0f8701f0ae53a5129dc82115967ae36faa30d7701b195dfc6ec317a51d                                                            0.0s
 => => extracting sha256:8fb802d85d6035613dd0a630fbdb918b3eaf76c9dc920c2aa77ccca537b0121d                                                            0.8s
 => => extracting sha256:08a0d02a4ea8b9d7d36cdcb90325c5b3b8ebe76fe091c71d9786474ba544646e                                                            0.0s
 => => extracting sha256:ae546bb81870d0906e710d6ffd7179f802580de1c654dca3e8cb0ef4db998253                                                            4.4s
 => [linux/arm64 2/3] COPY target/*.jar /opt/app.jar                                                                                                 1.9s
 => [linux/amd64 2/3] COPY target/*.jar /opt/app.jar                                                                                                 0.3s
 => [linux/arm64 3/3] WORKDIR /opt                                                                                                                   0.2s
 => [linux/amd64 3/3] WORKDIR /opt                                                                                                                   0.0s
 => exporting to image                                                                                                                              77.3s
 => => exporting layers                                                                                                                              1.5s
 => => exporting manifest sha256:7a1b33612ce01218d9ebaa9750981e9269ce756bcfdd1634d7e922f079c87433                                                    0.0s
 => => exporting config sha256:a8149a14d4ca96271086f51bc99e173defac90881d2b50067d594c3d85c44411                                                      0.0s
 => => exporting attestation manifest sha256:09f18e007c8276ff02e89bf17a1e154db8500616692597502028b5099d116b69                                        0.0s
 => => exporting manifest sha256:73f769810c6a9b75f3e038687753e8e6694c0ce170797c8f4e3b9ffe5eb826af                                                    0.0s
 => => exporting config sha256:6a73ec697812d9248d2c9a330ab1107366d329fdff66b55c30fae452dcc3625c                                                      0.0s
 => => exporting attestation manifest sha256:26ade3197d97c83b1240573656bd3fafe5a7d097ac6f33a8e4fbdbb934e83ab6                                        0.0s
 => => exporting manifest list sha256:b456d2006a26023d1a3698cce1a62eb5a403884dd145faba9c5351eea441cb1b                                               0.0s
 => => pushing layers                                                                                                                               74.2s
 => => pushing manifest for docker.io/donb4iu/knote-java:1.0.1@sha256:b456d2006a26023d1a3698cce1a62eb5a403884dd145faba9c5351eea441cb1b               1.4s
 => [auth] donb4iu/knote-java:pull,push token for registry-1.docker.io                                                                               0.0s

Build multi-platform images faster with Docker Build Cloud: https://docs.docker.com/go/docker-build-cloud
```

## MicroK8s Deployment Stateful - NFS

### #( 05/10/24@ 8:57PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/knotes@main✗✗✗
   kubectl apply -f ns.yaml
      
      namespace/knote configured

### #( 05/10/24@ 9:26PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/knotes@main✗✗✗
   kubectl apply -f knote.yaml

      deployment.apps/knote created
      service/knote created

### #( 05/10/24@ 9:32PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/knotes@main✗✗✗
   kubectl apply -f mongo.yaml

      persistentvolumeclaim/mongo-pvc created
      service/mongo created
      deployment.apps/mongo created
#( 05/10/24@ 9:39PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/knotes@main✗✗✗

## Build & Test Minio

### #( 05/10/24@ 9:51PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/knotes/nfs@main✗✗✗
   docker run \
  --name=minio \
  --rm \
  -p 9000:9000 \
  -e MINIO_ACCESS_KEY=mykey \
  -e MINIO_SECRET_KEY=mysecret \
  minio/minio server /data

```
Unable to find image 'minio/minio:latest' locally
latest: Pulling from minio/minio
ddf997398e20: Pull complete
df4a579dec01: Pull complete
8192a80982f2: Pull complete
362c568d646c: Pull complete
f1d1ac67109d: Pull complete
6722841456ff: Pull complete
d5b199683645: Pull complete
4b0d9e6819e5: Pull complete
Digest: sha256:420663b8685c5396f06405ad516d611db4465939a141cc7d40266342d0f2632d
Status: Downloaded newer image for minio/minio:latest
WARNING: MINIO_ACCESS_KEY and MINIO_SECRET_KEY are deprecated.
         Please use MINIO_ROOT_USER and MINIO_ROOT_PASSWORD
Formatting 1st pool, 1 set(s), 1 drives per set.
WARNING: Host local has more than 0 drives of set. A host failure will result in data becoming unavailable.
MinIO Object Storage Server
Copyright: 2015-2024 MinIO, Inc.
License: GNU AGPLv3 - https://www.gnu.org/licenses/agpl-3.0.html
Version: RELEASE.2024-05-10T01-41-38Z (go1.22.3 linux/amd64)

API: http://172.17.0.2:9000  http://127.0.0.1:9000
WebUI: http://172.17.0.2:36159 http://127.0.0.1:36159

Docs: https://min.io/docs/minio/linux/index.html
Status:         1 Online, 0 Offline.
STARTUP WARNINGS:
- The standard parity is set to 0. This can lead to data loss.
```
### #( 05/10/24@10:22PM )( donbuddenbaum@donbs-imac ):~
   docker run \
  --name=mongo \
  --rm \
  -p 27017:27017 \
  mongo

```
{"t":{"$date":"2024-05-11T02:22:21.907+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
{"t":{"$date":"2024-05-11T02:22:21.908+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":21},"outgoing":{"minWireVersion":6,"maxWireVersion":21},"isInternalClient":true}}}
{"t":{"$date":"2024-05-11T02:22:21.908+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set tcpFastOpenServer, tcpFastOpenClient, and tcpFastOpenQueueSize."}
{"t":{"$date":"2024-05-11T02:22:21.911+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationDonorService","namespace":"config.tenantMigrationDonors"}}
{"t":{"$date":"2024-05-11T02:22:21.911+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationRecipientService","namespace":"config.tenantMigrationRecipients"}}
{"t":{"$date":"2024-05-11T02:22:21.911+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
{"t":{"$date":"2024-05-11T02:22:21.911+00:00"},"s":"I",  "c":"TENANT_M", "id":7091600, "ctx":"main","msg":"Starting TenantMigrationAccessBlockerRegistry"}
{"t":{"$date":"2024-05-11T02:22:21.912+00:00"},"s":"I",  "c":"CONTROL",  "id":4615611, "ctx":"initandlisten","msg":"MongoDB starting","attr":{"pid":1,"port":27017,"dbPath":"/data/db","architecture":"64-bit","host":"8a2d983b4624"}}
{"t":{"$date":"2024-05-11T02:22:21.912+00:00"},"s":"I",  "c":"CONTROL",  "id":23403,   "ctx":"initandlisten","msg":"Build Info","attr":{"buildInfo":{"version":"7.0.9","gitVersion":"3ff3a3925c36ed277cf5eafca5495f2e3728dd67","openSSLVersion":"OpenSSL 3.0.2 15 Mar 2022","modules":[],"allocator":"tcmalloc","environment":{"distmod":"ubuntu2204","distarch":"x86_64","target_arch":"x86_64"}}}}
{"t":{"$date":"2024-05-11T02:22:21.912+00:00"},"s":"I",  "c":"CONTROL",  "id":51765,   "ctx":"initandlisten","msg":"Operating System","attr":{"os":{"name":"Ubuntu","version":"22.04"}}}
{"t":{"$date":"2024-05-11T02:22:21.912+00:00"},"s":"I",  "c":"CONTROL",  "id":21951,   "ctx":"initandlisten","msg":"Options set by command line","attr":{"options":{"net":{"bindIp":"*"}}}}
{"t":{"$date":"2024-05-11T02:22:21.914+00:00"},"s":"I",  "c":"STORAGE",  "id":22297,   "ctx":"initandlisten","msg":"Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem","tags":["startupWarnings"]}
{"t":{"$date":"2024-05-11T02:22:21.915+00:00"},"s":"I",  "c":"STORAGE",  "id":22315,   "ctx":"initandlisten","msg":"Opening WiredTiger","attr":{"config":"create,cache_size=3458M,session_max=33000,eviction=(threads_min=4,threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,remove=true,path=journal,compressor=snappy),builtin_extension_config=(zstd=(compression_level=6)),file_manager=(close_idle_time=600,close_scan_interval=10,close_handle_minimum=2000),statistics_log=(wait=0),json_output=(error,message),verbose=[recovery_progress:1,checkpoint_progress:1,compact_progress:1,backup:0,checkpoint:0,compact:0,evict:0,history_store:0,recovery:0,rts:0,salvage:0,tiered:0,timestamp:0,transaction:0,verify:0,log:0],"}}
{"t":{"$date":"2024-05-11T02:22:23.058+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1715394143,"ts_usec":58906,"thread":"1:0x7fdbdfe45c80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery log replay has successfully finished and ran for 0 milliseconds"}}}
{"t":{"$date":"2024-05-11T02:22:23.059+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1715394143,"ts_usec":59041,"thread":"1:0x7fdbdfe45c80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global recovery timestamp: (0, 0)"}}}
{"t":{"$date":"2024-05-11T02:22:23.059+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1715394143,"ts_usec":59078,"thread":"1:0x7fdbdfe45c80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global oldest timestamp: (0, 0)"}}}
{"t":{"$date":"2024-05-11T02:22:23.059+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1715394143,"ts_usec":59125,"thread":"1:0x7fdbdfe45c80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery was completed successfully and took 0ms, including 0ms for the log replay, 0ms for the rollback to stable, and 0ms for the checkpoint."}}}
{"t":{"$date":"2024-05-11T02:22:23.077+00:00"},"s":"I",  "c":"STORAGE",  "id":4795906, "ctx":"initandlisten","msg":"WiredTiger opened","attr":{"durationMillis":1162}}
{"t":{"$date":"2024-05-11T02:22:23.077+00:00"},"s":"I",  "c":"RECOVERY", "id":23987,   "ctx":"initandlisten","msg":"WiredTiger recoveryTimestamp","attr":{"recoveryTimestamp":{"$timestamp":{"t":0,"i":0}}}}
{"t":{"$date":"2024-05-11T02:22:23.108+00:00"},"s":"W",  "c":"CONTROL",  "id":22120,   "ctx":"initandlisten","msg":"Access control is not enabled for the database. Read and write access to data and configuration is unrestricted","tags":["startupWarnings"]}
{"t":{"$date":"2024-05-11T02:22:23.109+00:00"},"s":"W",  "c":"CONTROL",  "id":22178,   "ctx":"initandlisten","msg":"/sys/kernel/mm/transparent_hugepage/enabled is 'always'. We suggest setting it to 'never' in this binary version","tags":["startupWarnings"]}
{"t":{"$date":"2024-05-11T02:22:23.110+00:00"},"s":"W",  "c":"CONTROL",  "id":5123300, "ctx":"initandlisten","msg":"vm.max_map_count is too low","attr":{"currentValue":262144,"recommendedMinimum":1677720,"maxConns":838860},"tags":["startupWarnings"]}
{"t":{"$date":"2024-05-11T02:22:23.110+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"admin.system.version","uuidDisposition":"provided","uuid":{"uuid":{"$uuid":"8346e1e9-61a7-4c8c-abf7-e74a2bb727e0"}},"options":{"uuid":{"$uuid":"8346e1e9-61a7-4c8c-abf7-e74a2bb727e0"}}}}
{"t":{"$date":"2024-05-11T02:22:23.128+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"8346e1e9-61a7-4c8c-abf7-e74a2bb727e0"}},"namespace":"admin.system.version","index":"_id_","ident":"index-1-2438475259501675333","collectionIdent":"collection-0-2438475259501675333","commitTimestamp":null}}
{"t":{"$date":"2024-05-11T02:22:23.128+00:00"},"s":"I",  "c":"REPL",     "id":20459,   "ctx":"initandlisten","msg":"Setting featureCompatibilityVersion","attr":{"newVersion":"7.0"}}
{"t":{"$date":"2024-05-11T02:22:23.128+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"7.0","context":"setFCV"}}
{"t":{"$date":"2024-05-11T02:22:23.128+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":21},"outgoing":{"minWireVersion":6,"maxWireVersion":21},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":21,"maxWireVersion":21},"outgoing":{"minWireVersion":21,"maxWireVersion":21},"isInternalClient":true}}}
{"t":{"$date":"2024-05-11T02:22:23.128+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":21,"maxWireVersion":21},"outgoing":{"minWireVersion":21,"maxWireVersion":21},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":21,"maxWireVersion":21},"outgoing":{"minWireVersion":21,"maxWireVersion":21},"isInternalClient":true}}}
{"t":{"$date":"2024-05-11T02:22:23.128+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"7.0","context":"startup"}}
{"t":{"$date":"2024-05-11T02:22:23.129+00:00"},"s":"I",  "c":"STORAGE",  "id":5071100, "ctx":"initandlisten","msg":"Clearing temp directory"}
{"t":{"$date":"2024-05-11T02:22:23.129+00:00"},"s":"I",  "c":"CONTROL",  "id":6608200, "ctx":"initandlisten","msg":"Initializing cluster server parameters from disk"}
{"t":{"$date":"2024-05-11T02:22:23.129+00:00"},"s":"I",  "c":"CONTROL",  "id":20536,   "ctx":"initandlisten","msg":"Flow Control is enabled on this deployment"}
{"t":{"$date":"2024-05-11T02:22:23.131+00:00"},"s":"I",  "c":"FTDC",     "id":20625,   "ctx":"initandlisten","msg":"Initializing full-time diagnostic data capture","attr":{"dataDirectory":"/data/db/diagnostic.data"}}
{"t":{"$date":"2024-05-11T02:22:23.134+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"local.startup_log","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"b43a7135-b37c-4d6a-80ce-1df21104c953"}},"options":{"capped":true,"size":10485760}}}
{"t":{"$date":"2024-05-11T02:22:23.154+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"b43a7135-b37c-4d6a-80ce-1df21104c953"}},"namespace":"local.startup_log","index":"_id_","ident":"index-3-2438475259501675333","collectionIdent":"collection-2-2438475259501675333","commitTimestamp":null}}
{"t":{"$date":"2024-05-11T02:22:23.155+00:00"},"s":"I",  "c":"REPL",     "id":6015317, "ctx":"initandlisten","msg":"Setting new configuration state","attr":{"newState":"ConfigReplicationDisabled","oldState":"ConfigPreStart"}}
{"t":{"$date":"2024-05-11T02:22:23.155+00:00"},"s":"I",  "c":"STORAGE",  "id":22262,   "ctx":"initandlisten","msg":"Timestamp monitor starting"}
{"t":{"$date":"2024-05-11T02:22:23.158+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"LogicalSessionCacheRefresh","msg":"createCollection","attr":{"namespace":"config.system.sessions","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"d524d7c4-5c73-4c70-a167-20cf99272076"}},"options":{}}}
{"t":{"$date":"2024-05-11T02:22:23.158+00:00"},"s":"I",  "c":"CONTROL",  "id":20712,   "ctx":"LogicalSessionCacheReap","msg":"Sessions collection is not set up; waiting until next sessions reap interval","attr":{"error":"NamespaceNotFound: config.system.sessions does not exist"}}
{"t":{"$date":"2024-05-11T02:22:23.159+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"/tmp/mongodb-27017.sock"}}
{"t":{"$date":"2024-05-11T02:22:23.159+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"0.0.0.0"}}
{"t":{"$date":"2024-05-11T02:22:23.159+00:00"},"s":"I",  "c":"NETWORK",  "id":23016,   "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
{"t":{"$date":"2024-05-11T02:22:23.159+00:00"},"s":"I",  "c":"CONTROL",  "id":8423403, "ctx":"initandlisten","msg":"mongod startup complete","attr":{"Summary of time elapsed":{"Startup from clean shutdown?":true,"Statistics":{"Transport layer setup":"0 ms","Run initial syncer crash recovery":"0 ms","Create storage engine lock file in the data directory":"0 ms","Get metadata describing storage engine":"0 ms","Create storage engine":"1187 ms","Write current PID to file":"0 ms","Write a new metadata for storage engine":"0 ms","Initialize FCV before rebuilding indexes":"0 ms","Drop abandoned idents and get back indexes that need to be rebuilt or builds that need to be restarted":"0 ms","Rebuild indexes for collections":"0 ms","Load cluster parameters from disk for a standalone":"0 ms","Build user and roles graph":"0 ms","Set up the background thread pool responsible for waiting for opTimes to be majority committed":"0 ms","Initialize information needed to make a mongod instance shard aware":"0 ms","Start up the replication coordinator":"1 ms","Start transport layer":"0 ms","_initAndListen total elapsed time":"1247 ms"}}}}
{"t":{"$date":"2024-05-11T02:22:23.177+00:00"},"s":"I",  "c":"REPL",     "id":7360102, "ctx":"LogicalSessionCacheRefresh","msg":"Added oplog entry for create to transaction","attr":{"namespace":"config.$cmd","uuid":{"uuid":{"$uuid":"d524d7c4-5c73-4c70-a167-20cf99272076"}},"object":{"create":"system.sessions","idIndex":{"v":2,"key":{"_id":1},"name":"_id_"}}}}
{"t":{"$date":"2024-05-11T02:22:23.177+00:00"},"s":"I",  "c":"REPL",     "id":7360100, "ctx":"LogicalSessionCacheRefresh","msg":"Added oplog entry for createIndexes to transaction","attr":{"namespace":"config.$cmd","uuid":{"uuid":{"$uuid":"d524d7c4-5c73-4c70-a167-20cf99272076"}},"object":{"createIndexes":"system.sessions","v":2,"key":{"lastUse":1},"name":"lsidTTLIndex","expireAfterSeconds":1800}}}
{"t":{"$date":"2024-05-11T02:22:23.186+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"d524d7c4-5c73-4c70-a167-20cf99272076"}},"namespace":"config.system.sessions","index":"_id_","ident":"index-5-2438475259501675333","collectionIdent":"collection-4-2438475259501675333","commitTimestamp":null}}
{"t":{"$date":"2024-05-11T02:22:23.186+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"d524d7c4-5c73-4c70-a167-20cf99272076"}},"namespace":"config.system.sessions","index":"lsidTTLIndex","ident":"index-6-2438475259501675333","collectionIdent":"collection-4-2438475259501675333","commitTimestamp":null}}
{"t":{"$date":"2024-05-11T02:23:23.109+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1715394203,"ts_usec":109865,"thread":"1:0x7fdbd6e32640","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":6,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 34, snapshot max: 34 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 1"}}}
{"t":{"$date":"2024-05-11T02:24:23.131+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1715394263,"ts_usec":131330,"thread":"1:0x7fdbd6e32640","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":6,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 35, snapshot max: 35 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 1"}}}
```

### #( 05/10/24@10:21PM )( donbuddenbaum@donbs-imac ):~/Documents/knote-java/04-05@master✗✗✗
   mvn -Dminio.access.key=mykey -Dminio.secret.key=mysecret spring-boot:run

```
[INFO] Scanning for projects...
[INFO]
[INFO] -----------------------< io.learnk8s:knote-java >-----------------------
[INFO] Building knote 1.0.0
[INFO] --------------------------------[ jar ]---------------------------------
[INFO]
[INFO] >>> spring-boot-maven-plugin:2.1.6.RELEASE:run (default-cli) > test-compile @ knote-java >>>
Downloading from central: https://repo.maven.apache.org/maven2/io/minio/minio/6.0.8/minio-6.0.8.pom
Downloaded from central: https://repo.maven.apache.org/maven2/io/minio/minio/6.0.8/minio-6.0.8.pom (3.4 kB at 5.6 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/http-client/google-http-client-xml/1.24.1/google-http-client-xml-1.24.1.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/http-client/google-http-client-xml/1.24.1/google-http-client-xml-1.24.1.pom (2.5 kB at 27 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/http-client/google-http-client-parent/1.24.1/google-http-client-parent-1.24.1.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/http-client/google-http-client-parent/1.24.1/google-http-client-parent-1.24.1.pom (22 kB at 248 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/http-client/google-http-client/1.24.1/google-http-client-1.24.1.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/http-client/google-http-client/1.24.1/google-http-client-1.24.1.pom (6.1 kB at 84 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.pom (4.3 kB at 66 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/httpcomponents/httpclient/4.5.9/httpclient-4.5.9.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/httpcomponents/httpclient/4.5.9/httpclient-4.5.9.pom (6.6 kB at 96 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/httpcomponents/httpcomponents-client/4.5.9/httpcomponents-client-4.5.9.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/httpcomponents/httpcomponents-client/4.5.9/httpcomponents-client-4.5.9.pom (16 kB at 248 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/httpcomponents/httpcomponents-parent/11/httpcomponents-parent-11.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/httpcomponents/httpcomponents-parent/11/httpcomponents-parent-11.pom (35 kB at 369 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/httpcomponents/httpcore/4.4.11/httpcore-4.4.11.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/httpcomponents/httpcore/4.4.11/httpcore-4.4.11.pom (5.2 kB at 76 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/httpcomponents/httpcomponents-core/4.4.11/httpcomponents-core-4.4.11.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/httpcomponents/httpcomponents-core/4.4.11/httpcomponents-core-4.4.11.pom (13 kB at 173 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/xpp3/xpp3/1.1.4c/xpp3-1.1.4c.pom
Downloaded from central: https://repo.maven.apache.org/maven2/xpp3/xpp3/1.1.4c/xpp3-1.1.4c.pom (2.1 kB at 31 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/guava/guava/25.1-jre/guava-25.1-jre.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/guava/guava/25.1-jre/guava-25.1-jre.pom (7.8 kB at 114 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/guava/guava-parent/25.1-jre/guava-parent-25.1-jre.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/guava/guava-parent/25.1-jre/guava-parent-25.1-jre.pom (10 kB at 153 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/checkerframework/checker-qual/2.0.0/checker-qual-2.0.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/checkerframework/checker-qual/2.0.0/checker-qual-2.0.0.pom (4.2 kB at 50 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.1.3/error_prone_annotations-2.1.3.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.1.3/error_prone_annotations-2.1.3.pom (1.8 kB at 25 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_parent/2.1.3/error_prone_parent-2.1.3.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_parent/2.1.3/error_prone_parent-2.1.3.pom (5.1 kB at 67 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1.pom (2.8 kB at 35 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.14/animal-sniffer-annotations-1.14.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.14/animal-sniffer-annotations-1.14.pom (2.5 kB at 38 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/codehaus/mojo/animal-sniffer-parent/1.14/animal-sniffer-parent-1.14.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/codehaus/mojo/animal-sniffer-parent/1.14/animal-sniffer-parent-1.14.pom (4.4 kB at 51 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/codehaus/mojo/mojo-parent/34/mojo-parent-34.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/codehaus/mojo/mojo-parent/34/mojo-parent-34.pom (24 kB at 333 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/codehaus/codehaus-parent/4/codehaus-parent-4.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/codehaus/codehaus-parent/4/codehaus-parent-4.pom (4.8 kB at 69 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/squareup/okhttp3/okhttp/3.13.1/okhttp-3.13.1.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/squareup/okhttp3/okhttp/3.13.1/okhttp-3.13.1.pom (2.5 kB at 30 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/squareup/okhttp3/parent/3.13.1/parent-3.13.1.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/squareup/okhttp3/parent/3.13.1/parent-3.13.1.pom (20 kB at 228 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/squareup/okio/okio/1.17.2/okio-1.17.2.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/squareup/okio/okio/1.17.2/okio-1.17.2.pom (2.0 kB at 29 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/squareup/okio/okio-parent/1.17.2/okio-parent-1.17.2.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/squareup/okio/okio-parent/1.17.2/okio-parent-1.17.2.pom (4.9 kB at 72 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/joda-time/joda-time/2.10.2/joda-time-2.10.2.pom
Downloaded from central: https://repo.maven.apache.org/maven2/joda-time/joda-time/2.10.2/joda-time-2.10.2.pom (37 kB at 577 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/code/findbugs/annotations/3.0.1/annotations-3.0.1.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/code/findbugs/annotations/3.0.1/annotations-3.0.1.pom (7.8 kB at 98 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/net/jcip/jcip-annotations/1.0/jcip-annotations-1.0.pom
Downloaded from central: https://repo.maven.apache.org/maven2/net/jcip/jcip-annotations/1.0/jcip-annotations-1.0.pom (491 B at 6.6 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.1/jsr305-3.0.1.pom
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.1/jsr305-3.0.1.pom (4.3 kB at 45 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/io/minio/minio/6.0.8/minio-6.0.8.jar
Downloading from central: https://repo.maven.apache.org/maven2/com/google/http-client/google-http-client-xml/1.24.1/google-http-client-xml-1.24.1.jar
Downloading from central: https://repo.maven.apache.org/maven2/com/google/http-client/google-http-client/1.24.1/google-http-client-1.24.1.jar
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/httpcomponents/httpclient/4.5.9/httpclient-4.5.9.jar
Downloading from central: https://repo.maven.apache.org/maven2/org/apache/httpcomponents/httpcore/4.4.11/httpcore-4.4.11.jar
Downloaded from central: https://repo.maven.apache.org/maven2/io/minio/minio/6.0.8/minio-6.0.8.jar (136 kB at 965 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/xpp3/xpp3/1.1.4c/xpp3-1.1.4c.jar
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/http-client/google-http-client-xml/1.24.1/google-http-client-xml-1.24.1.jar (28 kB at 171 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/guava/guava/25.1-jre/guava-25.1-jre.jar
Downloaded from central: https://repo.maven.apache.org/maven2/xpp3/xpp3/1.1.4c/xpp3-1.1.4c.jar (120 kB at 492 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/checkerframework/checker-qual/2.0.0/checker-qual-2.0.0.jar
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/http-client/google-http-client/1.24.1/google-http-client-1.24.1.jar (383 kB at 1.4 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.1.3/error_prone_annotations-2.1.3.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/httpcomponents/httpcore/4.4.11/httpcore-4.4.11.jar (327 kB at 1.1 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/httpcomponents/httpclient/4.5.9/httpclient-4.5.9.jar (774 kB at 2.2 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.14/animal-sniffer-annotations-1.14.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/checkerframework/checker-qual/2.0.0/checker-qual-2.0.0.jar (343 kB at 880 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/squareup/okhttp3/okhttp/3.13.1/okhttp-3.13.1.jar
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.1.3/error_prone_annotations-2.1.3.jar (14 kB at 35 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/squareup/okio/okio/1.17.2/okio-1.17.2.jar
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1.jar (8.8 kB at 22 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/joda-time/joda-time/2.10.2/joda-time-2.10.2.jar
Downloaded from central: https://repo.maven.apache.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.14/animal-sniffer-annotations-1.14.jar (3.5 kB at 6.4 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/code/findbugs/annotations/3.0.1/annotations-3.0.1.jar
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/guava/guava/25.1-jre/guava-25.1-jre.jar (2.7 MB at 4.5 MB/s)
Downloading from central: https://repo.maven.apache.org/maven2/net/jcip/jcip-annotations/1.0/jcip-annotations-1.0.jar
Downloaded from central: https://repo.maven.apache.org/maven2/com/squareup/okio/okio/1.17.2/okio-1.17.2.jar (92 kB at 150 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/code/findbugs/annotations/3.0.1/annotations-3.0.1.jar (39 kB at 60 kB/s)
Downloading from central: https://repo.maven.apache.org/maven2/commons-io/commons-io/2.6/commons-io-2.6.jar
Downloaded from central: https://repo.maven.apache.org/maven2/com/squareup/okhttp3/okhttp/3.13.1/okhttp-3.13.1.jar (418 kB at 646 kB/s)
Downloaded from central: https://repo.maven.apache.org/maven2/joda-time/joda-time/2.10.2/joda-time-2.10.2.jar (643 kB at 941 kB/s)
Downloaded from central: https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar (20 kB at 28 kB/s)
Downloaded from central: https://repo.maven.apache.org/maven2/net/jcip/jcip-annotations/1.0/jcip-annotations-1.0.jar (2.3 kB at 3.2 kB/s)
Downloaded from central: https://repo.maven.apache.org/maven2/commons-io/commons-io/2.6/commons-io-2.6.jar (215 kB at 290 kB/s)
[INFO]
[INFO] --- maven-resources-plugin:3.1.0:resources (default-resources) @ knote-java ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] Copying 1 resource
[INFO] Copying 2 resources
[INFO]
[INFO] --- maven-compiler-plugin:3.8.1:compile (default-compile) @ knote-java ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 1 source file to /Users/donbuddenbaum/Documents/knote-java/04-05/target/classes
[INFO]
[INFO] --- maven-resources-plugin:3.1.0:testResources (default-testResources) @ knote-java ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] skip non existing resourceDirectory /Users/donbuddenbaum/Documents/knote-java/04-05/src/test/resources
[INFO]
[INFO] --- maven-compiler-plugin:3.8.1:testCompile (default-testCompile) @ knote-java ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 1 source file to /Users/donbuddenbaum/Documents/knote-java/04-05/target/test-classes
[INFO]
[INFO] <<< spring-boot-maven-plugin:2.1.6.RELEASE:run (default-cli) < test-compile @ knote-java <<<
[INFO]
[INFO]
[INFO] --- spring-boot-maven-plugin:2.1.6.RELEASE:run (default-cli) @ knote-java ---

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.1.6.RELEASE)

2024-05-10 22:30:09.601  INFO 18410 --- [           main] io.learnk8s.knote.KnoteJavaApplication   : Starting KnoteJavaApplication on donbs-imac.local with PID 18410 (/Users/donbuddenbaum/Documents/knote-java/04-05/target/classes started by donbuddenbaum in /Users/donbuddenbaum/Documents/knote-java/04-05)
2024-05-10 22:30:09.605  INFO 18410 --- [           main] io.learnk8s.knote.KnoteJavaApplication   : No active profile set, falling back to default profiles: default
2024-05-10 22:30:10.595  INFO 18410 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Bootstrapping Spring Data repositories in DEFAULT mode.
2024-05-10 22:30:10.671  INFO 18410 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Finished Spring Data repository scanning in 67ms. Found 1 repository interfaces.
2024-05-10 22:30:11.453  INFO 18410 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
2024-05-10 22:30:11.518  INFO 18410 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2024-05-10 22:30:11.518  INFO 18410 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet engine: [Apache Tomcat/9.0.21]
2024-05-10 22:30:11.694  INFO 18410 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2024-05-10 22:30:11.695  INFO 18410 --- [           main] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 2024 ms
2024-05-10 22:30:12.476  INFO 18410 --- [           main] org.mongodb.driver.cluster               : Cluster created with settings {hosts=[localhost:27017], mode=SINGLE, requiredClusterType=UNKNOWN, serverSelectionTimeout='30000 ms', maxWaitQueueSize=500}
2024-05-10 22:30:12.599  INFO 18410 --- [localhost:27017] org.mongodb.driver.connection            : Opened connection [connectionId{localValue:1}] to localhost:27017
2024-05-10 22:30:12.606  INFO 18410 --- [localhost:27017] org.mongodb.driver.cluster               : Monitor thread successfully connected to server with description ServerDescription{address=localhost:27017, type=STANDALONE, state=CONNECTED, ok=true, version=ServerVersion{versionList=[7, 0, 8]}, minWireVersion=0, maxWireVersion=21, maxDocumentSize=16777216, logicalSessionTimeoutMinutes=30, roundTripTimeNanos=4057940}
> Minio initialized!
```

### #( 05/10/24@10:48PM )( donbuddenbaum@donbs-imac ):~/Documents/knote-java/04-05@master✗✗✗
   docker stop mongo minio
   docker rm mongo minio

```
mongo
minio
Error response from daemon: No such container: mongo
Error response from daemon: No such container: minio
```

## Build mArch Containers

### #( 05/10/24@10:59PM )( donbuddenbaum@donbs-imac ):~/Documents/knote-java/04-05@master✔
   mvn -Dminio.access.key=mykey -Dminio.secret.key=mysecret clean install
```
[INFO] Scanning for projects...
[INFO]
[INFO] -----------------------< io.learnk8s:knote-java >-----------------------
[INFO] Building knote 1.0.0
[INFO] --------------------------------[ jar ]---------------------------------
[INFO]
[INFO] --- maven-clean-plugin:3.1.0:clean (default-clean) @ knote-java ---
[INFO] Deleting /Users/donbuddenbaum/Documents/knote-java/04-05/target
[INFO]
[INFO] --- maven-resources-plugin:3.1.0:resources (default-resources) @ knote-java ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] Copying 1 resource
[INFO] Copying 2 resources
[INFO]
[INFO] --- maven-compiler-plugin:3.8.1:compile (default-compile) @ knote-java ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 1 source file to /Users/donbuddenbaum/Documents/knote-java/04-05/target/classes
[INFO]
[INFO] --- maven-resources-plugin:3.1.0:testResources (default-testResources) @ knote-java ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] skip non existing resourceDirectory /Users/donbuddenbaum/Documents/knote-java/04-05/src/test/resources
[INFO]
[INFO] --- maven-compiler-plugin:3.8.1:testCompile (default-testCompile) @ knote-java ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 1 source file to /Users/donbuddenbaum/Documents/knote-java/04-05/target/test-classes
[INFO]
[INFO] --- maven-surefire-plugin:2.22.2:test (default-test) @ knote-java ---
[INFO]
[INFO] -------------------------------------------------------
[INFO]  T E S T S
[INFO] -------------------------------------------------------
[INFO] Running io.learnk8s.knote.KnoteJavaApplicationTests
23:02:54.563 [main] DEBUG org.springframework.test.context.junit4.SpringJUnit4ClassRunner - SpringJUnit4ClassRunner constructor called with [class io.learnk8s.knote.KnoteJavaApplicationTests]
23:02:54.572 [main] DEBUG org.springframework.test.context.BootstrapUtils - Instantiating CacheAwareContextLoaderDelegate from class [org.springframework.test.context.cache.DefaultCacheAwareContextLoaderDelegate]
23:02:54.588 [main] DEBUG org.springframework.test.context.BootstrapUtils - Instantiating BootstrapContext using constructor [public org.springframework.test.context.support.DefaultBootstrapContext(java.lang.Class,org.springframework.test.context.CacheAwareContextLoaderDelegate)]
23:02:54.621 [main] DEBUG org.springframework.test.context.BootstrapUtils - Instantiating TestContextBootstrapper for test class [io.learnk8s.knote.KnoteJavaApplicationTests] from class [org.springframework.boot.test.context.SpringBootTestContextBootstrapper]
23:02:54.641 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Neither @ContextConfiguration nor @ContextHierarchy found for test class [io.learnk8s.knote.KnoteJavaApplicationTests], using SpringBootContextLoader
23:02:54.646 [main] DEBUG org.springframework.test.context.support.AbstractContextLoader - Did not detect default resource location for test class [io.learnk8s.knote.KnoteJavaApplicationTests]: class path resource [io/learnk8s/knote/KnoteJavaApplicationTests-context.xml] does not exist
23:02:54.647 [main] DEBUG org.springframework.test.context.support.AbstractContextLoader - Did not detect default resource location for test class [io.learnk8s.knote.KnoteJavaApplicationTests]: class path resource [io/learnk8s/knote/KnoteJavaApplicationTestsContext.groovy] does not exist
23:02:54.647 [main] INFO org.springframework.test.context.support.AbstractContextLoader - Could not detect default resource locations for test class [io.learnk8s.knote.KnoteJavaApplicationTests]: no resource found for suffixes {-context.xml, Context.groovy}.
23:02:54.648 [main] INFO org.springframework.test.context.support.AnnotationConfigContextLoaderUtils - Could not detect default configuration classes for test class [io.learnk8s.knote.KnoteJavaApplicationTests]: KnoteJavaApplicationTests does not declare any static, non-private, non-final, nested classes annotated with @Configuration.
23:02:54.712 [main] DEBUG org.springframework.test.context.support.ActiveProfilesUtils - Could not find an 'annotation declaring class' for annotation type [org.springframework.test.context.ActiveProfiles] and class [io.learnk8s.knote.KnoteJavaApplicationTests]
23:02:54.813 [main] DEBUG org.springframework.context.annotation.ClassPathScanningCandidateComponentProvider - Identified candidate component class: file [/Users/donbuddenbaum/Documents/knote-java/04-05/target/classes/io/learnk8s/knote/KnoteJavaApplication.class]
23:02:54.819 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Found @SpringBootConfiguration io.learnk8s.knote.KnoteJavaApplication for test class io.learnk8s.knote.KnoteJavaApplicationTests
23:02:54.955 [main] DEBUG org.springframework.boot.test.context.SpringBootTestContextBootstrapper - @TestExecutionListeners is not present for class [io.learnk8s.knote.KnoteJavaApplicationTests]: using defaults.
23:02:54.956 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Loaded default TestExecutionListener class names from location [META-INF/spring.factories]: [org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener, org.springframework.boot.test.mock.mockito.ResetMocksTestExecutionListener, org.springframework.boot.test.autoconfigure.restdocs.RestDocsTestExecutionListener, org.springframework.boot.test.autoconfigure.web.client.MockRestServiceServerResetTestExecutionListener, org.springframework.boot.test.autoconfigure.web.servlet.MockMvcPrintOnlyOnFailureTestExecutionListener, org.springframework.boot.test.autoconfigure.web.servlet.WebDriverTestExecutionListener, org.springframework.test.context.web.ServletTestExecutionListener, org.springframework.test.context.support.DirtiesContextBeforeModesTestExecutionListener, org.springframework.test.context.support.DependencyInjectionTestExecutionListener, org.springframework.test.context.support.DirtiesContextTestExecutionListener, org.springframework.test.context.transaction.TransactionalTestExecutionListener, org.springframework.test.context.jdbc.SqlScriptsTestExecutionListener]
23:02:54.978 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper - Using TestExecutionListeners: [org.springframework.test.context.web.ServletTestExecutionListener@63611043, org.springframework.test.context.support.DirtiesContextBeforeModesTestExecutionListener@20ca951f, org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener@2d778add, org.springframework.boot.test.autoconfigure.SpringBootDependencyInjectionTestExecutionListener@73302995, org.springframework.test.context.support.DirtiesContextTestExecutionListener@1838ccb8, org.springframework.test.context.transaction.TransactionalTestExecutionListener@6c2ed0cd, org.springframework.test.context.jdbc.SqlScriptsTestExecutionListener@7d9e8ef7, org.springframework.boot.test.mock.mockito.ResetMocksTestExecutionListener@f107c50, org.springframework.boot.test.autoconfigure.restdocs.RestDocsTestExecutionListener@51133c06, org.springframework.boot.test.autoconfigure.web.client.MockRestServiceServerResetTestExecutionListener@4b213651, org.springframework.boot.test.autoconfigure.web.servlet.MockMvcPrintOnlyOnFailureTestExecutionListener@4241e0f4, org.springframework.boot.test.autoconfigure.web.servlet.WebDriverTestExecutionListener@4ebff610]
23:02:54.980 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved @ProfileValueSourceConfiguration [null] for test class [io.learnk8s.knote.KnoteJavaApplicationTests]
23:02:54.980 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved ProfileValueSource type [class org.springframework.test.annotation.SystemProfileValueSource] for class [io.learnk8s.knote.KnoteJavaApplicationTests]
23:02:54.982 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved @ProfileValueSourceConfiguration [null] for test class [io.learnk8s.knote.KnoteJavaApplicationTests]
23:02:54.982 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved ProfileValueSource type [class org.springframework.test.annotation.SystemProfileValueSource] for class [io.learnk8s.knote.KnoteJavaApplicationTests]
23:02:54.983 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved @ProfileValueSourceConfiguration [null] for test class [io.learnk8s.knote.KnoteJavaApplicationTests]
23:02:54.983 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved ProfileValueSource type [class org.springframework.test.annotation.SystemProfileValueSource] for class [io.learnk8s.knote.KnoteJavaApplicationTests]
23:02:54.987 [main] DEBUG org.springframework.test.context.support.AbstractDirtiesContextTestExecutionListener - Before test class: context [DefaultTestContext@1b75c2e3 testClass = KnoteJavaApplicationTests, testInstance = [null], testMethod = [null], testException = [null], mergedContextConfiguration = [WebMergedContextConfiguration@1984b1f testClass = KnoteJavaApplicationTests, locations = '{}', classes = '{class io.learnk8s.knote.KnoteJavaApplication}', contextInitializerClasses = '[]', activeProfiles = '{}', propertySourceLocations = '{}', propertySourceProperties = '{minio.reconnect.enabled=false, org.springframework.boot.test.context.SpringBootTestContextBootstrapper=true}', contextCustomizers = set[org.springframework.boot.test.context.filter.ExcludeFilterContextCustomizer@60015ef5, org.springframework.boot.test.json.DuplicateJsonObjectContextCustomizerFactory$DuplicateJsonObjectContextCustomizer@65b3f4a4, org.springframework.boot.test.mock.mockito.MockitoContextCustomizer@0, org.springframework.boot.test.web.client.TestRestTemplateContextCustomizer@609db43b, org.springframework.boot.test.autoconfigure.properties.PropertyMappingContextCustomizer@0, org.springframework.boot.test.autoconfigure.web.servlet.WebDriverContextCustomizerFactory$Customizer@52102734], resourceBasePath = 'src/main/webapp', contextLoader = 'org.springframework.boot.test.context.SpringBootContextLoader', parent = [null]], attributes = map['org.springframework.test.context.web.ServletTestExecutionListener.activateListener' -> true]], class annotated with @DirtiesContext [false] with mode [null].
23:02:54.988 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved @ProfileValueSourceConfiguration [null] for test class [io.learnk8s.knote.KnoteJavaApplicationTests]
23:02:54.988 [main] DEBUG org.springframework.test.annotation.ProfileValueUtils - Retrieved ProfileValueSource type [class org.springframework.test.annotation.SystemProfileValueSource] for class [io.learnk8s.knote.KnoteJavaApplicationTests]
23:02:55.015 [main] DEBUG org.springframework.test.context.support.TestPropertySourceUtils - Adding inlined properties to environment: {spring.jmx.enabled=false, minio.reconnect.enabled=false, org.springframework.boot.test.context.SpringBootTestContextBootstrapper=true, server.port=-1}

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.1.6.RELEASE)

2024-05-10 23:02:55.411  INFO 29325 --- [           main] i.l.knote.KnoteJavaApplicationTests      : Starting KnoteJavaApplicationTests on donbs-imac.local with PID 29325 (started by donbuddenbaum in /Users/donbuddenbaum/Documents/knote-java/04-05)
2024-05-10 23:02:55.413  INFO 29325 --- [           main] i.l.knote.KnoteJavaApplicationTests      : No active profile set, falling back to default profiles: default
2024-05-10 23:02:56.468  INFO 29325 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Bootstrapping Spring Data repositories in DEFAULT mode.
2024-05-10 23:02:56.543  INFO 29325 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Finished Spring Data repository scanning in 67ms. Found 1 repository interfaces.
2024-05-10 23:02:57.495  INFO 29325 --- [           main] org.mongodb.driver.cluster               : Cluster created with settings {hosts=[localhost:27017], mode=SINGLE, requiredClusterType=UNKNOWN, serverSelectionTimeout='30000 ms', maxWaitQueueSize=500}
2024-05-10 23:02:57.600  INFO 29325 --- [localhost:27017] org.mongodb.driver.connection            : Opened connection [connectionId{localValue:1}] to localhost:27017
2024-05-10 23:02:57.607  INFO 29325 --- [localhost:27017] org.mongodb.driver.cluster               : Monitor thread successfully connected to server with description ServerDescription{address=localhost:27017, type=STANDALONE, state=CONNECTED, ok=true, version=ServerVersion{versionList=[7, 0, 8]}, minWireVersion=0, maxWireVersion=21, maxDocumentSize=16777216, logicalSessionTimeoutMinutes=30, roundTripTimeNanos=4290869}
java.net.ConnectException: Failed to connect to localhost/0:0:0:0:0:0:0:1:9000
	at okhttp3.internal.connection.RealConnection.connectSocket(RealConnection.java:249)
	at okhttp3.internal.connection.RealConnection.connect(RealConnection.java:167)
	at okhttp3.internal.connection.StreamAllocation.findConnection(StreamAllocation.java:257)
	at okhttp3.internal.connection.StreamAllocation.findHealthyConnection(StreamAllocation.java:135)
	at okhttp3.internal.connection.StreamAllocation.newStream(StreamAllocation.java:114)
	at okhttp3.internal.connection.ConnectInterceptor.intercept(ConnectInterceptor.java:42)
	at okhttp3.internal.http.RealInterceptorChain.proceed(RealInterceptorChain.java:147)
	at okhttp3.internal.http.RealInterceptorChain.proceed(RealInterceptorChain.java:121)
	at okhttp3.internal.cache.CacheInterceptor.intercept(CacheInterceptor.java:94)
	at okhttp3.internal.http.RealInterceptorChain.proceed(RealInterceptorChain.java:147)
	at okhttp3.internal.http.RealInterceptorChain.proceed(RealInterceptorChain.java:121)
	at okhttp3.internal.http.BridgeInterceptor.intercept(BridgeInterceptor.java:93)
	at okhttp3.internal.http.RealInterceptorChain.proceed(RealInterceptorChain.java:147)
	at okhttp3.internal.http.RetryAndFollowUpInterceptor.intercept(RetryAndFollowUpInterceptor.java:125)
	at okhttp3.internal.http.RealInterceptorChain.proceed(RealInterceptorChain.java:147)
	at okhttp3.internal.http.RealInterceptorChain.proceed(RealInterceptorChain.java:121)
	at okhttp3.RealCall.getResponseWithInterceptorChain(RealCall.java:264)
	at okhttp3.RealCall.execute(RealCall.java:93)
	at io.minio.MinioClient.executeReq(MinioClient.java:1111)
	at io.minio.MinioClient.execute(MinioClient.java:1070)
	at io.minio.MinioClient.updateRegionCache(MinioClient.java:1219)
	at io.minio.MinioClient.getRegion(MinioClient.java:1264)
	at io.minio.MinioClient.executeHead(MinioClient.java:1312)
	at io.minio.MinioClient.bucketExists(MinioClient.java:3286)
	at io.learnk8s.knote.KNoteController.initMinio(KnoteJavaApplication.java:202)
	at io.learnk8s.knote.KNoteController.init(KnoteJavaApplication.java:130)
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.base/java.lang.reflect.Method.invoke(Method.java:566)
	at org.springframework.beans.factory.annotation.InitDestroyAnnotationBeanPostProcessor$LifecycleElement.invoke(InitDestroyAnnotationBeanPostProcessor.java:363)
	at org.springframework.beans.factory.annotation.InitDestroyAnnotationBeanPostProcessor$LifecycleMetadata.invokeInitMethods(InitDestroyAnnotationBeanPostProcessor.java:307)
	at org.springframework.beans.factory.annotation.InitDestroyAnnotationBeanPostProcessor.postProcessBeforeInitialization(InitDestroyAnnotationBeanPostProcessor.java:136)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.applyBeanPostProcessorsBeforeInitialization(AbstractAutowireCapableBeanFactory.java:414)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1770)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:593)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:515)
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:320)
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:222)
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:318)
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:199)
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:845)
	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:877)
	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:549)
	at org.springframework.boot.SpringApplication.refresh(SpringApplication.java:742)
	at org.springframework.boot.SpringApplication.refreshContext(SpringApplication.java:389)
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:311)
	at org.springframework.boot.test.context.SpringBootContextLoader.loadContext(SpringBootContextLoader.java:119)
	at org.springframework.test.context.cache.DefaultCacheAwareContextLoaderDelegate.loadContextInternal(DefaultCacheAwareContextLoaderDelegate.java:99)
	at org.springframework.test.context.cache.DefaultCacheAwareContextLoaderDelegate.loadContext(DefaultCacheAwareContextLoaderDelegate.java:117)
	at org.springframework.test.context.support.DefaultTestContext.getApplicationContext(DefaultTestContext.java:108)
	at org.springframework.test.context.web.ServletTestExecutionListener.setUpRequestContextIfNecessary(ServletTestExecutionListener.java:190)
	at org.springframework.test.context.web.ServletTestExecutionListener.prepareTestInstance(ServletTestExecutionListener.java:132)
	at org.springframework.test.context.TestContextManager.prepareTestInstance(TestContextManager.java:246)
	at org.springframework.test.context.junit4.SpringJUnit4ClassRunner.createTest(SpringJUnit4ClassRunner.java:227)
	at org.springframework.test.context.junit4.SpringJUnit4ClassRunner$1.runReflectiveCall(SpringJUnit4ClassRunner.java:289)
	at org.junit.internal.runners.model.ReflectiveCallable.run(ReflectiveCallable.java:12)
	at org.springframework.test.context.junit4.SpringJUnit4ClassRunner.methodBlock(SpringJUnit4ClassRunner.java:291)
	at org.springframework.test.context.junit4.SpringJUnit4ClassRunner.runChild(SpringJUnit4ClassRunner.java:246)
	at org.springframework.test.context.junit4.SpringJUnit4ClassRunner.runChild(SpringJUnit4ClassRunner.java:97)
	at org.junit.runners.ParentRunner$3.run(ParentRunner.java:290)
	at org.junit.runners.ParentRunner$1.schedule(ParentRunner.java:71)
	at org.junit.runners.ParentRunner.runChildren(ParentRunner.java:288)
	at org.junit.runners.ParentRunner.access$000(ParentRunner.java:58)
	at org.junit.runners.ParentRunner$2.evaluate(ParentRunner.java:268)
	at org.springframework.test.context.junit4.statements.RunBeforeTestClassCallbacks.evaluate(RunBeforeTestClassCallbacks.java:61)
	at org.springframework.test.context.junit4.statements.RunAfterTestClassCallbacks.evaluate(RunAfterTestClassCallbacks.java:70)
	at org.junit.runners.ParentRunner.run(ParentRunner.java:363)
	at org.springframework.test.context.junit4.SpringJUnit4ClassRunner.run(SpringJUnit4ClassRunner.java:190)
	at org.apache.maven.surefire.junit4.JUnit4Provider.execute(JUnit4Provider.java:365)
	at org.apache.maven.surefire.junit4.JUnit4Provider.executeWithRerun(JUnit4Provider.java:273)
	at org.apache.maven.surefire.junit4.JUnit4Provider.executeTestSet(JUnit4Provider.java:238)
	at org.apache.maven.surefire.junit4.JUnit4Provider.invoke(JUnit4Provider.java:159)
	at org.apache.maven.surefire.booter.ForkedBooter.invokeProviderInSameClassLoader(ForkedBooter.java:384)
	at org.apache.maven.surefire.booter.ForkedBooter.runSuitesInProcess(ForkedBooter.java:345)
	at org.apache.maven.surefire.booter.ForkedBooter.execute(ForkedBooter.java:126)
	at org.apache.maven.surefire.booter.ForkedBooter.main(ForkedBooter.java:418)
Caused by: java.net.ConnectException: Connection refused (Connection refused)
	at java.base/java.net.PlainSocketImpl.socketConnect(Native Method)
	at java.base/java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:412)
	at java.base/java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:255)
	at java.base/java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:237)
	at java.base/java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)
	at java.base/java.net.Socket.connect(Socket.java:608)
	at okhttp3.internal.platform.Platform.connectSocket(Platform.java:130)
	at okhttp3.internal.connection.RealConnection.connectSocket(RealConnection.java:247)
	... 76 more
> Minio Reconnect: false
> Minio initialized!
2024-05-10 23:02:59.082  INFO 29325 --- [           main] o.s.s.concurrent.ThreadPoolTaskExecutor  : Initializing ExecutorService 'applicationTaskExecutor'
2024-05-10 23:02:59.334  INFO 29325 --- [           main] o.s.b.a.w.s.WelcomePageHandlerMapping    : Adding welcome page template: index
2024-05-10 23:03:00.096  INFO 29325 --- [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 2 endpoint(s) beneath base path '/actuator'
2024-05-10 23:03:00.187  INFO 29325 --- [           main] i.l.knote.KnoteJavaApplicationTests      : Started KnoteJavaApplicationTests in 5.159 seconds (JVM running for 6.445)
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 6.438 s - in io.learnk8s.knote.KnoteJavaApplicationTests
2024-05-10 23:03:00.690  INFO 29325 --- [       Thread-1] o.s.s.concurrent.ThreadPoolTaskExecutor  : Shutting down ExecutorService 'applicationTaskExecutor'
[INFO]
[INFO] Results:
[INFO]
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0
[INFO]
[INFO]
[INFO] --- maven-jar-plugin:3.1.2:jar (default-jar) @ knote-java ---
[INFO] Building jar: /Users/donbuddenbaum/Documents/knote-java/04-05/target/knote-java-1.0.0.jar
[INFO]
[INFO] --- spring-boot-maven-plugin:2.1.6.RELEASE:repackage (repackage) @ knote-java ---
[INFO] Replacing main artifact with repackaged archive
[INFO]
[INFO] --- maven-install-plugin:2.5.2:install (default-install) @ knote-java ---
[INFO] Installing /Users/donbuddenbaum/Documents/knote-java/04-05/target/knote-java-1.0.0.jar to /Users/donbuddenbaum/.m2/repository/io/learnk8s/knote-java/1.0.0/knote-java-1.0.0.jar
[INFO] Installing /Users/donbuddenbaum/Documents/knote-java/04-05/pom.xml to /Users/donbuddenbaum/.m2/repository/io/learnk8s/knote-java/1.0.0/knote-java-1.0.0.pom
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  15.505 s
[INFO] Finished at: 2024-05-10T23:03:03-04:00
[INFO] ------------------------------------------------------------------------
```

### #( 05/10/24@10:48PM )( donbuddenbaum@donbs-imac ):~/Documents/knote-java/04-05@master✗✗✗
   docker buildx create --use

      blissful_heisenberg

### #( 05/10/24@11:03PM )( donbuddenbaum@donbs-imac ):~/Documents/knote-java/04-05@master✗✗✗
   docker buildx build --platform linux/amd64,linux/arm64 -t donb4iu/knote-java:2.0.0 --push .

```
[+] Building 21.5s (14/14) FINISHED                                                                                                              docker-container:blissful_heisenberg
 => [internal] load build definition from Dockerfile                                                                                                                             0.0s
 => => transferring dockerfile: 188B                                                                                                                                             0.0s
 => [linux/amd64 internal] load metadata for docker.io/adoptopenjdk/openjdk11:jdk-11.0.2.9-slim                                                                                  0.9s
 => [linux/arm64 internal] load metadata for docker.io/adoptopenjdk/openjdk11:jdk-11.0.2.9-slim                                                                                  0.9s
 => [auth] adoptopenjdk/openjdk11:pull token for registry-1.docker.io                                                                                                            0.0s
 => [internal] load .dockerignore                                                                                                                                                0.0s
 => => transferring context: 2B                                                                                                                                                  0.0s
 => [internal] load build context                                                                                                                                                1.1s
 => => transferring context: 33.57MB                                                                                                                                             1.1s
 => CACHED [linux/arm64 1/3] FROM docker.io/adoptopenjdk/openjdk11:jdk-11.0.2.9-slim@sha256:f08341ea88e6dfae4a8ded768941574ead9b6794730f55afb8f54fe4bf7c1366                     0.0s
 => => resolve docker.io/adoptopenjdk/openjdk11:jdk-11.0.2.9-slim@sha256:f08341ea88e6dfae4a8ded768941574ead9b6794730f55afb8f54fe4bf7c1366                                        0.0s
 => CACHED [linux/amd64 1/3] FROM docker.io/adoptopenjdk/openjdk11:jdk-11.0.2.9-slim@sha256:f08341ea88e6dfae4a8ded768941574ead9b6794730f55afb8f54fe4bf7c1366                     0.0s
 => => resolve docker.io/adoptopenjdk/openjdk11:jdk-11.0.2.9-slim@sha256:f08341ea88e6dfae4a8ded768941574ead9b6794730f55afb8f54fe4bf7c1366                                        0.0s
 => [linux/amd64 2/3] COPY target/*.jar /opt/app.jar                                                                                                                             0.4s
 => [linux/arm64 2/3] COPY target/*.jar /opt/app.jar                                                                                                                             0.4s
 => [linux/arm64 3/3] WORKDIR /opt                                                                                                                                               0.1s
 => [linux/amd64 3/3] WORKDIR /opt                                                                                                                                               0.1s
 => exporting to image                                                                                                                                                          18.8s
 => => exporting layers                                                                                                                                                          1.9s
 => => exporting manifest sha256:464cdfed847001cee40bce41aebff78845aed5f5f79c7b2700044fe597e8539c                                                                                0.0s
 => => exporting config sha256:f39b96fb875d525ba3c0d98c91d6a391907b4e344a64fe60fb440e429399db59                                                                                  0.0s
 => => exporting attestation manifest sha256:a2c2adf40ec7cc45d5c0578ce2a4abcf3d1c7521a8dc95e8b0f21682d0cb1562                                                                    0.0s
 => => exporting manifest sha256:7950d9291ad59642096c38e005d74e4306d7feda83aab20af2254fde1602e281                                                                                0.0s
 => => exporting config sha256:fddb98ea66dcfc12711eec7feb0c64a87986ce5faadc55e593aab930880ddca0                                                                                  0.0s
 => => exporting attestation manifest sha256:6d0fc3be8e21b114312c1a86d5a9eee32ba08c1a760089675f4b115a0da5f080                                                                    0.0s
 => => exporting manifest list sha256:3b8cbe7f1c74738c85ba277235006606ff2daa8aaaaeae69c36bc1e565d130be                                                                           0.0s
 => => pushing layers                                                                                                                                                           15.4s
 => => pushing manifest for docker.io/donb4iu/knote-java:2.0.0@sha256:3b8cbe7f1c74738c85ba277235006606ff2daa8aaaaeae69c36bc1e565d130be                                           1.4s
 => [auth] donb4iu/knote-java:pull,push token for registry-1.docker.io                                                                                                           0.0s

Build multi-platform images faster with Docker Build Cloud: https://docs.docker.com/go/docker-build-cloud
```

## Build & Test Minio with mArch image 

### #( 05/10/24@11:09PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/knotes/nfs@main✗✗✗
   docker run \
  --name=mongo \
  --rm \
  --network=knote \
  mongo

```
{"t":{"$date":"2024-05-11T03:10:24.142+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":21},"outgoing":{"minWireVersion":6,"maxWireVersion":21},"isInternalClient":true}}}
{"t":{"$date":"2024-05-11T03:10:24.143+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
{"t":{"$date":"2024-05-11T03:10:24.146+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set tcpFastOpenServer, tcpFastOpenClient, and tcpFastOpenQueueSize."}
{"t":{"$date":"2024-05-11T03:10:24.149+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationDonorService","namespace":"config.tenantMigrationDonors"}}
{"t":{"$date":"2024-05-11T03:10:24.149+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationRecipientService","namespace":"config.tenantMigrationRecipients"}}
{"t":{"$date":"2024-05-11T03:10:24.149+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
{"t":{"$date":"2024-05-11T03:10:24.149+00:00"},"s":"I",  "c":"TENANT_M", "id":7091600, "ctx":"main","msg":"Starting TenantMigrationAccessBlockerRegistry"}
{"t":{"$date":"2024-05-11T03:10:24.150+00:00"},"s":"I",  "c":"CONTROL",  "id":4615611, "ctx":"initandlisten","msg":"MongoDB starting","attr":{"pid":1,"port":27017,"dbPath":"/data/db","architecture":"64-bit","host":"126cb11ee1dc"}}
{"t":{"$date":"2024-05-11T03:10:24.150+00:00"},"s":"I",  "c":"CONTROL",  "id":23403,   "ctx":"initandlisten","msg":"Build Info","attr":{"buildInfo":{"version":"7.0.9","gitVersion":"3ff3a3925c36ed277cf5eafca5495f2e3728dd67","openSSLVersion":"OpenSSL 3.0.2 15 Mar 2022","modules":[],"allocator":"tcmalloc","environment":{"distmod":"ubuntu2204","distarch":"x86_64","target_arch":"x86_64"}}}}
{"t":{"$date":"2024-05-11T03:10:24.150+00:00"},"s":"I",  "c":"CONTROL",  "id":51765,   "ctx":"initandlisten","msg":"Operating System","attr":{"os":{"name":"Ubuntu","version":"22.04"}}}
{"t":{"$date":"2024-05-11T03:10:24.150+00:00"},"s":"I",  "c":"CONTROL",  "id":21951,   "ctx":"initandlisten","msg":"Options set by command line","attr":{"options":{"net":{"bindIp":"*"}}}}
{"t":{"$date":"2024-05-11T03:10:24.152+00:00"},"s":"I",  "c":"STORAGE",  "id":22297,   "ctx":"initandlisten","msg":"Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem","tags":["startupWarnings"]}
{"t":{"$date":"2024-05-11T03:10:24.153+00:00"},"s":"I",  "c":"STORAGE",  "id":22315,   "ctx":"initandlisten","msg":"Opening WiredTiger","attr":{"config":"create,cache_size=3458M,session_max=33000,eviction=(threads_min=4,threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,remove=true,path=journal,compressor=snappy),builtin_extension_config=(zstd=(compression_level=6)),file_manager=(close_idle_time=600,close_scan_interval=10,close_handle_minimum=2000),statistics_log=(wait=0),json_output=(error,message),verbose=[recovery_progress:1,checkpoint_progress:1,compact_progress:1,backup:0,checkpoint:0,compact:0,evict:0,history_store:0,recovery:0,rts:0,salvage:0,tiered:0,timestamp:0,transaction:0,verify:0,log:0],"}}
{"t":{"$date":"2024-05-11T03:10:25.141+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1715397025,"ts_usec":141511,"thread":"1:0x7f9d962efc80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery log replay has successfully finished and ran for 0 milliseconds"}}}
{"t":{"$date":"2024-05-11T03:10:25.141+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1715397025,"ts_usec":141680,"thread":"1:0x7f9d962efc80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global recovery timestamp: (0, 0)"}}}
{"t":{"$date":"2024-05-11T03:10:25.141+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1715397025,"ts_usec":141726,"thread":"1:0x7f9d962efc80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global oldest timestamp: (0, 0)"}}}
{"t":{"$date":"2024-05-11T03:10:25.141+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1715397025,"ts_usec":141796,"thread":"1:0x7f9d962efc80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery was completed successfully and took 0ms, including 0ms for the log replay, 0ms for the rollback to stable, and 0ms for the checkpoint."}}}
{"t":{"$date":"2024-05-11T03:10:25.155+00:00"},"s":"I",  "c":"STORAGE",  "id":4795906, "ctx":"initandlisten","msg":"WiredTiger opened","attr":{"durationMillis":1002}}
{"t":{"$date":"2024-05-11T03:10:25.155+00:00"},"s":"I",  "c":"RECOVERY", "id":23987,   "ctx":"initandlisten","msg":"WiredTiger recoveryTimestamp","attr":{"recoveryTimestamp":{"$timestamp":{"t":0,"i":0}}}}
{"t":{"$date":"2024-05-11T03:10:25.183+00:00"},"s":"W",  "c":"CONTROL",  "id":22120,   "ctx":"initandlisten","msg":"Access control is not enabled for the database. Read and write access to data and configuration is unrestricted","tags":["startupWarnings"]}
{"t":{"$date":"2024-05-11T03:10:25.183+00:00"},"s":"W",  "c":"CONTROL",  "id":22178,   "ctx":"initandlisten","msg":"/sys/kernel/mm/transparent_hugepage/enabled is 'always'. We suggest setting it to 'never' in this binary version","tags":["startupWarnings"]}
{"t":{"$date":"2024-05-11T03:10:25.183+00:00"},"s":"W",  "c":"CONTROL",  "id":5123300, "ctx":"initandlisten","msg":"vm.max_map_count is too low","attr":{"currentValue":262144,"recommendedMinimum":1677720,"maxConns":838860},"tags":["startupWarnings"]}
{"t":{"$date":"2024-05-11T03:10:25.184+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"admin.system.version","uuidDisposition":"provided","uuid":{"uuid":{"$uuid":"1526df3f-333a-4db1-a2ee-298688b10402"}},"options":{"uuid":{"$uuid":"1526df3f-333a-4db1-a2ee-298688b10402"}}}}
{"t":{"$date":"2024-05-11T03:10:25.202+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"1526df3f-333a-4db1-a2ee-298688b10402"}},"namespace":"admin.system.version","index":"_id_","ident":"index-1-8856531098339113795","collectionIdent":"collection-0-8856531098339113795","commitTimestamp":null}}
{"t":{"$date":"2024-05-11T03:10:25.202+00:00"},"s":"I",  "c":"REPL",     "id":20459,   "ctx":"initandlisten","msg":"Setting featureCompatibilityVersion","attr":{"newVersion":"7.0"}}
{"t":{"$date":"2024-05-11T03:10:25.202+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"7.0","context":"setFCV"}}
{"t":{"$date":"2024-05-11T03:10:25.202+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":21},"outgoing":{"minWireVersion":6,"maxWireVersion":21},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":21,"maxWireVersion":21},"outgoing":{"minWireVersion":21,"maxWireVersion":21},"isInternalClient":true}}}
{"t":{"$date":"2024-05-11T03:10:25.203+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":21,"maxWireVersion":21},"outgoing":{"minWireVersion":21,"maxWireVersion":21},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":21,"maxWireVersion":21},"outgoing":{"minWireVersion":21,"maxWireVersion":21},"isInternalClient":true}}}
{"t":{"$date":"2024-05-11T03:10:25.203+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"7.0","context":"startup"}}
{"t":{"$date":"2024-05-11T03:10:25.205+00:00"},"s":"I",  "c":"STORAGE",  "id":5071100, "ctx":"initandlisten","msg":"Clearing temp directory"}
{"t":{"$date":"2024-05-11T03:10:25.205+00:00"},"s":"I",  "c":"CONTROL",  "id":6608200, "ctx":"initandlisten","msg":"Initializing cluster server parameters from disk"}
{"t":{"$date":"2024-05-11T03:10:25.205+00:00"},"s":"I",  "c":"CONTROL",  "id":20536,   "ctx":"initandlisten","msg":"Flow Control is enabled on this deployment"}
{"t":{"$date":"2024-05-11T03:10:25.207+00:00"},"s":"I",  "c":"FTDC",     "id":20625,   "ctx":"initandlisten","msg":"Initializing full-time diagnostic data capture","attr":{"dataDirectory":"/data/db/diagnostic.data"}}
{"t":{"$date":"2024-05-11T03:10:25.209+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"local.startup_log","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"48960fb4-2f88-4d83-8b7e-697ab298f1f7"}},"options":{"capped":true,"size":10485760}}}
{"t":{"$date":"2024-05-11T03:10:25.231+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"48960fb4-2f88-4d83-8b7e-697ab298f1f7"}},"namespace":"local.startup_log","index":"_id_","ident":"index-3-8856531098339113795","collectionIdent":"collection-2-8856531098339113795","commitTimestamp":null}}
{"t":{"$date":"2024-05-11T03:10:25.231+00:00"},"s":"I",  "c":"REPL",     "id":6015317, "ctx":"initandlisten","msg":"Setting new configuration state","attr":{"newState":"ConfigReplicationDisabled","oldState":"ConfigPreStart"}}
{"t":{"$date":"2024-05-11T03:10:25.231+00:00"},"s":"I",  "c":"STORAGE",  "id":22262,   "ctx":"initandlisten","msg":"Timestamp monitor starting"}
{"t":{"$date":"2024-05-11T03:10:25.234+00:00"},"s":"I",  "c":"CONTROL",  "id":20712,   "ctx":"LogicalSessionCacheReap","msg":"Sessions collection is not set up; waiting until next sessions reap interval","attr":{"error":"NamespaceNotFound: config.system.sessions does not exist"}}
{"t":{"$date":"2024-05-11T03:10:25.234+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"LogicalSessionCacheRefresh","msg":"createCollection","attr":{"namespace":"config.system.sessions","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"e7845007-46de-4e79-bfae-5f3f2c0f7219"}},"options":{}}}
{"t":{"$date":"2024-05-11T03:10:25.235+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"/tmp/mongodb-27017.sock"}}
{"t":{"$date":"2024-05-11T03:10:25.235+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"0.0.0.0"}}
{"t":{"$date":"2024-05-11T03:10:25.235+00:00"},"s":"I",  "c":"NETWORK",  "id":23016,   "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
{"t":{"$date":"2024-05-11T03:10:25.235+00:00"},"s":"I",  "c":"CONTROL",  "id":8423403, "ctx":"initandlisten","msg":"mongod startup complete","attr":{"Summary of time elapsed":{"Startup from clean shutdown?":true,"Statistics":{"Transport layer setup":"0 ms","Run initial syncer crash recovery":"0 ms","Create storage engine lock file in the data directory":"0 ms","Get metadata describing storage engine":"0 ms","Create storage engine":"1024 ms","Write current PID to file":"0 ms","Write a new metadata for storage engine":"3 ms","Initialize FCV before rebuilding indexes":"1 ms","Drop abandoned idents and get back indexes that need to be rebuilt or builds that need to be restarted":"0 ms","Rebuild indexes for collections":"0 ms","Load cluster parameters from disk for a standalone":"0 ms","Build user and roles graph":"0 ms","Set up the background thread pool responsible for waiting for opTimes to be majority committed":"0 ms","Initialize information needed to make a mongod instance shard aware":"0 ms","Start up the replication coordinator":"0 ms","Start transport layer":"1 ms","_initAndListen total elapsed time":"1085 ms"}}}}
{"t":{"$date":"2024-05-11T03:10:25.254+00:00"},"s":"I",  "c":"REPL",     "id":7360102, "ctx":"LogicalSessionCacheRefresh","msg":"Added oplog entry for create to transaction","attr":{"namespace":"config.$cmd","uuid":{"uuid":{"$uuid":"e7845007-46de-4e79-bfae-5f3f2c0f7219"}},"object":{"create":"system.sessions","idIndex":{"v":2,"key":{"_id":1},"name":"_id_"}}}}
{"t":{"$date":"2024-05-11T03:10:25.255+00:00"},"s":"I",  "c":"REPL",     "id":7360100, "ctx":"LogicalSessionCacheRefresh","msg":"Added oplog entry for createIndexes to transaction","attr":{"namespace":"config.$cmd","uuid":{"uuid":{"$uuid":"e7845007-46de-4e79-bfae-5f3f2c0f7219"}},"object":{"createIndexes":"system.sessions","v":2,"key":{"lastUse":1},"name":"lsidTTLIndex","expireAfterSeconds":1800}}}
{"t":{"$date":"2024-05-11T03:10:25.265+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"e7845007-46de-4e79-bfae-5f3f2c0f7219"}},"namespace":"config.system.sessions","index":"_id_","ident":"index-5-8856531098339113795","collectionIdent":"collection-4-8856531098339113795","commitTimestamp":null}}
{"t":{"$date":"2024-05-11T03:10:25.265+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"e7845007-46de-4e79-bfae-5f3f2c0f7219"}},"namespace":"config.system.sessions","index":"lsidTTLIndex","ident":"index-6-8856531098339113795","collectionIdent":"collection-4-8856531098339113795","commitTimestamp":null}}
{"t":{"$date":"2024-05-11T03:11:25.183+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1715397085,"ts_usec":183310,"thread":"1:0x7f9d8d2dc640","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":6,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 34, snapshot max: 34 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 1"}}}
{"t":{"$date":"2024-05-11T03:11:52.775+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.21.0.4:49540","uuid":{"uuid":{"$uuid":"10e5dbd0-59ef-456c-9c44-582a0edd2b0b"}},"connectionId":1,"connectionCount":1}}
{"t":{"$date":"2024-05-11T03:11:52.803+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn1","msg":"client metadata","attr":{"remote":"172.21.0.4:49540","client":"conn1","negotiatedCompressors":[],"doc":{"driver":{"name":"mongo-java-driver","version":"3.8.2"},"os":{"type":"Linux","name":"Linux","architecture":"amd64","version":"6.6.22-linuxkit"},"platform":"Java/AdoptOpenJDK/11.0.2+9"}}}
{"t":{"$date":"2024-05-11T03:11:52.840+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn1","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":36}}
```

### #( 05/10/24@11:27PM )( donbuddenbaum@donbs-imac ):~/Documents/knote-java@master✗✗✗
   docker run \
  --name=minio \
  --rm \
  --network=knote \
  -e MINIO_ACCESS_KEY=mykey \
  -e MINIO_SECRET_KEY=mysecret \
  minio/minio server /data

```
WARNING: MINIO_ACCESS_KEY and MINIO_SECRET_KEY are deprecated.
         Please use MINIO_ROOT_USER and MINIO_ROOT_PASSWORD
Formatting 1st pool, 1 set(s), 1 drives per set.
WARNING: Host local has more than 0 drives of set. A host failure will result in data becoming unavailable.
MinIO Object Storage Server
Copyright: 2015-2024 MinIO, Inc.
License: GNU AGPLv3 - https://www.gnu.org/licenses/agpl-3.0.html
Version: RELEASE.2024-05-10T01-41-38Z (go1.22.3 linux/amd64)

API: http://172.21.0.3:9000  http://127.0.0.1:9000
WebUI: http://172.21.0.3:36049 http://127.0.0.1:36049

Docs: https://min.io/docs/minio/linux/index.html
Status:         1 Online, 0 Offline.
STARTUP WARNINGS:
- The standard parity is set to 0. This can lead to data loss.
```

### #( 05/10/24@11:27PM )( donbuddenbaum@donbs-imac ):~/Documents/knote-java/04-05@master✗✗✗
   docker run \
  --name=knote-java \
  --rm \
  --network=knote \
  -p 8080:8080 \
  -e MONGO_URL=mongodb://mongo:27017/dev \
  -e MINIO_ACCESS_KEY=mykey \
  -e MINIO_SECRET_KEY=mysecret \
  -e MINIO_HOST=minio \
  donb4iu/knote-java:2.0.0

```
Picked up JAVA_TOOL_OPTIONS:

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.1.6.RELEASE)

2024-05-11 03:29:14.585  INFO 1 --- [           main] io.learnk8s.knote.KnoteJavaApplication   : Starting KnoteJavaApplication v1.0.0 on 732b0d8774f2 with PID 1 (/opt/app.jar started by root in /opt)
2024-05-11 03:29:14.605  INFO 1 --- [           main] io.learnk8s.knote.KnoteJavaApplication   : No active profile set, falling back to default profiles: default
2024-05-11 03:29:16.400  INFO 1 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Bootstrapping Spring Data repositories in DEFAULT mode.
2024-05-11 03:29:16.497  INFO 1 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Finished Spring Data repository scanning in 88ms. Found 1 repository interfaces.
2024-05-11 03:29:17.652  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
2024-05-11 03:29:17.727  INFO 1 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2024-05-11 03:29:17.728  INFO 1 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet engine: [Apache Tomcat/9.0.21]
2024-05-11 03:29:17.895  INFO 1 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2024-05-11 03:29:17.896  INFO 1 --- [           main] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 3192 ms
2024-05-11 03:29:18.565  INFO 1 --- [           main] org.mongodb.driver.cluster               : Cluster created with settings {hosts=[mongo:27017], mode=SINGLE, requiredClusterType=UNKNOWN, serverSelectionTimeout='30000 ms', maxWaitQueueSize=500}
2024-05-11 03:29:18.727  INFO 1 --- [l'}-mongo:27017] org.mongodb.driver.connection            : Opened connection [connectionId{localValue:1}] to mongo:27017
2024-05-11 03:29:18.735  INFO 1 --- [l'}-mongo:27017] org.mongodb.driver.cluster               : Monitor thread successfully connected to server with description ServerDescription{address=mongo:27017, type=STANDALONE, state=CONNECTED, ok=true, version=ServerVersion{versionList=[7, 0, 9]}, minWireVersion=0, maxWireVersion=21, maxDocumentSize=16777216, logicalSessionTimeoutMinutes=30, roundTripTimeNanos=4861925}
> Minio initialized!
2024-05-11 03:29:20.207  INFO 1 --- [           main] o.s.s.concurrent.ThreadPoolTaskExecutor  : Initializing ExecutorService 'applicationTaskExecutor'
2024-05-11 03:29:20.421  INFO 1 --- [           main] o.s.b.a.w.s.WelcomePageHandlerMapping    : Adding welcome page template: index
2024-05-11 03:29:20.805  INFO 1 --- [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 2 endpoint(s) beneath base path '/actuator'
2024-05-11 03:29:20.926  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
2024-05-11 03:29:20.933  INFO 1 --- [           main] io.learnk8s.knote.KnoteJavaApplication   : Started KnoteJavaApplication in 7.411 seconds (JVM running for 8.585)
2024-05-11 03:30:05.190  INFO 1 --- [nio-8080-exec-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring DispatcherServlet 'dispatcherServlet'
2024-05-11 03:30:05.191  INFO 1 --- [nio-8080-exec-1] o.s.web.servlet.DispatcherServlet        : Initializing Servlet 'dispatcherServlet'
2024-05-11 03:30:05.214  INFO 1 --- [nio-8080-exec-1] o.s.web.servlet.DispatcherServlet        : Completed initialization in 23 ms
2024-05-11 03:30:05.342  INFO 1 --- [nio-8080-exec-1] org.mongodb.driver.connection            : Opened connection [connectionId{localValue:2}] to mongo:27017
```

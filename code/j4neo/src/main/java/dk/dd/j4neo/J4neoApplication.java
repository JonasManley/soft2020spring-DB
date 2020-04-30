package dk.dd.j4neo;
// https://neo4j.com/developer/spring-data-neo4j/

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.neo4j.repository.config.EnableNeo4jRepositories;

@SpringBootApplication (scanBasePackages={"dk.dd.j4neo"})
@EnableNeo4jRepositories("dk.dd.j4neo.repository")
public class J4neoApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(J4neoApplication.class, args);
    }
}

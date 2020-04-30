package dk.dd.j4neo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import org.neo4j.ogm.annotation.*;

import java.util.ArrayList;
import java.util.List;

@NodeEntity
@Data
public class Person
{
    @Id
    @GeneratedValue
    private Long id;

    private String name;
    @Property("born")
    private int birthyear;

    @JsonIgnoreProperties("person")
    @Relationship(type = "ACTED_IN")
    private List<Role> actedIn = new ArrayList<>();

    @JsonIgnoreProperties({"actors", "directors"})
    @Relationship(type = "DIRECTED")
    private List<Movie> directed = new ArrayList<>();

    public Person() { }

    public Person(String name, int birthyear)
    {
        this.name = name;
        this.birthyear = birthyear;
    }

}


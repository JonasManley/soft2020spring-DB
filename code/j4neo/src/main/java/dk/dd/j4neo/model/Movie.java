package dk.dd.j4neo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import org.neo4j.ogm.annotation.*;

import java.util.ArrayList;
import java.util.List;

import static org.neo4j.ogm.annotation.Relationship.INCOMING;

@Data
@NodeEntity
public class Movie
{
    @Id
    @GeneratedValue
    private Long id;

    private String title;
    private int released;
    @Property("tagline")
    private String description;

    @JsonIgnoreProperties("movie")
    @Relationship(type = "ACTED_IN", direction = INCOMING)
    private List<Role> roles;

    @JsonIgnoreProperties({"actedIn", "directed"})
    @Relationship(type = "DIRECTED", direction = INCOMING)
    private List<Person> directors = new ArrayList<>();

    public Movie() { }

    public Movie(String title, int released, String tagline)
    {
        this.title = title;
        this.released = released;
        this.description = tagline;
    }
}

package dk.dd.j4neo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import org.neo4j.ogm.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Data
@RelationshipEntity(type = "ACTED_IN")
public class Role
{
    @Id
    @GeneratedValue
    private Long id;

    private List<String> roles = new ArrayList<>();

    @StartNode
    @JsonIgnoreProperties({"actedIn", "directed"})
    private Person person;

    @EndNode
    @JsonIgnoreProperties({"actors", "directors"})
    private Movie movie;
}

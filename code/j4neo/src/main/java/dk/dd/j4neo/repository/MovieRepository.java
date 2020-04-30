package dk.dd.j4neo.repository;

import org.springframework.data.neo4j.annotation.Query;
import org.springframework.data.neo4j.repository.Neo4jRepository;
import dk.dd.j4neo.model.Movie;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.Collection;

@RepositoryRestResource(collectionResourceRel = "movies", path = "movies")
public interface MovieRepository extends Neo4jRepository<Movie, Long>
{
    Movie getMovieByTitle(String title);

    Iterable<Movie> findMovieByTitleLike(String title);

    @Query("MATCH (m:Movie)<-[r:ACTED_IN]-(a:Person) RETURN m,r,a LIMIT $props")
    Collection<Movie> graph(@Param("props") int limit);
}

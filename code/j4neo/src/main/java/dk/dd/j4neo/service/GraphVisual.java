package dk.dd.j4neo.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import dk.dd.j4neo.model.Movie;
import dk.dd.j4neo.model.Role;
import dk.dd.j4neo.repository.MovieRepository;
import java.util.*;

@Service
public class GraphVisual
{
        private final static Logger LOG = LoggerFactory.getLogger(GraphVisual.class);

        private final MovieRepository movieRepository;
        public GraphVisual(MovieRepository movieRepository)
        {
            this.movieRepository = movieRepository;
        }

        private Map<String, Object> toD3Format(Collection<Movie> movies)
        {
            List<Map<String, Object>> nodes = new ArrayList<>();
            List<Map<String, Object>> rels = new ArrayList<>();
            int i = 0;
            Iterator<Movie> result = movies.iterator();
            while (result.hasNext())
            {
                Movie movie = result.next();
                nodes.add(map("title", movie.getTitle(), "label", "movie"));
                int target = i;
                i++;
                for (Role role : movie.getRoles())
                {
                    Map<String, Object> actor = map("title", role.getPerson().getName(), "label", "actor");
                    int source = nodes.indexOf(actor);
                    if (source == -1)
                    {
                        nodes.add(actor);
                        source = i++;
                    }
                    rels.add(map("source", source, "target", target));
                }
            }
            return map("nodes", nodes, "links", rels);
        }

        private Map<String, Object> map(String key1, Object value1, String key2, Object value2)
        {
            Map<String, Object> result = new HashMap<String, Object>(2);
            result.put(key1, value1);
            result.put(key2, value2);
            return result;
        }
// n0t working
        @Transactional(readOnly = true)
        public Movie findByTitle(String title) {
            Movie result = movieRepository.getMovieByTitle(title);
            return result;
        }

        @Transactional(readOnly = true)
        public Collection<Movie> findByTitleLike(String title)
        {
            Collection<Movie> result = (Collection<Movie>) movieRepository.findMovieByTitleLike(title);
            return result;
        }

        @Transactional(readOnly = true)
        public Map<String, Object>  graph(int limit)
        {
            Collection<Movie> result = movieRepository.graph(limit);
            return toD3Format(result);
        }
}

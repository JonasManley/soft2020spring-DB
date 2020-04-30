package dk.dd.j4neo.controllers;

import dk.dd.j4neo.service.GraphVisual;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import dk.dd.j4neo.model.*;
import dk.dd.j4neo.repository.*;

import java.util.Collection;
import java.util.Map;

@RestController
@RequestMapping("/movies")
public class MovieController
{
        //private final GraphVisual movieService;
        private static MovieRepository movieRepository;

        public MovieController(MovieRepository movieRepository)
        {
            this.movieRepository = movieRepository;
        }

        @GetMapping
        public Iterable<Movie> findAll()
        {
            return movieRepository.findAll();
        }

        @GetMapping("/{title}")
        public Movie getMovieByTitle(@PathVariable String title)
        {
            return movieRepository.getMovieByTitle(title);
        }

        @GetMapping("/search/{title}")
        public Iterable<Movie> findMovieByTitleLike(@PathVariable String title)
        {
            return movieRepository.findMovieByTitleLike(title);
        }

        @GetMapping("/graph")
        public Collection<Movie> graph(@RequestParam(value = "limit", required = false) Integer limit)
        {
                Collection<Movie> result = movieRepository.graph(limit == null ? 100 : limit);
                return result;
        }
}

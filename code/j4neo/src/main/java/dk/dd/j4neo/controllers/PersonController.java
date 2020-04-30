package dk.dd.j4neo.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import dk.dd.j4neo.model.Person;
import dk.dd.j4neo.repository.PersonRepository;
import java.util.List;

@RestController
@RequestMapping("/persons")
public class PersonController
{
        private final PersonRepository personRepository;

        public PersonController(PersonRepository personRepository)
        {
            this.personRepository = personRepository;
        }

        @GetMapping
        public Iterable<Person> findAllPersons()
        { return personRepository.findAll(); }

        @GetMapping("/{name}")
        public Person getPersonByName(@PathVariable String name)
        {
            return personRepository.getPersonByName(name);
        }

        @GetMapping("/search/{name}")
        public Iterable<Person> findPersonByNameLike(@PathVariable String name)
        {
            return personRepository.findPersonByNameLike(name);
        }

        @GetMapping("/actanddirect")
        public List<Person> getPersonsWhoActAndDirect()
        {
            return personRepository.getPersonsWhoActAndDirect();
        }
}

package com.knf.dev.demo.springboothelloworld.todos;

import org.springframework.data.repository.CrudRepository;

public interface TodoRepository extends CrudRepository<Todo, Long> {
}

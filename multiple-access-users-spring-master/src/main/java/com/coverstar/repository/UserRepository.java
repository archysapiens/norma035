package com.coverstar.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.coverstar.model.User;

import java.lang.String;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

	Optional<User> findByUsernameOrEmail(String username, String email);

	Optional<User> findByEmail(String email);

	Optional<User> findByUsername(String username);
}
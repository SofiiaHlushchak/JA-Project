package selectionCommitee.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import selectionCommitee.domain.Entrant;




public interface EntrantRepository extends JpaRepository<Entrant, Integer>{

}
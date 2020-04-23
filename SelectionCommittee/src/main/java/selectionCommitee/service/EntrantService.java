package selectionCommitee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import selectionCommitee.domain.Entrant;
import selectionCommitee.repository.EntrantRepository;

@Service
public class EntrantService {
	
	@Autowired
	private EntrantRepository entrantRepository;
	
	public Entrant save(Entrant entrant) {
		return entrantRepository.save(entrant);
	}
	
	public List<Entrant> getAllEntants(){
		return entrantRepository.findAll();
	}

}

package selectionCommitee.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import selectionCommitee.domain.Entrant;
import selectionCommitee.repository.EntrantRepository;

@Service
public class EntrantService {
	
	private Logger logger =LoggerFactory.getLogger(EntrantService.class);
	
	@Autowired
	private EntrantRepository entrantRepository;
	
	public Entrant save(Entrant entrant) {
		logger.debug("Successfull saved entrant: " + entrant.getFirstName() + " " + entrant.getLastName());
		return entrantRepository.save(entrant);
	}
	
	public List<Entrant> getAllEntants(){
		logger.debug("Get all entrants");
		return entrantRepository.findAll();
	}
	
	public List<Entrant> sortedEntants(){
		logger.debug("Get sorted (success) entrants");
		return entrantRepository.findAll(Sort.by(Sort.Direction.DESC, "totalMark"));
	}


}

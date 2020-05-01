package selectionCommitee.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import selectionCommitee.domain.User;
import selectionCommitee.repository.UserRepository;

@Service
public class UserService {

	private Logger logger =LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PasswordEncoder bCryptPasswordEncoder;

	public void save(User user) {
		logger.debug("Added new user: " + user.getName() + " " + user.getSurname());
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setPasswordConfirm(bCryptPasswordEncoder.encode(user.getPasswordConfirm()));
//		user.setRole(user.getRole());
		
		userRepository.save(user);
	}
	
	public User findUserByEmail(String email) {
		logger.debug("Find user by email: " + email);
		return userRepository.findByEmail(email).get();
	}


}

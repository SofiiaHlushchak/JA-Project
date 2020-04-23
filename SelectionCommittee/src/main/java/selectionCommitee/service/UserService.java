package selectionCommitee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import selectionCommitee.domain.User;
import selectionCommitee.domain.UserRoles;
import selectionCommitee.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PasswordEncoder bCryptPasswordEncoder;

	public void save(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setPasswordConfirm(bCryptPasswordEncoder.encode(user.getPasswordConfirm()));
		user.setRole(UserRoles.ROLE_USER);
		userRepository.save(user);
	}
	
	public User findUserByEmail(String email) {
		return userRepository.findByEmail(email).get();
	}
}

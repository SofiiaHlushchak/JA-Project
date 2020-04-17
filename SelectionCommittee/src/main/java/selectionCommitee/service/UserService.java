package selectionCommitee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import selectionCommitee.dao.UserRepository;
import selectionCommitee.domain.User;
import selectionCommitee.domain.UserRoles;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PasswordEncoder bCryptPasswordEncoder;

	public void save(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setRole(UserRoles.ROLE_USER);
		userRepository.save(user);
	}
}

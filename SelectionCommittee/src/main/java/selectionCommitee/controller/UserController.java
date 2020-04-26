package selectionCommitee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import selectionCommitee.domain.User;
import selectionCommitee.service.EntrantService;
import selectionCommitee.service.UserService;



@Controller
public class UserController {
	
    @Autowired
    private UserService userService;

    
    @Autowired
    private EntrantService entrantService;


    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return "registration";
        }
        System.out.println(userForm.getRole());
        if(userForm.getRole().toString().equals("Admin")) {
        	userForm.setRole("ROLE_ADMIN");
        	userService.save(userForm);
        }
        else {
        	userForm.setRole("ROLE_USER");
        	userService.save(userForm);
        }
        


        return "redirect:/home";
    }

    @RequestMapping(value = {"/", "/login"}, method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value ="/home", method = RequestMethod.GET)
    public ModelAndView welcome() {
    	ModelAndView map = new ModelAndView("home");
		map.addObject("entrants", entrantService.getAllEntants());
		
    	return map;
    }
    
    @RequestMapping(value ="/create-entrant", method = RequestMethod.GET)
    public String createEntrant() {
//        return new ModelAndView("createEntrant", "entrant", new Entrant());
    	return "createEntrant";
    }

}
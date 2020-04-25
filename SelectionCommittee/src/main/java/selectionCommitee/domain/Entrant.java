package selectionCommitee.domain;

import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "entrant")
public class Entrant {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	private String firstName;
	private String lastName;
	
	@Column( name="total_mark")
	private Integer totalMark;
	
	 public Integer getTotalMark() {
		return totalMark;
	}

	public void setTotalMark(Integer totalMark) {
		this.totalMark = totalMark;
	}

	@ManyToOne()
	 @JoinColumn(name = "fk_faculty")
	private Faculty faculty;
	 
	@Column( name="first_subject")
	private Integer award_first_subject;
	
	@Column( name="second_subject")
	private Integer award_second_subject;
	
	@Column( name="third_subject")
	private Integer award_third_subject;
	
	@Column( name="fourth_subject")
	private Integer award_fourth_subject;
	
	public Integer getAward_first_subject() {
		return award_first_subject;
	}

	public void setAward_first_subject(Integer award_first_subject) {
		this.award_first_subject = award_first_subject;
	}

	public Integer getAward_second_subject() {
		return award_second_subject;
	}

	public void setAward_second_subject(Integer award_second_subject) {
		this.award_second_subject = award_second_subject;
	}

	public Integer getAward_third_subject() {
		return award_third_subject;
	}

	public void setAward_third_subject(Integer award_third_subject) {
		this.award_third_subject = award_third_subject;
	}

	public Integer getAward_fourth_subject() {
		return award_fourth_subject;
	}

	public void setAward_fourth_subject(Integer award_fourth_subject) {
		this.award_fourth_subject = award_fourth_subject;
	}

	@ElementCollection(targetClass = Subjects.class)
	@CollectionTable(name="EntrantSubjects", joinColumns = @JoinColumn(name="ENTRANT_ID") ) 
	@Column( name="Subjects", nullable=false ) 
	private List<Subjects> subjects;

	@Lob
	private String encodedImage;
	
	public Entrant() {
		super();
	}

	public Entrant(Integer id, String firstName, String lastName, Faculty faculty, List<Subjects> subjects, Integer firstSubject, Integer secondSubject, Integer thirdSubject, Integer fourthSubject) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.faculty = faculty;
		this.subjects = subjects;
		this.award_first_subject = firstSubject;
		this.award_second_subject = secondSubject;
		this.award_third_subject = thirdSubject;
		this.award_fourth_subject = fourthSubject;
	}

	public Entrant(String firstName, String lastName, Faculty faculty, List<Subjects> subjects) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.faculty = faculty;
		this.subjects = subjects;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Faculty getFaculty() {
		return faculty;
	}

	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}

	public List<Subjects> getSubjects() {
		return subjects;
	}

	public void setSubjects(List<Subjects> subjects) {
		this.subjects = subjects;
	}

	public String getEncodedImage() {
		return encodedImage;
	}

	public void setEncodedImage(String encodedImage) {
		this.encodedImage = encodedImage;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((faculty == null) ? 0 : faculty.hashCode());
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((subjects == null) ? 0 : subjects.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Entrant other = (Entrant) obj;
		if (faculty == null) {
			if (other.faculty != null)
				return false;
		} else if (!faculty.equals(other.faculty))
			return false;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (subjects == null) {
			if (other.subjects != null)
				return false;
		} else if (!subjects.equals(other.subjects))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Entrant [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", faculty=" + faculty
				+ ", subjects=" + subjects + "]";
	}
	
}

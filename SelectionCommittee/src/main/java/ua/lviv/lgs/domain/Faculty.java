package ua.lviv.lgs.domain;

import java.util.List;


public class Faculty {
	private Integer id;
	private FacultyName name;
	private int qtyOfStudents;
	private List<Subjects> subjects;
	
	public Faculty() {
	}

	public Faculty(Integer id, FacultyName name, int qtyOfStudents, List<Subjects> subjects) {
		super();
		this.id = id;
		this.name = name;
		this.qtyOfStudents = qtyOfStudents;
		this.subjects = subjects;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public FacultyName getName() {
		return name;
	}

	public void setName(FacultyName name) {
		this.name = name;
	}

	public int getQtyOfStudents() {
		return qtyOfStudents;
	}

	public void setQtyOfStudents(int qtyOfStudents) {
		this.qtyOfStudents = qtyOfStudents;
	}

	public List<Subjects> getSubjects() {
		return subjects;
	}

	public void setSubjects(List<Subjects> subjects) {
		this.subjects = subjects;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + qtyOfStudents;
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
		Faculty other = (Faculty) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (name != other.name)
			return false;
		if (qtyOfStudents != other.qtyOfStudents)
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
		return "Faculty [id=" + id + ", name=" + name + ", qtyOfStudents=" + qtyOfStudents + ", subjects=" + subjects
				+ "]";
	}
	
	
	
}

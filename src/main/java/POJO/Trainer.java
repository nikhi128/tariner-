package POJO;

public class Trainer {
    private int empId;
    private String name;
    private String subject;

    // No-arg constructor
    public Trainer() {
    }

    // All-arg constructor
    public Trainer(int empId, String name, String subject) {
        this.empId = empId;
        this.name = name;
        this.subject = subject;
    }

    // Getters and Setters
    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    @Override
    public String toString() {
        return "Trainer{" +
                "empId=" + empId +
                ", name='" + name + '\'' +
                ", subject='" + subject + '\'' +
                '}';
    }
}

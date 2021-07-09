package observer;

public class Employee extends Subject{
    private String eid;
    private String name;
    private int salary;

    public Employee() {
    }

    public Employee(String eid, String name, int salary) {
        this.eid = eid;
        this.name = name;
        this.salary = salary;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        System.out.println("Updating eid of employee");
        this.eid = eid;
        notifyViews();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        System.out.println("Updating name of employee");
        this.name = name;
        notifyViews();
       }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        System.out.println("Updating salary of employee");
        this.salary = salary;
        notifyViews();
    }

    @Override
    public String toString() {
        return "Employee{" + "eid=" + eid + ", name=" + name + ", salary=" + salary + '}';
    }
}
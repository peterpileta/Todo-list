package org.example.module6;
import jakarta.persistence.*;

@Entity
@Table(name = "todo_items")
public class ToDoItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "task", nullable = false)
    private String task;
    public ToDoItem() {}  // Default constructor required by Hibernate
    public ToDoItem(String task) {
        this.task = task;
    }
    public int getId() {
        return id;
    }
    public String getTask() {
        return task;
    }
    public void setTask(String task) {
        this.task = task;
    }
}

package com.example.taskmanagementservice.models;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "executors")
public class Executor {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private long id;
    @ManyToOne
    @JoinColumn(name = "username")
    private User usernames;
    @ManyToOne
    @JoinColumn(name = "task_id")
    private Task tasks;
}

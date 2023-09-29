package com.haconghieu.inputstudenttodatabase.student;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "student")
@Data
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    //private Long id;
    private String student_ID;
    private String student_name;
    private String student_email;


    public Student(String student_ID, String student_name, String student_email) {
        this.student_ID = student_ID;
        this.student_name = student_name;
        this.student_email = student_email;
    }

    public Student() {

    }
}
